//
//  NewsModel.swift
//  FirstHomeworkOtus
//
//  Created by Tatyana Sidoryuk on 16.03.2023.
//

import SwiftUI
import Networking

extension Article: Identifiable {
    public var id: String {url}
}

final class FirstNewsViewModel: ObservableObject {
    @Published var articles: [Article] = .init()
    
    init() {
        ArticlesAPI.everythingGet(q: "Apple VR", from: "2023-03-01", sortBy: "PublishedAt", language: "en", apiKey: "d6aba26f42ba4a8fb042ceba1d36cf03") { data, error in
            debugPrint(error ?? "")
            self.articles = data?.articles ?? []
        }
    }
}

final class SecondNewsViewModel: ObservableObject {
    @Published var articles: [Article] = .init()
    
    init() {
        ArticlesAPI.everythingGet(q: "Tesla", from: "2023-03-01", sortBy: "PublishedAt", language: "en", apiKey: "d6aba26f42ba4a8fb042ceba1d36cf03") { data, error in
            debugPrint(error ?? "")
            self.articles = data?.articles ?? []
        }
    }
}

final class ThirdNewsViewModel: ObservableObject {
    @Published var articles: [Article] = .init()
    
    init() {
        ArticlesAPI.everythingGet(q: "COVID", from: "2023-03-01", sortBy: "PublishedAt", language: "en", apiKey: "d6aba26f42ba4a8fb042ceba1d36cf03") { data, error in
            debugPrint(error ?? "")
            self.articles = data?.articles ?? []
        }
    }
}

struct NewsScreen: View {
    
    @StateObject var firstNewsVM: FirstNewsViewModel = .init()
    @StateObject var secondNewsVM: SecondNewsViewModel = .init()
    @StateObject var thirdNewsVM: ThirdNewsViewModel = .init()
    
    var listOptions = ["Tesla", "Apple VR", "COVID"]
    @State var listVariant = 0
    @State var isFavourite = false

    var body: some View {

            VStack {
                
                Picker ("Options", selection: $listVariant) {
                    ForEach(0..<listOptions.count, id: \.self) { index in
                        Text(self.listOptions[index])
                            .tag(index)
                    }
                }
                .pickerStyle(SegmentedPickerStyle())

                
                switch listVariant {
                case 0:
                    list1
                case 1:
                    list2
                case 2:
                    list3
                default:
                    EmptyView()
                }
                    
            }
            .padding(.top, 30)
    }
    
    var list1: some View {

        List(firstNewsVM.articles) { article in
                ListArticleCell(title: article.title ?? "", description: article.description ?? "")
        }
    }
    
    var list2: some View {
        List(secondNewsVM.articles) { article in
                ListArticleCell(title: article.title ?? "", description: article.description ?? "")
        }
    }
    
    var list3: some View {
        List(thirdNewsVM.articles) { article in
                ListArticleCell(title: article.title ?? "", description: article.description ?? "")
        }
    }
}

struct ListArticleCell: View {
    let title: String
    let description: String
    @State var isFavourite = false
    
    var body: some View {
        
        HStack {
        ZStack {
            RoundedRectangle (cornerRadius: 20)
                .foregroundColor(.mint)
           
                VStack {
                    Text (title.isEmpty ? description:title)
                        .foregroundColor(.white)
                        .padding()
                }
            }
            Spacer()
               Image(systemName: isFavourite ? "star.fill" : "star")
                .foregroundColor(isFavourite ? .yellow : .gray)
                .rotationEffect(isFavourite ? .degrees(360) : .degrees(0))
                .onTapGesture {
                    withAnimation{
                        self.isFavourite.toggle()
                    }
                }
        }
        .frame(maxWidth: .infinity)
        .frame(height: 200)
    }
    
}


struct NewsModel_Previews: PreviewProvider {
    static var previews: some View {
        NewsScreen()
    }
}
