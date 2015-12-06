//
//  WebViewController.swift
//  MappingToTableView
//
//  Created by syamaoka on 2015/12/05.
//  Copyright © 2015年 syamaoka. All rights reserved.
//

import UIKit

class WebViewController: UIViewController {

    @IBOutlet weak var webView: UIWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.webView.loadRequest(NSURLRequest(URL: NSURL(string: "http://qiita.com/syamaoka/items/2edfe315940d91846bf0")!))
    }
}
