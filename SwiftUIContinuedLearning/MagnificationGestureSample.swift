//
//  MagnificationGestureSample.swift
//  SwiftUIContinuedLearning
//
//  Created by 0x2ab70001b1 on 2023/8/7.
//

import SwiftUI

struct MagnificationGestureSample: View {
    
    @State var currentValue: CGFloat = 0
    @State var lastValue: CGFloat = 0
    
    var body: some View {
//                Text("Hello, World!")
//                    .foregroundColor(.white)
//                    .font(.largeTitle)
//                    .padding(40)
//                    .background(Color.orange)
//                    .cornerRadius(10)
//                    .scaleEffect(1 + currentValue + lastValue)
//                    .gesture(
//                        MagnificationGesture()
//                            .onChanged { value in
//                                currentValue = value - 1
//                            }
//                            .onEnded { value in
//                                lastValue += currentValue
//                                currentValue = 0
//                            }
//                    )
        
        VStack {
            HStack {
                Circle()
                    .frame(width: 35, height: 35)
                Text("SwiftUI tutorial")
                Spacer()
                Image(systemName: "ellipsis")
            }
            .padding(.horizontal)

            Rectangle()
                .fill()
                .frame(height: 300)
                .scaleEffect(1 + currentValue)
                .gesture(
                    MagnificationGesture()
                        .onChanged { value in
                            currentValue = value
                        }
                        .onEnded { value in
                            withAnimation(.spring()) {
                                currentValue = 0
                            }
                        }
                )
            HStack {
                Image(systemName: "heart.fill")
                Image(systemName: "text.bubble.fill")
                Spacer()
            }
            .font(.headline)
            .padding(.horizontal)
            Text("This is my post first phone")
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.horizontal)
        }
    }
}

struct MagnificationGestureSample_Previews: PreviewProvider {
    static var previews: some View {
        MagnificationGestureSample()
    }
}
