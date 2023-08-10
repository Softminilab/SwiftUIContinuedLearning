//
//  GeometryReaderSample.swift
//  SwiftUIContinuedLearning
//
//  Created by 0x2ab70001b1 on 2023/8/10.
//

import SwiftUI

struct GeometryReaderSample: View {
    var body: some View {
        //        VStack {
        //            Image("0")
        //                .frame(width: 100, height: 100)
        //                .clipped()
        //                .cornerRadius(10)
        //        }
        //        GeometryReader { geo in
        //            HStack(spacing: 0) {
        //                Rectangle()
        //                    .fill(Color.red)
        //                    .frame(width: geo.size.width * 0.8)
        //                Rectangle()
        //                    .fill(Color.blue)
        //            }
        //            .ignoresSafeArea()
        //        }
        VStack {
            ScrollView(.horizontal,showsIndicators: false) {
                HStack {
                    ForEach(0..<6) { i in
                        GeometryReader { geo in
                            Image("\(i)")
                                .resizable()
                                .scaledToFill()
                                .frame(width: 300, height: 200)
                                .cornerRadius(20)
                                .rotation3DEffect(
                                    Angle(degrees: getPercentage(geo: geo) * 40),
                                    axis: (x: 0.0, y: 1.0, z: 0.0))
                        }
                        .frame(width: 300, height: 200)
                        .padding()
                    }
                }
            }
            
            Spacer()
        }
    }
    
    func getPercentage(geo: GeometryProxy) -> Double {
        let maxDistance = UIScreen.main.bounds.width / 2
        let currentX = geo.frame(in: .global).midX
        return Double(1 - (currentX / maxDistance))
    }
}

struct GeometryReaderSample_Previews: PreviewProvider {
    static var previews: some View {
        GeometryReaderSample()
    }
}
