//
//  BusinessListViewController.swift
//  Yelp
//
//  Created by Alex Liu on 10/25/16.
//  Copyright © 2016 Timothy Lee. All rights reserved.
//

import UIKit

class BusinessListViewController: BaseViewController {

  override init() {
    tableView = UITableView(frame: UIScreen.main.bounds, style: UITableViewStyle.plain)
    super.init()

    edgesForExtendedLayout = []
    self.setupViews()
    self.setupConstraints()

  }
  
  public required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  private func setupViews() {
    view.backgroundColor = UIColor.white

    tableView.delegate = self
    tableView.dataSource = self
    tableView.backgroundColor = UIColor.blue
    tableView.rowHeight = UITableViewAutomaticDimension
    tableView.estimatedRowHeight = 45
    tableView.backgroundColor = UIColor.white

    tableView.register(YelpRestaurantTableViewCell.self, forCellReuseIdentifier: "RestaurantCell")

    view.addSubview(tableView)
  }

  private func setupConstraints() {
    tableView.translatesAutoresizingMaskIntoConstraints = false
    tableView.pinEdgesTo(view: view)
  }

  // MARK: internal
  var businesses: [Business]!
  let tableView: UITableView
}

extension BusinessListViewController: UITableViewDataSource {
  public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return 1
  }

  public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "RestaurantCell", for: indexPath)
    return cell
  }
}

extension BusinessListViewController: UITableViewDelegate {

}
