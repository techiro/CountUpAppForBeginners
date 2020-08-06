//
//  SettingViewController.swift
//  CountUpAppForBeginners
//
//  Created by TanakaHirokazu on 2020/08/06.
//  Copyright © 2020 TanakaHirokazu. All rights reserved.
//

import UIKit

class SettingViewController: UIViewController {
    
    @IBOutlet weak var label: UILabel!
    private var passdata: Int
    init?(coder:NSCoder,passdata:Int){
        self.passdata = passdata
        super.init(coder: coder)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        label.text = String(passdata)
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
