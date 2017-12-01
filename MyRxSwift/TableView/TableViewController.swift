//
//  TableViewController.swift
//  MyRxSwift
//
//  Created by amarron on 2017/11/23.
//  Copyright © 2017年 amarron. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa

class TableViewController: ViewController {
    
    let petAnimals = Observable.just(Animal.ofPet) // 1

    @IBOutlet private var tableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "TableView"
        
        self.setupCellConfiguration()
        self.setupCellTapHandling()
    }
    
    private func setupCellConfiguration() {
        //2
        petAnimals
            .bind(to: tableView
                .rx //3
                .items(cellIdentifier: AnimalCell.Identifier,
                       cellType: AnimalCell.self)) { // 4
                        row, animal, cell in
                        cell.configureWithAnimal(animal: animal)
            }
            .disposed(by: disposeBag) // 5
    }
    
    private func setupCellTapHandling() {
        tableView
            .rx
            .modelSelected(Animal.self) // 6
            .subscribe(onNext: { // 7
                animal in
                let alert:UIAlertController = UIAlertController(title: "Your chosen animal is \(animal.animalName).",
                                                                message: animal.animalFlagEmoji,
                                                                preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "OK",
                                              style: .default,
                                              handler:{ (action:UIAlertAction!) -> Void in
                                                self.dismiss(animated: true, completion: nil)
                                                
                }))
                self.present(alert, animated: true, completion: nil) // 8

                if let selectedRowIndexPath = self.tableView.indexPathForSelectedRow {
                    self.tableView.deselectRow(at: selectedRowIndexPath, animated: true)
                } // 9
            })
            .disposed(by: disposeBag) // 10
    }

}
