//
//  String+Extension.swift
//  OpenMarket
//
//  Created by Jinwook Huh on 2022/01/31.
//

import Foundation
import UIKit

extension String {
    func strikeThrough() -> NSAttributedString {
        let attributeString: NSMutableAttributedString = NSMutableAttributedString(string: self)
        attributeString.addAttribute(NSAttributedString.Key.strikethroughStyle, value: NSUnderlineStyle.single.rawValue, range: NSRange(location: 0, length: attributeString.length))

        return attributeString
    }
}
