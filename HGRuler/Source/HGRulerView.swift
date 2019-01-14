//
//  HGRuler.swift
//  HGRuler
//
//  Created by Presto on 14/01/2019.
//  Copyright © 2019 presto. All rights reserved.
//

import UIKit

@IBDesignable
public class HGRulerView: UIView {

    var delegate: HGRulerViewDelegate?
    
    var dataSource: HGRulerViewDataSource?
    
    var numberOfItems: Int {
        return dataSource?.numberOfItems(in: self) ?? 0
    }
    
    var numberOfSubUnitsByMainUnit: Int {
        return dataSource?.numberOfSubUnitsByMainUnit(in: self) ?? 0
    }
    
    var interItemSpacing: CGFloat {
        return delegate?.interItemSpacing?(in: self) ?? 9.0
    }
    
    private var collectionView: HGRulerCollectionView! {
        didSet {
            collectionView.translatesAutoresizingMaskIntoConstraints = false
            addSubview(collectionView)
            NSLayoutConstraint.activate([
                collectionView.leadingAnchor.constraint(equalTo: leadingAnchor),
                collectionView.trailingAnchor.constraint(equalTo: trailingAnchor),
                collectionView.topAnchor.constraint(equalTo: topAnchor),
                collectionView.bottomAnchor.constraint(equalTo: bottomAnchor)
                ])
            collectionView.delegate = self
            collectionView.dataSource = self
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

extension HGRulerView: UICollectionViewDelegateFlowLayout {
    public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return .init(width: 1, height: 32)
    }
    
    public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return .leastNonzeroMagnitude
    }
    
    public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return interItemSpacing
    }
}

extension HGRulerView: UIScrollViewDelegate {
    public func scrollViewDidScroll(_ scrollView: UIScrollView) {
        
    }
    
    public func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        
    }
    
    public func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        
    }
}
