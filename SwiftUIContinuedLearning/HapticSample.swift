//
//  HapticSample.swift
//  SwiftUIContinuedLearning
//
//  Created by 0x2ab70001b1 on 2023/8/15.
//

import SwiftUI

class HapticManager {
    static let instance = HapticManager()
    
    func notification(type: UINotificationFeedbackGenerator.FeedbackType) {
        let generator = UINotificationFeedbackGenerator()
        generator.prepare()
        generator.notificationOccurred(type)
    }
    
    func impact(style: UIImpactFeedbackGenerator.FeedbackStyle) {
        let generator = UIImpactFeedbackGenerator(style: style)
        generator.prepare()
        generator.impactOccurred()
    }
}

struct HapticSample: View {
    var body: some View {
        VStack(spacing: 30) {
            Button("error") { HapticManager.instance.notification(type: .error) }
            Button("success") { HapticManager.instance.notification(type: .success) }
            Button("warning") { HapticManager.instance.notification(type: .warning) }
            Divider()
            Button("soft") { HapticManager.instance.impact(style: UIImpactFeedbackGenerator.FeedbackStyle.soft) }
            Button("light") { HapticManager.instance.impact(style: UIImpactFeedbackGenerator.FeedbackStyle.light) }
            Button("medium") { HapticManager.instance.impact(style: UIImpactFeedbackGenerator.FeedbackStyle.medium) }
            Button("rigid") { HapticManager.instance.impact(style: UIImpactFeedbackGenerator.FeedbackStyle.rigid) }
            Button("heavy") { HapticManager.instance.impact(style: UIImpactFeedbackGenerator.FeedbackStyle.heavy) }
        }
    }
}

struct HapticSample_Previews: PreviewProvider {
    static var previews: some View {
        HapticSample()
    }
}
