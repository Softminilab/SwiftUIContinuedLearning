//
//  DragGestureSample.swift
//  SwiftUIContinuedLearning
//
//  Created by 0x2ab70001b1 on 2023/8/7.
//

import SwiftUI

struct DragGestureSample: View {
//    @State var offset: CGSize = .zero
    @State var offset: CGSize = .zero
    
    var body: some View {
        //        Rectangle()
        //            .fill()
        //            .frame(width: 180, height: 180)
        //            .cornerRadius(25)
        //            .offset(offset)
        //            .gesture(
        //                DragGesture()
        //                    .onChanged { value in
        //                        withAnimation(.spring()) {
        //                            offset = value.translation
        //                        }
        //                    }
        //                    .onEnded { value in
        //                        withAnimation(.spring()) {
        //                            offset = .zero
        //                        }
        //                    }
        //            )
        ZStack  {
            
            RoundedRectangle(cornerRadius: 25)
                .frame(width: 350, height: 450)
                .offset(offset)
                .scaleEffect(getScale())
                .rotationEffect(Angle(degrees: getRotation()))
                .gesture(
                    DragGesture()
                        .onChanged { value in
                            withAnimation(.spring()) {
                                offset = value.translation
                            }
                        }
                        .onEnded { value in
                            withAnimation(.spring()) {
                                offset = .zero
                            }
                        }
                )
            
            VStack  {
                Text("\(offset.width)")
                Spacer()
            }
        }
    }
    
    func getScale() -> CGFloat {
        let max = UIScreen.main.bounds.width / 2
        let offsetX = abs(offset.width)
        let percentage = offsetX / max
        return 1.0 - min(0.5, percentage) * 0.5
    }
    
    func getRotation() -> Double {
        let max = UIScreen.main.bounds.width / 2
        let currentWidth = offset.width
        let percentage = currentWidth / max
        print("percentage \(percentage)")
        let maxAngle: Double = 10
        return Double(percentage * maxAngle)
    }
}

struct DragGestureSample_Previews: PreviewProvider {
    static var previews: some View {
        DragGestureSample()
    }
}
