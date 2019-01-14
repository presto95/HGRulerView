//
//  HGRulerCollectionView.swift
//  HGRuler
//
//  Created by Presto on 14/01/2019.
//  Copyright © 2019 presto. All rights reserved.
//

import UIKit

class HGRulerCollectionView: UICollectionView {
    
    override init(frame: CGRect, collectionViewLayout layout: UICollectionViewLayout) {
        super.init(frame: frame, collectionViewLayout: layout)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }

    private func setup() {
        register(HGRulerMainUnitCell.self, forCellWithReuseIdentifier: Constant.mainUnitCellIdentifier)
        register(HGRulerSubUnitCell.self, forCellWithReuseIdentifier: Constant.subUnitCellIdentifier)
        backgroundColor = .clear
        allowsSelection = false
        isScrollEnabled = true
        showsVerticalScrollIndicator = false
        showsHorizontalScrollIndicator = false
        bounces = false
        bouncesZoom = false
        setLayout()
    }
    
    private func setLayout() {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.itemSize = .init(width: 1, height: 32)
        layout.minimumLineSpacing = 9
        layout.minimumInteritemSpacing = .leastNonzeroMagnitude
        collectionViewLayout = layout
    }
}
