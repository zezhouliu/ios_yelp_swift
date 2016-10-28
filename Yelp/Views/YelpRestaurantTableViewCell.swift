//
//  YelpRestaurantTableViewCell.Swift
//  Yelp
//
//  Created by Alex Liu on 10/26/16.
//  Copyright © 2016 codepath. All rights reserved.
//

import UIKit
import AFNetworking

public struct YelpRestaurantTableViewCellContent {

  init(business: Business) {
    businessName = business.name
    businessAddress = business.address
    businessImageUrl = business.imageURL
    businessReviewCount = business.reviewCount
    businessDistance = business.distance
    businessRatingImageUrl = business.ratingImageURL
    businessCategories = business.categories
  }

  let businessName: String?
  let businessAddress: String?
  let businessImageUrl: URL?
  let businessReviewCount: NSNumber?
  let businessDistance: String?
  let businessRatingImageUrl: URL?
  let businessCategories: String?
}

class YelpRestaurantTableViewCell: UITableViewCell {

  public override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
    restaurantTitleLabel = UILabel()
    restaurantImageView = UIImageView()
    restaurantRatingImageView = UIImageView()
    reviewsLabel = UILabel()
    distanceLabel = UILabel()
    addressLabel = UILabel()
    categoriesLabel = UILabel()

    super.init(style: style, reuseIdentifier: reuseIdentifier)

