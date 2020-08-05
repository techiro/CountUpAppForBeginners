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
    //UIパーツのラベル
    @IBOutlet weak var countLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        countLabel.text = String(count)
        
    }

    @IBAction func countUpButton(_ sender: Any) {
        //+ボタンを押すとラベルの文字をカウントアップ
        count = count + 1
        
        //画面遷移
        if count == 2{
            performSegue(withIdentifier: "next", sender: nil)
            count = 0
        }
        
        countLabel.text = String(count)
        
        //カウントにあわせて文字の色を変更
        changeColor()

    }
    
    @IBAction func countDounButton(_ sender: Any) {
         //-ボタンを押すとラベルの文字をカウントダウン
        count = count - 1
        countLabel.text = String(count)
        
       //カウントにあわせて文字の色を変更
        changeColor()
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "next"{
            let nextVC = segue.destination as! NextViewController
            nextVC.passdata = count
            
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

