//
//  LongPressGestureSample.swift
//  SwiftUIContinuedLearning
//
//  Created by 0x2ab70001b1 on 2023/8/6.
//

import SwiftUI

struct LongPressGestureSample: View {
    @State var isComplete: Bool = false
    @State var isSuccess: Bool = false
    
    var body: some View {
        //        Text(isComplete ? "Completed" : "No complete")
        //            .font(.title2)
        //            .padding()
        //            .padding(.horizontal, 10)
        //            .background(isComplete ? Color.green : Color.gray)
        //            .cornerRadius(10)
        //            .onLongPressGesture {
        //                isComplete.toggle()
        //            }
        
        VStack(spacing: 30) {
            Rectangle()
                .fill(isSuccess ? Color.green : Color.blue)
                .frame(maxWidth: isComplete ? .infinity : 0)
                .frame(height: 60)
                .frame(maxWidth: .infinity, alignment: .leading)
                .background(Color.gray)
                .cornerRadius(60/2)
            
            HStack {
                Text("Long Press Me")
                    .foregroundColor(.white)
                    .padding()
                    .background(Color.black)
                    .cornerRadius(10)
                    .onLongPressGesture(
                        minimumDuration: 1.0,
                        maximumDistance: 50,
                        pressing: { flg in
                            if flg {
                                withAnimation(.easeIn(duration: 1.0)) {
                                    isComplete = true
                                }
                            } else {
                                DispatchQueue.main.asyncAfter(deadline: .now() + 0.1, execute: {
                                    if !isSuccess {
                                        withAnimation(.easeInOut) {
                                            isComplete = false
                                        }
                                    }
                                })
                            }
                        }, perform: {
                            isSuccess = true
                        })
                
                Text("Rest")
                    .foregroundColor(.white)
                    .padding()
                    .background(Color.black)
                    .cornerRadius(10)
                    .onTapGesture {
                        isSuccess = false
                        isComplete = false
                    }
            }
        }
        .padding()
    }
}

struct LongPressGestureSample_Previews: PreviewProvider {
    static var previews: some View {
        LongPressGestureSample()
    }
}
