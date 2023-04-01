//
//  DashboardScreen.swift
//  FirstHomeworkOtus
//
//  Created by Tatyana Sidoryuk on 20.03.2023.
//

import SwiftUI
import UIDesignSystem

struct DashboardScreen: View {
    
    @ObservedObject var model = ViewModel()
    
    var body: some View {
        NavigationStackView(transition: .custom(AnyTransition.moveAndFade))
            {
            FirstView()
            }.onAppear {
                model.setupConfig()
                model.call()
            }

    }
}

class ViewModel: ObservableObject {
    @Injected var analytics: Analytics?
    @Injected var dataStorage: DataStorage?
    @Injected var networkClient: NetworkClient?
    @Injected var parsing: Parsing?
    
    func call() {
        analytics?.performAnalytics()
        dataStorage?.performDataStorage()
        networkClient?.performNetworking()
        parsing?.performParsing()
    }
    
    func setupConfig() {
        ConfigApp.shared.registerAll()
    }
}

struct FirstView: View {
    var body: some View {
        VStack  {
            
            Text ("First")
                .font(.largeTitle)
            OtusButton(color: .black)   {
                debugPrint("something")
            } content: {
                Text ("My Button")
                    .foregroundColor(.blue)
            }
            NavPushButton(destination: SecondView()) {
                Text("Push to 2")
                    .padding()
                    .foregroundColor(.brown)
                    .background(Color.mint)
            }
        }
    }
}

struct SecondView: View {
    var body: some View {
        VStack  {
            Text ("Second")
                .font(.largeTitle)
            NavPopButton(destination: .previous) {
                Text("Go back")
                    .padding()
                    .foregroundColor(.brown)
                    .background(Color.orange)
            }
            NavPushButton(destination: ThirdView()) {
                Text("Push to 3")
                    .padding()
                    .foregroundColor(.brown)
                    .background(Color.mint)
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.indigo)
    }
}

struct ThirdView: View {
    var body: some View {
        VStack  {
            Text ("Third")
                .font(.largeTitle)
            NavPopButton(destination: .previous) {
                Text("Go back")
                    .padding()
                    .foregroundColor(.brown)
                    .background(Color.orange)
            }
            NavPopButton(destination: .root) {
                Text("Go to Root")
                    .padding()
                    .foregroundColor(.brown)
                    .background(Color.mint)
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.indigo)
    }
}

struct DashboardScreen_Previews: PreviewProvider {
    static var previews: some View {
        DashboardScreen()
    }
}
