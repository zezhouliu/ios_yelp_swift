//
//  UIView+Autolayout.swift
//  Yelp
//
//  Created by Alex Liu on 10/25/16.
//  Copyright © 2016 Timothy Lee. All rights reserved.
//

import UIKit

public extension UIView {

  public func pinEdgesTo(view: UIView) {
//    NSLayoutConstraint(
//      item: self,
//      attribute: .top,
//      relatedBy: .equal,
//      toItem: view,
//      attribute: .top).isActive = true
//
//    NSLayoutConstraint(
//      item: self,
//      attribute: .bottom,
//      relatedBy: .equal,
//      toItem: view,
//      attribute: .bottom).isActive = true
//
//    NSLayoutConstraint(
//      item: self,
//      attribute: .leading,
//      relatedBy: .equal,
//      toItem: view,
//      attribute: .leading).isActive = true
//
//    NSLayoutConstraint(
//      item: self,
//      attribute: .trailing,
//      relatedBy: .equal,
//      toItem: view,
//      attribute: .trailing).isActive = true

    NSLayoutConstraint(
      item: self,
      attribute: .top,
      relatedBy: .equal,
      toItem: view,
      attribute: .top).isActive = true

      NSLayoutConstraint(
        item: self,
        attribute: .bottom,
        relatedBy: .equal,
        toItem: view,
        attribute: .bottom).isActive = true

      NSLayoutConstraint(
        item: self,
        attribute: .leading,
        relatedBy: .equal,
        toItem: view,
        attribute: .leading).isActive = true

      NSLayoutConstraint(
        item: self,
        attribute: .trailing,
        relatedBy: .equal,
        toItem: view,
        attribute: .trailing).isActive = true
  }

  public func pinToParentEdges() {

    
//    superview!.addConstraint(NSLayoutConstraint(
//      item: superview!,
//      attribute: .top,
//      relatedBy: .equal,
//      toItem: self,
//      attribute: .top))
//
//    superview!.addConstraint(NSLayoutConstraint(
//      item: superview!,
//      attribute: .bottom,
//      relatedBy: .equal,
//      toItem: self,
//      attribute: .bottom))
//
//    superview!.addConstraint(NSLayoutConstraint(
//      item: superview!,
//      attribute: .leading,
//      relatedBy: .equal,
//      toItem: self,
//      attribute: .leading))
//
//    superview!.addConstraint(NSLayoutConstraint(
//      item: superview!,
//      attribute: .trailing,
//      relatedBy: .equal,
//      toItem: self,
//      attribute: .trailing))
  }

  public func pinToParentMargins() {

  }
}
