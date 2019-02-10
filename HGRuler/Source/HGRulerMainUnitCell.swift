//
//  HGRulerMainUnitCell.swift
//  HGRuler
//
//  Created by Presto on 14/01/2019.
//  Copyright © 2019 presto. All rights reserved.
//

import UIKit

/// Defines collection view cell for main unit of ruler view.
public final class HGRulerMainUnitCell: UICollectionViewCell {
  
  override public var reuseIdentifier: String? {
    return Constant.mainUnitCellIdentifier
  }
  
  /// view for unit.
  private var unitView: UIView! {
    didSet {
      unitView.translatesAutoresizingMaskIntoConstraints = false
      addSubview(unitView)
      NSLayoutConstraint.activate([
        unitView.topAnchor.constraint(equalTo: topAnchor),
        unitView.bottomAnchor.constraint(equalTo: bottomAnchor),
        unitView.widthAnchor.constraint(equalToConstant: 1),
        unitView.centerXAnchor.constraint(equalTo: centerXAnchor)
        ])
    }
  }
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    setup()
  }
  
  required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
    setup()
  }
  
  private func setup() {
    unitView = UIView()
    unitView.backgroundColor = .black
  }
}
