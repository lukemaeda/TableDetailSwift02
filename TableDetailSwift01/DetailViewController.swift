//
//  DetailViewController.swift
//  TableDetailSwift01
//
//  Created by MAEDAHAJIME on 2015/07/09.
//  Copyright (c) 2015年 MAEDA HAJIME. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var lbMessage: UILabel!
    
    // 遷移時の受け取り用の変数
    var mssage:NSString = ""
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // タイトルの表示
        self.lbMessage!.text = mssage as String
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
