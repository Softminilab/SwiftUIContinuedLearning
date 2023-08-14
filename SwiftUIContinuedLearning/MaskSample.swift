//
//  MaskSample.swift
//  SwiftUIContinuedLearning
//
//  Created by 0x2ab70001b1 on 2023/8/14.
//

import SwiftUI

struct MaskSample: View {
    @State var rating: Int = 0
    
    var body: some View {
        //        Image("0")
        //            .resizable()
        //            .scaledToFit()
        //            .foregroundColor(.green)
        //            .mask {
        //                Image(systemName: "heart.fill")
        //                    .resizable()
        //                    .scaledToFit()
        //            }
        
        ZStack {
            starView
                .overlay(
                    overlayView
                        .mask(starView)
                )
        }
    }
    
    var overlayView: some View {
        GeometryReader { geo in
            Rectangle()
//                .foregroundColor(.yellow)
                .fill(
                    LinearGradient(colors: [Color.blue, Color.green], startPoint: .leading, endPoint: .trailing)
                )
                .frame(width: CGFloat(rating) / 5 * geo.size.width)
        }
        .allowsHitTesting(false)
    }
    
    var starView: some View {
        HStack {
            ForEach(1..<6) { index in
                Image(systemName: "star.fill")
                    .font(.largeTitle)
                    .foregroundColor(.gray)
                    .onTapGesture {
                        withAnimation(.easeInOut) {
                            rating = index
                        }
                    }
            }
        }
    }
}

struct MaskSample_Previews: PreviewProvider {
    static var previews: some View {
        MaskSample()
    }
}
