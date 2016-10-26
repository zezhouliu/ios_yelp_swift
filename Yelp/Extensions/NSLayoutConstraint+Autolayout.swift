//
//  NSLayoutConstraint+Autolayout.swift
//  Yelp
//
//  Created by Alex Liu on 10/25/16.
//  Copyright © 2016 Alex. All rights reserved.
//

import UIKit

extension NSLayoutConstraint {

  convenience init(
    item view1: Any,
    attribute attr1: NSLayoutAttribute,
    relatedBy relation: NSLayoutRelation,
    toItem view2: Any?,
    attribute attr2: NSLayoutAttribute)
  {
    self.init(
      item: view1,
      attribute: attr1,
      relatedBy: relation,
      toItem: view2,
      attribute: attr2,
      multiplier: 1.0,
      constant: 0)
  }
}
