//
//  ViewController.swift
//  CountUpAppForBeginners
//
//  Created by TanakaHirokazu on 2020/08/04.
//  Copyright © 2020 TanakaHirokazu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    //数字を格納する場所
    var count = 0
    var goal: Int!
    //UIパーツのラベル
    @IBOutlet weak var countLabel: UILabel!
    @IBOutlet weak var goalLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        goal = Int.random(in: -20...20)
        goalLabel.text = "\(goal!)\nまでカウントしよう！"
        countLabel.text = String(count)
        
    }

    @IBAction func countUpButton(_ sender: Any) {
        //+ボタンを押すとラベルの文字をカウントアップ
        count = count + 1
        
        checkGoal()
        
        countLabel.text = String(count)
        
        //カウントにあわせて文字の色を変更
        changeColor()

    }
    
    @IBAction func countDounButton(_ sender: Any) {
         //-ボタンを押すとラベルの文字をカウントダウン
        count = count - 1
        
        checkGoal()
        
        countLabel.text = String(count)
        
       //カウントにあわせて文字の色を変更
        changeColor()
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "next"{
            let nextVC = segue.destination as! NextViewController
            nextVC.passdata = count
            nextVC.senddismissAction = {
                self.goal = Int.random(in: -20...20)
                self.goalLabel.text = ("\(String(self.goal))\nまでカウントしよう！")
            }
        }
    }
    
    //goalかどうかチェックする
    func checkGoal(){
        if count == goal{
            performSegue(withIdentifier: "next", sender: nil)
            
        }
    }
    
    //カウントにあわせて文字の色を変更するメソッドを定義
    func changeColor(){
        if count >= 10{
            countLabel.textColor = UIColor.green
        }else if count < 0{
            countLabel.textColor = UIColor.red
        }else{
            countLabel.textColor = UIColor.black
        }
    }
    
}

