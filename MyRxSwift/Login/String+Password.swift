//
//  String+Password.swift
//  MyRxSwift
//
//  Created by amarron on 2017/11/29.
//  Copyright © 2017年 amarron. All rights reserved.
//

import Foundation

extension String {
    func isAlphanumeric() -> Bool {
        let passwordRegEx = "[a-zA-Z0-9]+"
        let passwordTest = NSPredicate(format:"SELF MATCHES %@", passwordRegEx)
        return passwordTest.evaluate(with: self)
    }
}
