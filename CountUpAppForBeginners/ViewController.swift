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
    //ラベル
    @IBOutlet weak var countLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        countLabel.text = String(count)
        
        
    }

    @IBAction func countUpButton(_ sender: Any) {
        //+ボタンを押すとラベルの文字をカウントアップ
        
        
        //10以上になったら文字の色を緑に変更
    }
    
    @IBAction func countDounButton(_ sender: Any) {
         //-ボタンを押すとラベルの文字をカウントダウン
        
    }
    
}

