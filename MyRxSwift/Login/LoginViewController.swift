//
//  ValidateViewController.swift
//  MyRxSwift
//
//  Created by amarron on 2017/11/28.
//  Copyright © 2017年 amarron. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class LoginViewController: ViewController {
    @IBOutlet private var emailTextField: ValidatingTextField!
    @IBOutlet private var passwordTextField: ValidatingTextField!
    @IBOutlet private var loginButton: UIButton!
    
    private let throttleInterval = 0.1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Login"
        
        setupTextChangeHandling()
        setupButtonTapHandling()
    }
    
    
    private func setupTextChangeHandling() {
        let emailValid = emailTextField
            .rx
            .text
            .throttle(throttleInterval, scheduler: MainScheduler.instance)
            .map { self.validate(emailText: $0!) }
        
        emailValid
            .subscribe(onNext: { self.emailTextField.valid = $0 })
            .disposed(by: disposeBag)
        
        let passwordValid = passwordTextField
            .rx
            .text
            .throttle(throttleInterval, scheduler: MainScheduler.instance)
            .map { self.validate(passwordText: $0!) }
        
        passwordValid
            .subscribe(onNext: { self.passwordTextField.valid = $0 })
            .disposed(by: disposeBag)
        
        let everythingValid = Observable
            .combineLatest(emailValid, passwordValid) {
                $0 && $1 //All must be true
        }

        everythingValid
            .bind(to: loginButton.rx.isEnabled)
            .disposed(by: disposeBag)
    }
    
    private func setupButtonTapHandling() {
        loginButton.rx.tap.bind {
            let alert:UIAlertController = UIAlertController(title: "Success!",
                message: "",
                preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK",
                                          style: .default,
                                          handler:{ (action:UIAlertAction!) -> Void in
                                            self.dismiss(animated: true, completion: nil)
            }))
            self.present(alert, animated: true, completion: nil) 
            }.disposed(by: disposeBag)
    }

    //MARK: - Validation methods
    func validate(emailText: String) -> Bool {
        return emailText.isEmail()
    }
    
    func validate(passwordText: String) -> Bool {
        if !passwordText.isAlphanumeric() {
            return false
        }
        
        return passwordText.count > 4
    }
}
