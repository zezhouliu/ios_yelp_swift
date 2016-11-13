//
//  AutoCollapseTableViewCell.swift
//  Yelp
//
//  Created by Alex Liu on 11/12/16.
//  Copyright © 2016 Alex. All rights reserved.
//

import UIKit

public enum AutoCollapseState {
  case collapsed
  case selected
  case unselected
}

class AutoCollapseTableViewCell: UITableViewCell {

  public override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
    titleLabel = UILabel()
    checkBoxImageView = UIImageView()

    state = .collapsed

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

    checkBoxImageView.contentMode = .scaleAspectFit

    self.contentView.addSubview(titleLabel)
    self.contentView.addSubview(checkBoxImageView)
    self.selectionStyle = .none
  }

  // MARK: Public
  public func setContent(title: String, state: AutoCollapseState) {
    titleLabel.text = title
    self.state = state

    switch state {
    case .collapsed:
      checkBoxImageView.image = UIImage(named: "dropdown-1x")
      break
    case .selected:
      checkBoxImageView.image = UIImage(named: "check-1x")
      break
    case .unselected:
      checkBoxImageView.image = UIImage(named: "uncheck-1x")
      break
    }
  }

  private func setupConstraints() {

    titleLabel.translatesAutoresizingMaskIntoConstraints = false
    NSLayoutConstraint(item: titleLabel, attribute: .leading, relatedBy: .equal, toItem: contentView, attribute: .leadingMargin, multiplier: 1.0, constant: 0.0).isActive = true
    NSLayoutConstraint(item: titleLabel, attribute: .top, relatedBy: .equal, toItem: contentView, attribute: .topMargin, multiplier: 1.0, constant: 0.0).isActive = true
    NSLayoutConstraint(item: titleLabel, attribute: .bottom, relatedBy: .equal, toItem: contentView, attribute: .bottomMargin, multiplier: 1.0, constant: 0.0).isActive = true
//    NSLayoutConstraint(item: titleLabel, attribute: .trailing, relatedBy: .equal, toItem: contentView, attribute: .trailingMargin, multiplier: 1.0, constant: 0.0).isActive = true

    checkBoxImageView.translatesAutoresizingMaskIntoConstraints = false
    NSLayoutConstraint(item: checkBoxImageView, attribute: .leading, relatedBy: .greaterThanOrEqual, toItem: titleLabel, attribute: .trailing, multiplier: 1.0, constant: 0.0).isActive = true
    NSLayoutConstraint(item: checkBoxImageView, attribute: .top, relatedBy: .equal, toItem: contentView, attribute: .topMargin, multiplier: 1.0, constant: 0.0).isActive = true
    NSLayoutConstraint(item: checkBoxImageView, attribute: .bottom, relatedBy: .equal, toItem: contentView, attribute: .bottomMargin, multiplier: 1.0, constant: 0.0).isActive = true
    NSLayoutConstraint(item: checkBoxImageView, attribute: .trailing, relatedBy: .equal, toItem: contentView, attribute: .trailingMargin, multiplier: 1.0, constant: 0.0).isActive = true
    NSLayoutConstraint(item: checkBoxImageView, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: 50.0).isActive = true

  }

  private let titleLabel: UILabel
  private let checkBoxImageView: UIImageView
  private var state: AutoCollapseState
}
