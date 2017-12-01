//
//  LoginButton.swift
//  MyRxSwift
//
//  Created by amarron on 2017/11/28.
//  Copyright © 2017年 amarron. All rights reserved.
//

import UIKit

@IBDesignable
class LoginButton: UIButton {
    
    override var isEnabled: Bool {
        didSet {
            updateAlphaForEnabledState()
        }
    }
    
    //MARK: Initialization
    private func commonInit() {
        self.setTitleColor(.white, for: .normal)
        self.backgroundColor = .brown
        updateAlphaForEnabledState()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        commonInit()
    }
    
    func updateAlphaForEnabledState() {
        if isEnabled {
            self.alpha = 1
        } else {
            self.alpha = 0.5
        }
    }
    
    
}
