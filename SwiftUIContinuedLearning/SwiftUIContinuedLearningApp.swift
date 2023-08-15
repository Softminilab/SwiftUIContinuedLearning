//
//  SwiftUIContinuedLearningApp.swift
//  SwiftUIContinuedLearning
//
//  Created by 0x2ab70001b1 on 2023/8/6.
//

import SwiftUI

@main
struct SwiftUIContinuedLearningApp: App {
    init() {
        let a = min(1, 0.5)
        let b = min(10, 10)
        let c = min(0.5, 1.0)
        let d = min(0.5, 0.1)
        print("\(a) \(b) \(c) \(d)")
    }
    
    var body: some Scene {
        WindowGroup {
            HapticSample()
        }
    }
}
