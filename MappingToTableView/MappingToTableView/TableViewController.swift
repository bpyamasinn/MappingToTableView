//
//  TableViewController.swift
//  MappingToTableView
//
//  Created by syamaoka on 2015/12/05.
//  Copyright © 2015年 syamaoka. All rights reserved.
//

import UIKit

class TableViewController: UIViewController {
    @IBOutlet weak var tableView:UITableView!
    var elements = [Element]()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.separatorStyle = .None
        
        // ローカルに保存しているQiitaArticleファイルのパスを取得
        let htmlFile = NSBundle.mainBundle().pathForResource("QiitaArticle", ofType: "html")
        
        // ファイルパスから、Stringを取得
        let htmlString = try? String(contentsOfFile: htmlFile!, encoding: NSUTF8StringEncoding)
        
        elements = HTMLParser().HTMLDocumentWithString(htmlString!)
        self.tableView.reloadData()
    }
}

// MARK: UITableViewDelegate
extension TableViewController: UITableViewDelegate {
    func tableView(tableView: UITableView, estimatedHeightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
}


// MARK: UITableViewDataSource
extension TableViewController: UITableViewDataSource {
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let element = elements[indexPath.row]
        let identifier = element.tag.rawValue.uppercaseString + "TagTableViewCell"
        
        switch element.tag {
        case .p:
            let cell = tableView.dequeueReusableCellWithIdentifier(identifier, forIndexPath: indexPath) as! PTagTableViewCell
            cell.body = element.value
            return cell
        case .h1:
            let cell = tableView.dequeueReusableCellWithIdentifier(identifier, forIndexPath: indexPath) as! H1TagTableViewCell
            cell.body = element.value
            return cell
        case .h2:
            let cell = tableView.dequeueReusableCellWithIdentifier(identifier, forIndexPath: indexPath) as! H2TagTableViewCell
            cell.body = element.value
            return cell
        case .h3:
            let cell = tableView.dequeueReusableCellWithIdentifier(identifier, forIndexPath: indexPath) as! H3TagTableViewCell
            cell.body = element.value
            return cell
        default:
            return UITableViewCell()
        }
    }

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.elements.count
    }
}