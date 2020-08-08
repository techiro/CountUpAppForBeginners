//
//  ViewController.swift
//  CountUpAppForBeginners
//
//  Created by TanakaHirokazu on 2020/08/04.
//  Copyright © 2020 TanakaHirokazu. All rights reserved.
//

import UIKit
import UserNotifications //<-通知関係を使用する時に必要

class ViewController: UIViewController {
    //数字を格納する場所
    var count = 1 //<- 初期値を0から1に

    //UIパーツのラベル
    @IBOutlet weak var countLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        countLabel.text = String(count)
        countLabel.textColor = UIColor.blue
    }

    @IBAction func countUpButton(_ sender: Any) {
        //+ボタンを押すとラベルの文字をカウントアップ
        count = count + 1
        countLabel.text = String(count)
        
        //カウントにあわせて文字の色を変更
        changeTextColor()
    }
    
    @IBAction func countDounButton(_ sender: Any) {
        //-ボタンを押すとラベルの文字をカウントダウン
        if count > 1 {
            //countが1未満にならないようにカウントダウンさせる
            count = count - 1
            countLabel.text = String(count)
        }
        //カウントにあわせて文字の色を変更
        changeTextColor()
    }

    @IBAction func onSwitchDidChanged(_ sender: UISwitch) {
        //switchを押すとこの中身が動く
        if sender.isOn {
            //switchをオンにすると通知が来る
            showNotification()
        }
    }

    //カウントにあわせて文字の色を変更するメソッドを定義
    func changeTextColor(){
        if count >= 10{
            countLabel.textColor = UIColor.green
        }else if count < 0{
            countLabel.textColor = UIColor.red
        }else{
            countLabel.textColor = UIColor.blue
        }
    }

    func showNotification() {
        let content = UNMutableNotificationContent()
        //content:通知に表示するものを編集する
        content.title = "countUpAppForBeginners"
        content.body = "switchをオンにしました。"
        content.sound = UNNotificationSound.default

        //n秒後に通知させる(n>0)
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: TimeInterval(count), repeats: false) //countをTimerIntervalに変換する

        let request = UNNotificationRequest(identifier: "changedSwitch", content: content, trigger: trigger)//<-ここをnilからtriggerに変える
        UNUserNotificationCenter.current().add(request, withCompletionHandler: nil)
    }
}
