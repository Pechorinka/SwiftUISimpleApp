//
//  DashboardScreen.swift
//  FirstHomeworkOtus
//
//  Created by Tatyana Sidoryuk on 20.03.2023.
//

import SwiftUI
import UIDesignSystem

struct DashboardScreen: View {
    var body: some View {
        NavigationStackView(transition: .custom(AnyTransition.moveAndFade))
                                                {
            FirstView()
        }

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
