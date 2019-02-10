//
//  HGRulerViewDataSource.swift
//  HGRuler
//
//  Created by Presto on 14/01/2019.
//  Copyright © 2019 presto. All rights reserved.
//

import Foundation

/// Defines data source for ruler view.
public protocol HGRulerViewDataSource: class {
  
  /// Returns number of items of ruler view.
  func numberOfItems(in rulerView: HGRulerView) -> Int
  
  /// Returns number of sub units per main unit of ruler view.
  func numberOfSubUnitsPerMainUnit(in rulerView: HGRulerView) -> Int
}
