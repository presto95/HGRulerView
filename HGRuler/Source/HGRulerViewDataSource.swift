//
//  HGRulerViewDataSource.swift
//  HGRuler
//
//  Created by Presto on 14/01/2019.
//  Copyright © 2019 presto. All rights reserved.
//

import Foundation

@objc public protocol HGRulerViewDataSource: class {
    
    func numberOfItems(in rulerView: HGRulerView) -> Int
    
    func numberOfSubUnitsByMainUnit(in rulerView: HGRulerView) -> Int
}
