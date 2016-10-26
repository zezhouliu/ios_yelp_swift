//
//  YelpRestaurantTableViewCell.swift
//  Yelp
//
//  Created by Alex Liu on 10/25/16.
//  Copyright © 2016 Timothy Lee. All rights reserved.
//

import UIKit

public struct YelpRestaurantTableViewCellContent {

}

class YelpRestaurantTableViewCell: UITableViewCell {

  public override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

}
