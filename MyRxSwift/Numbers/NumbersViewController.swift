//
//  NumbersViewController.swift
//  MyRxSwift
//
//  Created by amarron on 2017/10/16.
//  Copyright © 2017年 amarron. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa


class NumbersViewController: ViewController {
    
    @IBOutlet weak internal var number1: UITextField!
    
    @IBOutlet weak internal var number2: UITextField!
    
    @IBOutlet weak internal var number3: UITextField!
    
    @IBOutlet weak internal var result: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Numbers"
        
        Observable.combineLatest(number1.rx.text.orEmpty, number2.rx.text.orEmpty, number3.rx.text.orEmpty) { textValue1, textValue2, textValue3 -> Int in
            return (Int(textValue1) ?? 0) + (Int(textValue2) ?? 0) + (Int(textValue3) ?? 0)
            }
            .map { $0.description }
            .bind(to: result.rx.text)
            .disposed(by: disposeBag)
    }

}