    setupViews()
    setupConstraints()
  }

  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  // MARK: Public
  public func setContent(content: YelpRestaurantTableViewCellContent) {
    if let businessName = content.businessName {
      restaurantTitleLabel.text = businessName
    }

    if let businessAddress = content.businessAddress {
      addressLabel.text = businessAddress
    }

    if let businessImageUrl = content.businessImageUrl {
      restaurantImageView.setImageWith(businessImageUrl)
    }

    if let businessReviewCount = content.businessReviewCount {
      reviewsLabel.text = "\(businessReviewCount) Reviews"
    }

    if let businessDistance = content.businessDistance {
      distanceLabel.text = businessDistance
    }

    if let businessRatingImageUrl = content.businessRatingImageUrl {
      restaurantRatingImageView.setImageWith(businessRatingImageUrl)
    }

    if let categories = content.businessCategories {
      categoriesLabel.text = categories
    }
  }

  private func setupViews() {
    restaurantTitleLabel.font = restaurantTitleLabel.font.withSize(20)
    distanceLabel.textColor = UIColor.gray

    restaurantRatingImageView.contentMode = .scaleAspectFit
    reviewsLabel.textColor = UIColor.gray
    reviewsLabel.contentMode = .center
    reviewsLabel.sizeToFit()

    addressLabel.numberOfLines = 0

    categoriesLabel.numberOfLines = 0
    categoriesLabel.textColor = UIColor.gray

    self.contentView.addSubview(restaurantTitleLabel)
    self.contentView.addSubview(restaurantImageView)
    self.contentView.addSubview(restaurantRatingImageView)
    self.contentView.addSubview(reviewsLabel)
    self.contentView.addSubview(distanceLabel)
    self.contentView.addSubview(addressLabel)
    self.contentView.addSubview(categoriesLabel)
  }

  private func setupConstraints() {

    restaurantImageView.translatesAutoresizingMaskIntoConstraints = false
    NSLayoutConstraint(item: restaurantImageView, attribute: .leading, relatedBy: .equal, toItem: contentView, attribute: .leadingMargin, multiplier: 1.0, constant: 0.0).isActive = true
    NSLayoutConstraint(item: restaurantImageView, attribute: .top, relatedBy: .equal, toItem: contentView, attribute: .topMargin, multiplier: 1.0, constant: 0.0).isActive = true
    NSLayoutConstraint(item: restaurantImageView, attribute: .bottom, relatedBy: .lessThanOrEqual, toItem: contentView, attribute: .bottomMargin, multiplier: 1.0, constant: 0.0).isActive = true
    NSLayoutConstraint(item: restaurantImageView, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: 80).isActive = true
    NSLayoutConstraint(item: restaurantImageView, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: 80).isActive = true

    restaurantTitleLabel.translatesAutoresizingMaskIntoConstraints = false
    NSLayoutConstraint(item: restaurantTitleLabel, attribute: .leading, relatedBy: .equal, toItem: restaurantImageView, attribute: .trailing, multiplier: 1.0, constant: 5.0).isActive = true
    NSLayoutConstraint(item: restaurantTitleLabel, attribute: .top, relatedBy: .equal, toItem: self.contentView, attribute: .topMargin, multiplier: 1.0, constant: 0.0).isActive = true

    distanceLabel.translatesAutoresizingMaskIntoConstraints = false
    NSLayoutConstraint(item: restaurantTitleLabel, attribute: .trailing, relatedBy: .lessThanOrEqual, toItem: distanceLabel, attribute: .leading, multiplier: 1.0, constant: -5.0).isActive = true
    NSLayoutConstraint(item: distanceLabel, attribute: .trailing, relatedBy: .equal, toItem: contentView, attribute: .trailingMargin, multiplier: 1.0, constant: 0.0).isActive = true
    NSLayoutConstraint(item: distanceLabel, attribute: .top, relatedBy: .equal, toItem: contentView, attribute: .topMargin, multiplier: 1.0, constant: 0.0).isActive = true
    NSLayoutConstraint(item: distanceLabel, attribute: .bottom, relatedBy: .equal, toItem: restaurantTitleLabel, attribute: .bottom, multiplier: 1.0, constant: 0.0).isActive = true

    restaurantRatingImageView.translatesAutoresizingMaskIntoConstraints = false
    NSLayoutConstraint(item: restaurantRatingImageView, attribute: .top, relatedBy: .equal, toItem: restaurantTitleLabel, attribute: .bottom, multiplier: 1.0, constant: 0.0).isActive = true
    NSLayoutConstraint(item: restaurantRatingImageView, attribute: .leading, relatedBy: .equal, toItem: restaurantImageView, attribute: .trailing, multiplier: 1.0, constant: 5.0).isActive = true
    NSLayoutConstraint(item: restaurantRatingImageView, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: 100.0).isActive = true

    reviewsLabel.translatesAutoresizingMaskIntoConstraints = false
    NSLayoutConstraint(item: reviewsLabel, attribute: .top, relatedBy: .equal, toItem: restaurantTitleLabel, attribute: .bottom, multiplier: 1.0, constant: 0.0).isActive = true
    NSLayoutConstraint(item: reviewsLabel, attribute: .leading, relatedBy: .equal, toItem: restaurantRatingImageView, attribute: .trailing, multiplier: 1.0, constant: 5.0).isActive = true
    NSLayoutConstraint(item: reviewsLabel, attribute: .trailing, relatedBy: .lessThanOrEqual, toItem: contentView, attribute: .trailingMargin, multiplier: 1.0, constant: 0.0).isActive = true
    NSLayoutConstraint(item: reviewsLabel, attribute: .bottom, relatedBy: .equal, toItem: restaurantRatingImageView, attribute: .bottom, multiplier: 1.0, constant: 0.0).isActive = true


    addressLabel.translatesAutoresizingMaskIntoConstraints = false
    NSLayoutConstraint(item: addressLabel, attribute: .leading, relatedBy: .equal, toItem: restaurantRatingImageView, attribute: .leading, multiplier: 1.0, constant: 0.0).isActive = true
    NSLayoutConstraint(item: addressLabel, attribute: .top, relatedBy: .equal, toItem: restaurantRatingImageView, attribute: .bottom, multiplier: 1.0, constant: 0.0).isActive = true
    NSLayoutConstraint(item: addressLabel, attribute: .trailing, relatedBy: .lessThanOrEqual, toItem: contentView, attribute: .trailingMargin, multiplier: 1.0, constant: 0.0).isActive = true

    categoriesLabel.translatesAutoresizingMaskIntoConstraints = false
    NSLayoutConstraint(item: categoriesLabel, attribute: .leading, relatedBy: .equal, toItem: restaurantRatingImageView, attribute: .leading, multiplier: 1.0, constant: 0.0).isActive = true
    NSLayoutConstraint(item: categoriesLabel, attribute: .top, relatedBy: .equal, toItem: addressLabel, attribute: .bottom, multiplier: 1.0, constant: 0.0).isActive = true
    NSLayoutConstraint(item: categoriesLabel, attribute: .trailing, relatedBy: .lessThanOrEqual, toItem: contentView, attribute: .trailingMargin, multiplier: 1.0, constant: 0.0).isActive = true
    NSLayoutConstraint(item: categoriesLabel, attribute: .bottom, relatedBy: .equal, toItem: contentView, attribute: .bottomMargin, multiplier: 1.0, constant: 0.0).isActive = true
  }

  // MARK: Private
  private let restaurantTitleLabel: UILabel
  private let restaurantImageView: UIImageView
  private let restaurantRatingImageView: UIImageView
  private let reviewsLabel: UILabel
  private let distanceLabel: UILabel
  private let addressLabel: UILabel
  private let categoriesLabel: UILabel
}
