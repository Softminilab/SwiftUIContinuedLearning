//
//  LocalNotifactionSample.swift
//  SwiftUIContinuedLearning
//
//  Created by 0x2ab70001b1 on 2023/8/15.
//

import SwiftUI
import CoreLocation
import UserNotifications

class NotificationManager {
    static let instance = NotificationManager()
    
    func requestAuthorization() {
        let options: UNAuthorizationOptions = [.alert, .badge, .sound]
        UNUserNotificationCenter.current().requestAuthorization(options: options) { success, error in
            if let error = error {
                print("\(error)")
            } else {
                print("Success")
            }
        }
    }
    
    func scheduleNotifaction() {
        let content = UNMutableNotificationContent()
        content.title = "这是我的第一个本地通知"
        content.subtitle = "好像很容易哟"
        content.sound = .default
        content.badge = 1
        
        // time
//        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 5.0, repeats: false)
        
        // calenday
        // 每周 星期二 晚上 十点 八分 提醒
//        var dateComponents = DateComponents()
//        dateComponents.hour = 22
//        dateComponents.minute = 8
//        dateComponents.weekday = 3 // 星期二 sunday是1
//
//        let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponents, repeats: true)
        
        let locationCoordinate2D = CLLocationCoordinate2D(
            latitude: 100.00,
            longitude: 100.00
        )
        
        let region = CLCircularRegion(
            center: locationCoordinate2D,
            radius: 100,
            identifier: UUID().uuidString
        )
        region.notifyOnExit = true
        region.notifyOnEntry = true
        
        let trigger = UNLocationNotificationTrigger(region: region, repeats: true)
        
        let request = UNNotificationRequest(
            identifier: UUID().uuidString,
            content: content,
            trigger: trigger
        )
        UNUserNotificationCenter.current().add(request)
    }
    
    func cancelNotification() {
        UNUserNotificationCenter.current().removeAllPendingNotificationRequests()
        UNUserNotificationCenter.current().removeAllDeliveredNotifications()
    }
}

struct LocalNotifactionSample: View {
    var body: some View {
        VStack(spacing: 40) {
            Button {
                NotificationManager.instance.requestAuthorization()
            } label: {
                Text("请求授权")
                    .foregroundColor(.black)
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .frame(maxWidth: .infinity)
                    .padding()
                    .padding(.horizontal)
                    .background(Color.orange.cornerRadius(10))
            }
            
            Button {
                NotificationManager.instance.scheduleNotifaction()
            } label: {
                Text("日程通知")
                    .foregroundColor(.black)
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .frame(maxWidth: .infinity)
                    .padding()
                    .padding(.horizontal)
                    .background(Color.orange.cornerRadius(10))
            }
            
            Button {
                NotificationManager.instance.cancelNotification()
            } label: {
                Text("取消通知")
                    .foregroundColor(.black)
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .frame(maxWidth: .infinity)
                    .padding()
                    .padding(.horizontal)
                    .background(Color.orange.cornerRadius(10))
            }
        }
        .padding(.horizontal)
    }
}

struct LocalNotifactionSample_Previews: PreviewProvider {
    static var previews: some View {
        LocalNotifactionSample()
    }
}
