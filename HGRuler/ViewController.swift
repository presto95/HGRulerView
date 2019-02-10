//
//  ViewController.swift
//  HGRuler
//
//  Created by Presto on 14/01/2019.
//  Copyright © 2019 presto. All rights reserved.
//

import UIKit

final class ViewController: UIViewController {
  
  @IBOutlet private weak var valueLabel: UILabel!
  
  @IBOutlet private weak var rulerView: HGRulerView! {
    didSet {
      rulerView.dataSource = self
      rulerView.delegate = self
    }
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    rulerView.contentInset = .init(top: 0,
                                   left: view.bounds.width / 2,
                                   bottom: 0,
                                   right: view.bounds.width / 2)
  }
}

extension ViewController: HGRulerViewDataSource {
  func numberOfItems(in rulerView: HGRulerView) -> Int {
    return 100 + 1
  }
  
  func numberOfSubUnitsPerMainUnit(in rulerView: HGRulerView) -> Int {
    return 5
  }
}

extension ViewController: HGRulerViewDelegate {
  func widthOfUnit(in rulerView: HGRulerView) -> CGFloat {
    return 9.0
  }
  
  func heightOfUnit(in rulerView: HGRulerView) -> CGFloat {
    return 32.0
  }
}
