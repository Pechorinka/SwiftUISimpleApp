//
//  ContentView.swift
//  FirstHomeworkOtus
//
//  Created by Tatyana Sidoryuk on 05.03.2023.
//

import SwiftUI

struct MainTabView: View {
    
    @State var tab: Tab = .first
    
    var body: some View {
        TabView(selection: $tab) {
            FirstScreen(tab: $tab)
                .tabItem{
                    Image(systemName: "1.square.fill")
                    Text("Первый") }
                            .tag(Tab.first)
                
            SecondScreen()
                .tabItem{
                    Image(systemName: "2.square.fill")
                    Text("Второй") }
                            .tag(Tab.second)
                
            ThirdScreen()
                .tabItem {
                    Image(systemName: "3.square.fill")
                    Text ("Третий") }
                            .tag(Tab.third)
        }
    }
    
    struct MainTabView_Previews: PreviewProvider {
        static var previews: some View {
            MainTabView()
        }
    }
}

enum Tab {
    case first
    case second
    case third
}
