//
//  HGRuler.swift
//  HGRuler
//
//  Created by Presto on 14/01/2019.
//  Copyright © 2019 presto. All rights reserved.
//

import UIKit

/// The ruler view class.
public final class HGRulerView: UIView {
  
  /// The property for delegate.
  public weak var delegate: HGRulerViewDelegate? {
    didSet {
      collectionView.setLayout(width: delegate?.widthOfUnit(in: self),
                               height: delegate?.heightOfUnit(in: self))
    }
  }
  
  /// The property for data source.
  public weak var dataSource: HGRulerViewDataSource?
  
  /// A total count of units.
  public var numberOfItems: Int {
    return dataSource?.numberOfItems(in: self) ?? 0
  }
  
  /// A count of sub units per main unit.
  public var numberOfSubUnitsPerMainUnit: Int {
    return dataSource?.numberOfSubUnitsPerMainUnit(in: self) ?? 0
  }

  /// content inset for ruler view.
  public var contentInset: UIEdgeInsets {
    get {
      return collectionView.contentInset
    }
    set {
      collectionView.contentInset = newValue
    }
  }
  
  /// Collection view that presents ruler view.
  internal var collectionView: HGRulerCollectionView! {
    didSet {
      collectionView.delegate = self
      collectionView.dataSource = self
      collectionView.translatesAutoresizingMaskIntoConstraints = false
      addSubview(collectionView)
      NSLayoutConstraint.activate([
        collectionView.leadingAnchor.constraint(equalTo: leadingAnchor),
        collectionView.trailingAnchor.constraint(equalTo: trailingAnchor),
        collectionView.topAnchor.constraint(equalTo: topAnchor),
        collectionView.bottomAnchor.constraint(equalTo: bottomAnchor)
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
  public func collectionView(_ collectionView: UICollectionView,
                             cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let mainUnitCell = collectionView
      .dequeueReusableCell(withReuseIdentifier: Constant.mainUnitCellIdentifier, for: indexPath)
    let subUnitCell
      = collectionView.dequeueReusableCell(withReuseIdentifier: Constant.subUnitCellIdentifier,
                                           for: indexPath)
    return indexPath.row % numberOfSubUnitsPerMainUnit == 0 ? mainUnitCell : subUnitCell
  }
  
  public func collectionView(_ collectionView: UICollectionView,
                             numberOfItemsInSection section: Int) -> Int {
    return numberOfItems
  }
}

extension HGRulerView: UICollectionViewDelegate {
  
}

extension HGRulerView: UIScrollViewDelegate {
  public func scrollViewDidScroll(_ scrollView: UIScrollView) {
    delegate?.rulerViewDidScroll(self)
  }
  
  public func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
    delegate?.rulerViewDidEndDecelerating(self)
  }
  
  public func scrollViewDidEndDragging(_ scrollView: UIScrollView,
                                       willDecelerate decelerate: Bool) {
    delegate?.rulerViewDidEndDragging(self, willDecelerate: decelerate)
  }
}
