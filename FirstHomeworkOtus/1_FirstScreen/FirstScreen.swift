//
//  FirstScreen.swift
//  FirstHomeworkOtus
//
//  Created by Tatyana Sidoryuk on 06.03.2023.
//

import SwiftUI

struct FirstScreen: View {
    
    @Binding var tab: Tab
    
    var body: some View {

        VStack{ Text ("Первая вью")
                .font(.largeTitle)

                Button (action: {
                    self.tab = .second
                    })
                {
                Text ("Переход на второй таб")
                    .padding()
                    .background(Color.yellow)
                    .cornerRadius(10)
            }
        }
    }
}

struct DescriptionLabel: UIViewRepresentable { // добавлен UIKit компонент, на текущий момент не используется
    @Binding var content: String

    func makeUIView(context: Context) -> UILabel {
        let label = UILabel()
        label.backgroundColor = #colorLiteral(red: 0.721568644, green: 0.8862745166, blue: 0.5921568871, alpha: 1)
        label.layer.borderColor = #colorLiteral(red: 0.2745098174, green: 0.4862745106, blue: 0.1411764771, alpha: 1)
        label.layer.borderWidth = 2
        return label
    }

    func updateUIView(_ uiView: UILabel, context: Context) {
        uiView.text = content
    }
}
