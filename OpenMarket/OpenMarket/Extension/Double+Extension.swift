//
//  Int.swift
//  OpenMarket
//
//  Created by Jinwook Huh on 2022/01/31.
//

import Foundation

extension Double {
    func currencyFormat() -> String {
        let formatter: NumberFormatter = NumberFormatter()
        formatter.numberStyle = .currency
        formatter.maximumFractionDigits = 2
        formatter.currencySymbol = ""
        if let currencyString: String = formatter.string(for: self) {
            return currencyString
        }
        return ""
    }
}
