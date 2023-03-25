//
//  ThirdScreen.swift
//  FirstHomeworkOtus
//
//  Created by Tatyana Sidoryuk on 06.03.2023.
//

import SwiftUI

struct ProfileScreen: View {
    
  @State var isModal: Bool = false
  @State private var tab: Tab = .third

    var body: some View {
        VStack{
            Group {
                Text("Профиль")
                Button {
                    isModal.toggle()

                } label: {
                    Text("Настройки")
                }
                .buttonStyle(.borderedProminent)
                .sheet(isPresented: $isModal) {
                    Text("Здесь будут настройки")
                }
            }
        }
    }
}

struct ThirdScreen_Previews: PreviewProvider {
    static var previews: some View {
        ProfileScreen()
    }
}
