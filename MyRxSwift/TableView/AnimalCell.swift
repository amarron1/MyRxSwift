//
//  AnimalCell.swift
//  MyRxSwift
//
//  Created by amarron on 2017/11/24.
//  Copyright © 2017年 amarron. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class AnimalCell: UITableViewCell {

    static let Identifier = "AnimalCell"
    
    @IBOutlet private var nameLabel: UILabel!
    @IBOutlet private var emojiLabel: UILabel!
    
    func configureWithAnimal(animal: Animal) {
        nameLabel.text = animal.animalName
        emojiLabel.text = animal.animalFlagEmoji
    }
}
