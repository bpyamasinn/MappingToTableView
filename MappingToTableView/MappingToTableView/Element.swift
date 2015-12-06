//
//  Element.swift
//  MappingToTableView
//
//  Created by syamaoka on 2015/12/05.
//  Copyright © 2015年 syamaoka. All rights reserved.
//

import UIKit
import Ono

enum PermitTag: String {
    case none = ""
    case p = "p"
    case h1 = "h1"
    case h2 = "h2"
    case h3 = "h3"
}

class Element {
    var tag: PermitTag = .none
    var value: String = ""
    
    init(tag: PermitTag, value: String) {
        self.tag = tag
        self.value = value
    }
}
