//
//  AnimalCell.swift
//  MyRxSwift
//
//  Created by amarron on 2017/11/24.
//  Copyright © 2017年 amarron. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa

//MARK: - Equatable Protocol implementation

func ==(lhs: Animal, rhs: Animal) -> Bool {
    return (lhs.animalName == rhs.animalName
        && lhs.animalFlagEmoji == rhs.animalFlagEmoji)
}

//MARK: - Animal

struct Animal: Equatable {
    let animalName: String
    let animalFlagEmoji: String
    
    // An array of animal from europe
    static let ofPet: [Animal] = {
        let dog = Animal(animalName: "Dog",
                            animalFlagEmoji: "🐶")
        let cat = Animal(animalName: "Cat",
                            animalFlagEmoji: "🐱")
        let monkey = Animal(animalName: "Monkey",
                            animalFlagEmoji: "🐵")

        
        return [
            dog,
            cat,
            monkey
        ]
    }()
}

extension Animal: Hashable {
    var hashValue: Int {
        return self.animalFlagEmoji.hashValue
    }
}
