//
//  HTMLParser.swift
//  MappingToTableView
//
//  Created by syamaoka on 2015/12/05.
//  Copyright © 2015年 syamaoka. All rights reserved.
//

import UIKit
import Ono

class HTMLParser: NSObject {
    var elements = [Element]()
    
    func HTMLDocumentWithString(htmlText:String) -> [Element] {
        do {
            let document = try ONOXMLDocument.HTMLDocumentWithString(htmlText, encoding: NSUTF8StringEncoding)
            // htmlの子要素を参照
            for bodyElement in document.rootElement.children {
                let bodyElement = bodyElement as! ONOXMLElement
                // bodyの子要素を参照
                for element in bodyElement.children {
                    if let element = element as? ONOXMLElement {
                        // 許可しているタグのみパースする
                        if let tag = PermitTag(rawValue: element.tag) {
                            parseElement(element, tag: tag)
                        }
                    }
                }
            }
        } catch {
            print("error when parser html")
        }
        return elements
    }
    
    private func parseElement(element: ONOXMLElement, tag: PermitTag) {
        switch tag {
        case .p, .h1, .h2, .h3:
            elements.append(Element(tag: tag, value: element.stringValue().stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceAndNewlineCharacterSet())))
        default:
            break
        }
    }
}
