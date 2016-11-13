//
//  MoreTableViewCell.swift
//  Yelp
//
//  Created by Alex Liu on 11/12/16.
//  Copyright © 2016 Alex. All rights reserved.
//

import UIKit

class MoreTableViewCell: UITableViewCell {

  public override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
    titleLabel = UILabel()

    super.init(style: style, reuseIdentifier: reuseIdentifier)
    setupViews()
    setupConstraints()
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  private func setupViews() {
    titleLabel.font = titleLabel.font.withSize(20)
    titleLabel.text = "See all"
    titleLabel.textAlignment = .center
    self.contentView.addSubview(titleLabel)
    self.selectionStyle = .none
  }

  private func setupConstraints() {

    titleLabel.translatesAutoresizingMaskIntoConstraints = false
    NSLayoutConstraint(item: titleLabel, attribute: .leading, relatedBy: .equal, toItem: contentView, attribute: .leadingMargin, multiplier: 1.0, constant: 0.0).isActive = true
    NSLayoutConstraint(item: titleLabel, attribute: .top, relatedBy: .equal, toItem: contentView, attribute: .topMargin, multiplier: 1.0, constant: 0.0).isActive = true
    NSLayoutConstraint(item: titleLabel, attribute: .bottom, relatedBy: .equal, toItem: contentView, attribute: .bottomMargin, multiplier: 1.0, constant: 0.0).isActive = true
    NSLayoutConstraint(item: titleLabel, attribute: .trailing, relatedBy: .equal, toItem: contentView, attribute: .trailingMargin, multiplier: 1.0, constant: 0.0).isActive = true
  }

  private let titleLabel: UILabel
}
