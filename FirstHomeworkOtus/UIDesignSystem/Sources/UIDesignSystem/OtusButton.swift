//
//  OtusButton.swift
//  
//
//  Created by Tatyana Sidoryuk on 20.03.2023.
//

import SwiftUI

public struct OtusButton<Content>: View where Content: View{
   
    private let action: ()->Void
    private let color: Color
    private let content: ()->Content
    
    @State var backgroundOpacity: Double = 1
    
    public init(color: Color, action: @escaping () -> Void, @ViewBuilder content: @escaping () -> Content) {
        self.color = color
        self.action = action
        self.content = content
    }
    
    public var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 6)
                .foregroundColor(color)
                .opacity(backgroundOpacity)
            HStack {
                self.content()
            }
            .padding(.horizontal, 14)
            .padding(.vertical, 14)
        }
        .fixedSize(horizontal: true, vertical: true)
        .gesture(
            DragGesture(minimumDistance: 0.0, coordinateSpace: .global)
                .onChanged { _ in
                    print(">> touch down")
                    withAnimation {
                        backgroundOpacity = 0.5
                    }
                }
                .onEnded{ _ in
                        print("<< touch up")
                        backgroundOpacity = 1
                    }
            )
    }
}


struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            OtusButton(color: .yellow)   {} content: {
                Text ("My Button")
                    .foregroundColor(.blue)
            }
            OtusButton(color: .green)   {} content: {
                Text ("My Button")
                    .foregroundColor(.blue)
            }
        }
    }
}
