//
//  AppDelegate.swift
//  CountUpAppForBeginners
//
//  Created by TanakaHirokazu on 2020/08/04.
//  Copyright © 2020 TanakaHirokazu. All rights reserved.
//

import UIKit
import UserNotifications //<-通知のライブラリを使いますと宣言する

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {



    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        // 通知許可の取得
        UNUserNotificationCenter.current().requestAuthorization(
        options: [.alert, .sound, .badge]){ //許可を取るもの:
                                            // .alert -> 通知のポップアップを許可するか,
                                            // .sound -> 通知音が鳴るようにしてもいいか,
                                            // .badge -> 通知時にアプリアイコンに通知数を表示するか
            (granted, _) in
            if granted{
                UNUserNotificationCenter.current().delegate = self
            }
        }

        return true
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }


}

extension AppDelegate: UNUserNotificationCenterDelegate{
    func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
        // アプリ起動中でも通知させる
        completionHandler([.alert, .sound])
    }
}
