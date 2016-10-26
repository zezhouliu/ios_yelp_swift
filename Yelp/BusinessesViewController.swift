//
//  BusinessesViewController.swift
//  Yelp
//
//  Created by Timothy Lee on 4/23/15.
//  Copyright (c) 2015 Timothy Lee. All rights reserved.
//

import UIKit

class BusinessesViewController: UIViewController {

  // MARK: Lifecycle
  init() {
    tableView = UITableView(frame: UIScreen.main.bounds, style: UITableViewStyle.plain)
    super.init(nibName: nil, bundle: nil)

    edgesForExtendedLayout = []
    self.setupViews()
    self.setupConstraints()

  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  override func viewDidLoad() {
    super.viewDidLoad()

    view.backgroundColor = UIColor.cyan
//    updateViewConstraints()
    
    Business.searchWithTerm(term: "Thai", completion: { (businesses: [Business]?, error: Error?) -> Void in
      self.businesses = businesses
      if let businesses = businesses {
        for business in businesses {
            print(business.name!)
            print(business.address!)
        }
      }
    }
  )

  /* Example of Yelp search with more search options specified
   Business.searchWithTerm("Restaurants", sort: .Distance, categories: ["asianfusion", "burgers"], deals: true) { (businesses: [Business]!, error: NSError!) -> Void in
   self.businesses = businesses
   
   for business in businesses {
     print(business.name!)
     print(business.address!)
     }
   }
   */
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }

  private func setupViews() {
    tableView.delegate = self
    tableView.dataSource = self
    tableView.rowHeight = UITableViewAutomaticDimension
    tableView.estimatedRowHeight = 45

    view.addSubview(tableView)
  }

  private func setupConstraints() {
    tableView.translatesAutoresizingMaskIntoConstraints = false
    tableView.pinEdgesTo(view: view)
    tableView.backgroundColor = UIColor.white
  }

  var businesses: [Business]!
  let tableView: UITableView

  /*
   // MARK: - Navigation
   
   // In a storyboard-based application, you will often want to do a little preparation before navigation
   override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
   // Get the new view controller using segue.destinationViewController.
   // Pass the selected object to the new view controller.
   }
   */
}

extension BusinessesViewController: UITableViewDataSource {
  public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return 1
  }

  public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "RestaurantCell", for: indexPath)
    return cell
  }
}

extension BusinessesViewController: UITableViewDelegate {

}
