//
//  ViewController.swift
//  HGRuler
//
//  Created by Presto on 14/01/2019.
//  Copyright © 2019 presto. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var rulerView: HGRulerView! {
        didSet {
            rulerView.dataSource = self
            rulerView.delegate = self
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

extension ViewController: HGRulerViewDataSource {
    func numberOfItems(in rulerView: HGRulerView) -> Int {
        return 100 + 1
    }
    
    func numberOfSubUnitsByMainUnit(in rulerView: HGRulerView) -> Int {
        return 5
    }
}

extension ViewController: HGRulerViewDelegate {

}
