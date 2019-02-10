//
//  HGRulerViewDelegate.swift
//  HGRuler
//
//  Created by Presto on 14/01/2019.
//  Copyright © 2019 presto. All rights reserved.
//

import UIKit

/// Defines delegate for ruler view.
public protocol HGRulerViewDelegate: class {
  
  /// Returns width of units.
  ///
  /// The default value is `9.0`.
  func widthOfUnit(in rulerView: HGRulerView) -> CGFloat
  
  /// Returns height of units.
  ///
  /// This value should be less than or equal to height of ruler view.
  ///
  /// The default value is `32.0`.
  func heightOfUnit(in rulerView: HGRulerView) -> CGFloat
  
  /// Tells the delegate when the user scrolls the ruler view within the receiver.
  func rulerViewDidScroll(_ rulerView: HGRulerView)
  
  /// Tells the delegate that the ruler view has ended decelerating the scrolling movement.
  func rulerViewDidEndDecelerating(_ rulerView: HGRulerView)
  
  /// Tells the delegate when dragging ended in the ruler view.
  func rulerViewDidEndDragging(_ rulerView: HGRulerView, willDecelerate decelerate: Bool)
}

// MARK: - Default behavior of ruler view delegate.

extension HGRulerViewDelegate {
  
  func widthOfUnit(in rulerView: HGRulerView) -> CGFloat {
    return 9.0
  }
  
  func heightOfUnit(in rulerView: HGRulerView) -> CGFloat {
    return 32.0
  }
  
  func rulerViewDidScroll(_ rulerView: HGRulerView) { }
  
  func rulerViewDidEndDecelerating(_ rulerView: HGRulerView) {
    let collectionView = rulerView.collectionView
    let contentOffset = collectionView?.contentOffset.x ?? .leastNonzeroMagnitude
    let position: CGPoint = .init(x: UIScreen.main.bounds.width / 2 + contentOffset, y: 0)
    if let currentIndexPath = collectionView?.indexPathForItem(at: position) {
      collectionView?.scrollToItem(at: currentIndexPath, at: .centeredHorizontally, animated: true)
    }
  }
  
  func rulerViewDidEndDragging(_ rulerView: HGRulerView, willDecelerate decelerate: Bool) {
    if !decelerate {
      let collectionView = rulerView.collectionView
      let contentOffset = collectionView?.contentOffset.x ?? .leastNonzeroMagnitude
      let position: CGPoint = .init(x: UIScreen.main.bounds.width / 2 + contentOffset, y: 0)
      if let currentIndexPath = collectionView?.indexPathForItem(at: position) {
        collectionView?.scrollToItem(at: currentIndexPath,
                                     at: .centeredHorizontally,
                                     animated: true)
      }
    }
  }
}
