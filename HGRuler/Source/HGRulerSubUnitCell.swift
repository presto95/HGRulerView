//
//  HGRulerSubUnitCell.swift
//  HGRuler
//
//  Created by Presto on 14/01/2019.
//  Copyright © 2019 presto. All rights reserved.
//

import UIKit

class HGRulerSubUnitCell: UICollectionViewCell {

    override var reuseIdentifier: String? {
        return Constant.subUnitCellIdentifier
    }
    
    private var unitLabel: UILabel! {
        didSet {
            unitLabel.translatesAutoresizingMaskIntoConstraints = false
            addSubview(unitLabel)
            let centerXConstraint = unitLabel.centerXAnchor.constraint(equalTo: centerXAnchor)
            let topConstraint = unitLabel.topAnchor.constraint(equalTo: topAnchor)
            let widthConstraint = unitLabel.widthAnchor.constraint(equalToConstant: 1)
            let heightConstraint = unitLabel.heightAnchor.constraint(equalToConstant: 16)
            NSLayoutConstraint.activate([centerXConstraint, topConstraint, widthConstraint, heightConstraint])
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
        unitLabel = UILabel()
        unitLabel.backgroundColor = .black
    }
}
