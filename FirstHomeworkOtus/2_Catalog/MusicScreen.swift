//
//  MusicScreen.swift
//  FirstHomeworkOtus
//
//  Created by Tatyana Sidoryuk on 06.03.2023.
//

import SwiftUI

struct MusicScreen: View {
    
    let name: String
    
    var body: some View {
        Text(name).font(.system(size: 50))    }
}

struct MusicScreen_Previews: PreviewProvider {
    static var previews: some View {
        MusicScreen(name: "Детали")
    }
}
