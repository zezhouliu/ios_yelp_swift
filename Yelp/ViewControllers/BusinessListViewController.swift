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
    searchBar = UISearchBar()

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

    searchBar.sizeToFit()
    searchBar.delegate = self

    view.addSubview(tableView)
    navigationItem.titleView = searchBar

    navigationItem.leftBarButtonItem = UIBarButtonItem(
      title: "Filter",
      style: .plain,
      target: self,
      action: #selector(BusinessListViewController.leftBarButtonPressed))
  }

  internal func leftBarButtonPressed(_ sender: AnyObject) {
    let filterViewController = YelpFilterViewController()
    let filterNavigationController = UINavigationController(rootViewController: filterViewController)
    filterViewController.delegate = self
    self.present(filterNavigationController, animated: true, completion: nil)
  }

  private func setupConstraints() {
    tableView.translatesAutoresizingMaskIntoConstraints = false
    tableView.pinEdgesTo(view: view)
  }

  override func viewDidLoad() {
    super.viewDidLoad()

    searchWithTerm(term: activeTerm)

  }

  func searchWithTerm(term: String) {
    Business.searchWithTerm(term: term, completion:
      { (businesses: [Business]?, error: Error?) -> Void in
        self.businesses = businesses
        if businesses != nil {
          self.tableView.reloadData()
        }
      }
    )
  }

  // MARK: internal
  var businesses: [Business]?
  let tableView: UITableView
  let searchBar: UISearchBar
  var activeTerm: String = "Restaurants"
}

extension BusinessListViewController: YelpFilterViewControllerDelegate {

  func viewController(viewController: YelpFilterViewController, didChangeFilters: [String], sortMode: YelpSortMode, deals: Bool, distance: String) {

    Business.searchWithTerm(term: activeTerm, sort: sortMode, categories: didChangeFilters, deals: deals, distance: distance, completion: {
      (businesses: [Business]?, error: Error?) -> Void in
      self.businesses = businesses
      if businesses != nil {
        self.tableView.reloadData()
      }
    })
  }
}

extension BusinessListViewController: UITableViewDataSource {
  public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    if let businesses = self.businesses {
      return businesses.count
    }

    return 0
  }

  public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "RestaurantCell", for: indexPath)

    if let restaurantCell = cell as? YelpRestaurantTableViewCell, let businesses = self.businesses {
      restaurantCell.setContent(content: YelpRestaurantTableViewCellContent(business:businesses[indexPath.row]))
      return restaurantCell
    }
    return cell
  }
}

extension BusinessListViewController: UITableViewDelegate {

}

extension BusinessListViewController: UISearchBarDelegate {
  func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
    self.searchBar.showsCancelButton = true
  }

  func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
    searchBar.showsCancelButton = false
    searchBar.text = ""
    searchBar.resignFirstResponder()
  }

  public func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
    if let text = searchBar.text {
      activeTerm = text
      self.searchWithTerm(term: activeTerm)
    }
  }
}
