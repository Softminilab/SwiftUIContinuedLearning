//
//  ScrollViewReaderSample.swift
//  SwiftUIContinuedLearning
//
//  Created by 0x2ab70001b1 on 2023/8/9.
//

import SwiftUI

struct ScrollViewReaderSample: View {
        @State var textFiledText: String = ""
        @State var scrollToIndex: Int = 0
    
        var body: some View {
            VStack {
                VStack {
    
                    TextField("Input a number", text: $textFiledText)
                        .font(.largeTitle)
                        .keyboardType(.numberPad)
                        .frame(height: 55)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .padding(.horizontal)
                        .background(Color.green)
    
                    Text("Click me".uppercased())
                        .font(.headline)
                        .foregroundColor(.white)
                        .padding()
                        .background(Color.black.cornerRadius(10))
                        .onTapGesture {
                            if let index = Int(textFiledText) {
                                scrollToIndex = index
                            }
                        }
                }
    
                ScrollView {
                    ScrollViewReader { proxy in
                        ForEach(0..<50) { i in
                            Text("This is #\(i)")
                                .frame(height: 180)
                                .frame(maxWidth: .infinity)
                                .background()
                                .cornerRadius(10)
                                .shadow(radius: 10)
                                .padding()
                                .id(i)
                        }
                        .onChange(of: scrollToIndex) { newValue in
                            withAnimation(.spring()) {
                                proxy.scrollTo(newValue)
                            }
                        }
                    }
                }
            }
        }
}

struct ScrollViewReaderSample_Previews: PreviewProvider {
    static var previews: some View {
        ScrollViewReaderSample()
    }
}

//func color(fraction: Double) -> Color {
//     Color(red: fraction, green: 1 - fraction, blue: 0.9)
//}
