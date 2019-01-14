//
//  HGRuler.swift
//  HGRuler
//
//  Created by Presto on 14/01/2019.
//  Copyright © 2019 presto. All rights reserved.
//

import UIKit

public class HGRulerView: UIView {

    weak var delegate: HGRulerViewDelegate?
    
    weak var dataSource: HGRulerViewDataSource?
    
    var numberOfItems: Int {
        return dataSource?.numberOfItems(in: self) ?? 0
    }
    
    var numberOfSubUnitsByMainUnit: Int {
        return dataSource?.numberOfSubUnitsByMainUnit(in: self) ?? 0
    }
    
    lazy var contentsInset: UIEdgeInsets = UIEdgeInsets(top: 0, left: bounds.width / 2, bottom: 0, right: bounds.width / 2)
    
    private var collectionView: HGRulerCollectionView! {
        didSet {
            collectionView.delegate = self
            collectionView.dataSource = self
            collectionView.contentInset = contentsInset
            collectionView.translatesAutoresizingMaskIntoConstraints = false
            addSubview(collectionView)
            NSLayoutConstraint.activate([
                collectionView.leadingAnchor.constraint(equalTo: leadingAnchor),
                collectionView.trailingAnchor.constraint(equalTo: trailingAnchor),
                collectionView.centerYAnchor.constraint(equalTo: centerYAnchor),
                collectionView.heightAnchor.constraint(equalToConstant: 32)
                ])
        }
    }
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    private func setup() {
        collectionView = HGRulerCollectionView(frame: .zero, collectionViewLayout: .init())
    }
}

extension HGRulerView: UICollectionViewDataSource {
    public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let mainUnitCell = collectionView.dequeueReusableCell(withReuseIdentifier: Constant.mainUnitCellIdentifier, for: indexPath)
        let subUnitCell = collectionView.dequeueReusableCell(withReuseIdentifier: Constant.subUnitCellIdentifier, for: indexPath) 
        return indexPath.row % numberOfSubUnitsByMainUnit == 0 ? mainUnitCell : subUnitCell
    }
    
    public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return numberOfItems
    }
}

extension HGRulerView: UICollectionViewDelegate {
    
}

extension HGRulerView: UIScrollViewDelegate {
    public func scrollViewDidScroll(_ scrollView: UIScrollView) {
        
    }
    
    public func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        
    }
    
    public func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        
    }
}
