//
//  ModelView.swift
//  FirstHomeworkOtus
//
//  Created by Tatyana Sidoryuk on 05.03.2023.
//

import SwiftUI

// MARK: - Model

struct Music {
    let name: String
}

extension Music: Identifiable {
    var id: String {
        name
    }
}

// MARK: - View Model

final class MusicListViewModel: ObservableObject {
    @Published private (set) var musics = [
        Music (name: "Рок"),
        Music (name: "Классика"),
        Music (name: "Шансон"),
        Music (name: "Поп")
        ]
}

// MARK: - View

struct SecondScreen: View {
    

    @ObservedObject var musicListVM: MusicListViewModel = .init()
    
    var body: some View {
        NavigationView {
            list
        }
    }
    
    var list: some View {
        List (musicListVM.musics) { music in
            cell(name: music.name)
        }
    }
    
    
    func cell (name: String) -> some View {
        NavigationLink(destination: MusicScreen(name: name)){
            Text(name)
                .font(.largeTitle)
        }
    }
    
}
