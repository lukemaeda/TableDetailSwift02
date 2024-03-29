//
//  TableViewController.swift
//  TableDetailSwift01
//
//  Created by MAEDAHAJIME on 2015/07/09.
//  Copyright (c) 2015年 MAEDA HAJIME. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {

    var _items:NSArray = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // リソースにあるplistファイルを読み込む
        let bnd:NSBundle = NSBundle.mainBundle()
        let prs:NSString = bnd.pathForResource("Items3",ofType:"plist")!
        // Plist -> NSArray
        _items = NSArray(contentsOfFile:prs as String)!

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    // 設定（列）
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Potentially incomplete method implementation.
        // Return the number of sections.
        return 1
    }

    // 設定（行数）
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete method implementation.
        // Return the number of rows in the section.
        return _items.count
    }

    // 設定（セル）
    override func tableView(tableView: UITableView,
                  cellForRowAtIndexPath indexPath:
                  NSIndexPath) -> UITableViewCell {
                    
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as! UITableViewCell

        // 表示データの設定 NSArray -> NSDictionary
        var dic:NSDictionary = _items.objectAtIndex(indexPath.row) as! NSDictionary
        //println(" Plist:\(dic)")
                    
        var str01:NSString = dic["Name"]! as! NSString
        var str02:NSString = dic["Note"]! as! NSString
                    
        cell.textLabel!.text = str01 as String
        cell.detailTextLabel!.text = str02 as String

        return cell
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return NO if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return NO if you do not want the item to be re-orderable.
        return true
    }
    */

    
    // MARK: - Navigation

    // 画面遷移時に値を遷移先に渡す
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        // セグエ判定
        if (segue.identifier == "Segue01"){
            
            // セルの行情報の取得
            var indexPath:NSIndexPath = self.tableView.indexPathForSelectedRow()!
            // 表示データの設定 NSArray -> NSDictionary
            var dic:NSDictionary = _items.objectAtIndex(indexPath.row) as! NSDictionary
            // Plist "Name"情報
            var str:NSString = dic["Name"]! as! NSString
            
            // DetailViewControllerクラスをインスタンス化してsegue（画面遷移）で値を渡せるようにバンドルする
            let vc : DetailViewController = segue.destinationViewController as! DetailViewController
            
            // "Name"を転送
            vc.mssage = str;
            
            //println(" \(vc.mssage)")
        }
    }
}
