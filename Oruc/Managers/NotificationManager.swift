//
//  NotificationManager.swift
//  Oruc
//
//  Created by Cenk Donmez on 21.07.2023.
//

import Foundation
import UserNotifications

class NotificationManager{
    static let shared = NotificationManager()
    
    
    func requestAuthorization(){
        let options: UNAuthorizationOptions = [.alert, .badge, .sound]
        UNUserNotificationCenter.current().requestAuthorization(options: options) { success, error in
            if let error = error{
                print(error.localizedDescription)
            }else{
                print("Success")
            }
        }
    }
    
    func scheduleNotification(subtitle: String, hour: Int, minute: Int){
        requestAuthorization()
        let content = UNMutableNotificationContent()
        
        content.title = "Oruc"
        content.subtitle = subtitle
        content.sound = .default
        content.badge = 1

        var dateComponents = DateComponents()
        dateComponents.hour = hour
        dateComponents.minute = minute
        let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponents, repeats: true)
        
        let request = UNNotificationRequest(identifier: UUID().uuidString,
                                            content: content,
                                            trigger: trigger)
        
        UNUserNotificationCenter.current().add(request)
        
        
        
    }
    
    func scheduleTINotification(subtitle: String, timeInterval: TimeInterval){
        requestAuthorization()
        let content = UNMutableNotificationContent()
        
        content.title = "Oruc"
        content.subtitle = subtitle
        content.sound = .default
        content.badge = 1
                
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: timeInterval, repeats: false)
        
        let request = UNNotificationRequest(identifier: UUID().uuidString,
                                            content: content,
                                            trigger: trigger)
        
        UNUserNotificationCenter.current().add(request)
        
        
        
    }
    
    func setUpStageNotifications(){
//        scheduleTINotification(subtitle: "Sindirim sürecindesiniz", timeInterval: 10.0)
//        scheduleTINotification(subtitle: "Kan şekeriniz normale döndü", timeInterval: 7200.0)
//        scheduleTINotification(subtitle: "Kan şekeriniz düşüyor", timeInterval: 18000.0)
//        scheduleTINotification(subtitle: "Son glikoz rezervleriniz kullanılıyor", timeInterval: 28800.0)
//        scheduleTINotification(subtitle: "Vücudunuz enerji olarak yağı kullanmaya başladı!", timeInterval: 36000.0)
//        scheduleTINotification(subtitle: "Ketoz durumundasınız!", timeInterval: 43200.0)
//        scheduleTINotification(subtitle: "Yağ depolarını yakıyorsunuz bravo!", timeInterval: 64810.0)
        scheduleTINotification(subtitle: "Sindirim sürecindesiniz", timeInterval: 2.5)
        scheduleTINotification(subtitle: "Kan şekeriniz normale döndü", timeInterval: 3.5)
        scheduleTINotification(subtitle: "Kan şekeriniz düşüyor", timeInterval: 6.0)
        scheduleTINotification(subtitle: "Son glikoz rezervleriniz kullanılıyor", timeInterval: 9.0)
        scheduleTINotification(subtitle: "Vücudunuz enerji olarak yağı kullanmaya başladı!", timeInterval: 12.0)
        scheduleTINotification(subtitle: "Ketoz durumundasınız!", timeInterval: 15.0)
        scheduleTINotification(subtitle: "Yağ depolarını yakıyorsunuz bravo!", timeInterval: 18.0)
    }
    
    func cancelNotifications(){
        UNUserNotificationCenter.current().removeAllPendingNotificationRequests()
        UNUserNotificationCenter.current().removeAllDeliveredNotifications()
    }
}
