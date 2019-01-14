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
    
    private var scale: UILabel! {
        didSet {
            scale.backgroundColor = .black
            scale.translatesAutoresizingMaskIntoConstraints = false
            contentView.addSubview(scale)
            let centerXConstraint = scale.centerXAnchor.constraint(equalTo: centerXAnchor)
            let topConstraint = scale.topAnchor.constraint(equalTo: topAnchor)
            let widthConstraint = scale.widthAnchor.constraint(equalToConstant: 1)
            let heightConstraint = scale.heightAnchor.constraint(equalToConstant: 16)
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
        scale = UILabel()
    }
}
