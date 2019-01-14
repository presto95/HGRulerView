//
//  HGRulerViewDelegate.swift
//  HGRuler
//
//  Created by Presto on 14/01/2019.
//  Copyright © 2019 presto. All rights reserved.
//

import UIKit

@objc public protocol HGRulerViewDelegate: class {
    
    @objc optional func interItemSpacing(in rulerView: HGRulerView) -> CGFloat
    
    @objc optional func rulerView(_ rulerView: HGRulerView, widthForUnitOf type: HGRulerCellType) -> CGFloat
    
    @objc optional func rulerView(_ rulerView: HGRulerView, heightForUnitOf type: HGRulerCellType) -> CGFloat
}
