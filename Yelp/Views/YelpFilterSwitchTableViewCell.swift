//
//  YelpFilterSwitchTableViewCell.swift
//  Yelp
//
//  Created by Alex Liu on 11/8/16.
//  Copyright © 2016 Alex. All rights reserved.
//

import UIKit
import AFNetworking

protocol YelpFilterSwitchTableViewCellDelegate: class {
  func switchCell(switchCell: YelpFilterSwitchTableViewCell, didUpdateValue: Bool)
}

class YelpFilterSwitchTableViewCell: UITableViewCell {

  public override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
    switchTitleLabel = UILabel()
    switchView = UISwitch()

    super.init(style: style, reuseIdentifier: reuseIdentifier)

    setupViews()
    setupConstraints()
  }

  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  // MARK: Public
  public func setContent(title: String, isSwitchOn: Bool) {
    switchTitleLabel.text = title
    switchView.setOn(isSwitchOn, animated: false)
  }

  private func setupViews() {
    switchTitleLabel.font = switchTitleLabel.font.withSize(20)
    switchTitleLabel.text = "title"

    switchView.addTarget(self, action: #selector(YelpFilterSwitchTableViewCell.switchToggled), for: .valueChanged)

    self.contentView.addSubview(switchTitleLabel)
    self.contentView.addSubview(switchView)
    self.selectionStyle = .none
  }

  private func setupConstraints() {

    switchTitleLabel.translatesAutoresizingMaskIntoConstraints = false
    NSLayoutConstraint(item: switchTitleLabel, attribute: .leading, relatedBy: .equal, toItem: contentView, attribute: .leadingMargin, multiplier: 1.0, constant: 0.0).isActive = true
    NSLayoutConstraint(item: switchTitleLabel, attribute: .top, relatedBy: .equal, toItem: contentView, attribute: .topMargin, multiplier: 1.0, constant: 0.0).isActive = true
    NSLayoutConstraint(item: switchTitleLabel, attribute: .bottom, relatedBy: .equal, toItem: contentView, attribute: .bottomMargin, multiplier: 1.0, constant: 0.0).isActive = true

    switchView.translatesAutoresizingMaskIntoConstraints = false
//    NSLayoutConstraint(item: switchView, attribute: .leading, relatedBy: .equal, toItem: restaurantRatingImageView, attribute: .leading, multiplier: 1.0, constant: 0.0).isActive = true
    NSLayoutConstraint(item: switchView, attribute: .top, relatedBy: .equal, toItem: contentView, attribute: .topMargin, multiplier: 1.0, constant: 0.0).isActive = true
    NSLayoutConstraint(item: switchView, attribute: .trailing, relatedBy: .equal, toItem: contentView, attribute: .trailingMargin, multiplier: 1.0, constant: 0.0).isActive = true
    NSLayoutConstraint(item: switchView, attribute: .bottom, relatedBy: .equal, toItem: contentView, attribute: .bottomMargin, multiplier: 1.0, constant: 0.0).isActive = true
  }

  func switchToggled(_ sender: AnyObject) {
    self.delegate?.switchCell(switchCell: self, didUpdateValue: switchView.isOn)
  }

  weak var delegate: YelpFilterSwitchTableViewCellDelegate?

  // MARK: Private
  private let switchTitleLabel: UILabel
  private let switchView: UISwitch

}
