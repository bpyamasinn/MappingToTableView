//
//  H1TagTableViewCell.swift
//  MappingToTableView
//
//  Created by syamaoka on 2015/12/06.
//  Copyright © 2015年 syamaoka. All rights reserved.
//

import UIKit

class H1TagTableViewCell: UITableViewCell {
    @IBOutlet weak var bodyLabel: UILabel!
    var body :String? {
        didSet {
            setupData()
        }
    }
    
    private func setupData() {
        if let text = body {
            self.bodyLabel.text = text
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
}
