//
//  ContentView.swift
//  FirstHomeworkOtus
//
//  Created by Tatyana Sidoryuk on 05.03.2023.
//

import SwiftUI

struct ContentView: View {
    
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
                
            ProfileScreen()
                .tabItem {
                    Image(systemName: "3.square.fill")
                    Text ("Третий") }
                            .tag(Tab.third)
            NewsScreen()
                .tabItem {
                    Image(systemName: "4.square.fill")
                    Text ("Четвертый") }
                            .tag(Tab.fourth)
            DashboardScreen()
                .tabItem {
                    Image(systemName: "5.square.fill")
                    Text ("Пятый") }
                            .tag(Tab.fifth)
                
            
        }
    }
    
    struct MainTabView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView()
        }
    }
}

enum Tab {
    case first
    case second
    case third
    case fourth
    case fifth
}
