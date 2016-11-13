//
//  YelpFilterViewController.swift
//  Yelp
//
//  Created by Alex Liu on 10/28/16.
//  Copyright © 2016 Alex. All rights reserved.
//


import UIKit

protocol YelpFilterViewControllerDelegate: class {
  func viewController(viewController: YelpFilterViewController, didChangeFilters: [String], sortMode: YelpSortMode, deals: Bool, distance: String)
}

class YelpFilterViewController: BaseViewController {

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

    tableView.register(YelpFilterSwitchTableViewCell.self, forCellReuseIdentifier: "FilterSwitchCell")
    tableView.register(MoreTableViewCell.self, forCellReuseIdentifier: "MoreCell")
    tableView.register(AutoCollapseTableViewCell.self, forCellReuseIdentifier: "AutoCollapseCell")

    view.addSubview(tableView)


    navigationItem.leftBarButtonItem = UIBarButtonItem(
      title: "Cancel",
      style: .plain,
      target: self,
      action: #selector(YelpFilterViewController.leftBarButtonPressed))

    navigationItem.rightBarButtonItem = UIBarButtonItem(
      title: "Apply",
      style: .plain,
      target: self,
      action: #selector(YelpFilterViewController.rightBarButtonPressed))
  }

  private func setupConstraints() {
    tableView.translatesAutoresizingMaskIntoConstraints = false
    tableView.pinEdgesTo(view: view)
  }

  override func viewDidLoad() {
    super.viewDidLoad()

  }

  internal func leftBarButtonPressed(_ sender: AnyObject) {
    self.dismiss(animated: true, completion: nil)
  }

  internal func rightBarButtonPressed(_ sender: AnyObject) {
    self.delegate?.viewController(viewController: self, didChangeFilters: filters, sortMode: sorting[selectedSortingIndex]["code"] as! YelpSortMode, deals: includesDeal, distance: distances[selectedDistanceIndex]["code"]!)
    self.dismiss(animated: true, completion: nil)
  }

  // MARK: internal
  let tableView: UITableView
  weak var delegate: YelpFilterViewControllerDelegate?
  var categories: [[String: String]] = [
    ["name": "Afghan", "code": "afghani"],
    ["name": "African", "code": "african"],
    ["name": "American, New", "code": "newamerican"],
    ["name": "American, Traditional", "code": "tradamerican"],
    ["name": "Arabian", "code": "arabian"],
    ["name": "Argentine", "code": "argentine"],
    ["name": "Armenian", "code": "armenian"],
    ["name": "Asian Fusion", "code": "asianfusion"],
    ["name": "Asturian", "code": "asturian"],
    ["name": "Australian", "code": "australian"],
    ["name": "Austrian", "code": "austrian"],
    ["name": "Baguettes", "code": "baguettes"],
    ["name": "Bangladeshi", "code": "bangladeshi"],
    ["name": "Barbeque", "code": "bbq"],
    ["name": "Basque", "code": "basque"],
    ["name": "Bavarian", "code": "bavarian"],
    ["name": "Beer Garden", "code": "beergarden"],
    ["name": "Beer Hall", "code": "beerhall"],
    ["name": "Beisl", "code": "beisl"],
    ["name": "Belgian", "code": "belgian"],
    ["name": "Bistros", "code": "bistros"],
    ["name": "Black Sea", "code": "blacksea"],
    ["name": "Brasseries", "code": "brasseries"],
    ["name": "Brazilian", "code": "brazilian"],
    ["name": "Breakfast & Brunch", "code": "breakfast_brunch"],
    ["name": "British", "code": "british"],
    ["name": "Buffets", "code": "buffets"],
    ["name": "Bulgarian", "code": "bulgarian"],
    ["name": "Burgers", "code": "burgers"],
    ["name": "Burmese", "code": "burmese"],
    ["name": "Cafes", "code": "cafes"],
    ["name": "Cafeteria", "code": "cafeteria"],
    ["name": "Cajun/Creole", "code": "cajun"],
    ["name": "Cambodian", "code": "cambodian"],
    ["name": "Canadian", "code": "New)"],
    ["name": "Canteen", "code": "canteen"],
    ["name": "Caribbean", "code": "caribbean"],
    ["name": "Catalan", "code": "catalan"],
    ["name": "Chech", "code": "chech"],
    ["name": "Cheesesteaks", "code": "cheesesteaks"],
    ["name": "Chicken Shop", "code": "chickenshop"],
    ["name": "Chicken Wings", "code": "chicken_wings"],
    ["name": "Chilean", "code": "chilean"],
    ["name": "Chinese", "code": "chinese"],
    ["name": "Comfort Food", "code": "comfortfood"],
    ["name": "Corsican", "code": "corsican"],
    ["name": "Creperies", "code": "creperies"],
    ["name": "Cuban", "code": "cuban"],
    ["name": "Curry Sausage", "code": "currysausage"],
    ["name": "Cypriot", "code": "cypriot"],
    ["name": "Czech", "code": "czech"],
    ["name": "Czech/Slovakian", "code": "czechslovakian"],
    ["name": "Danish", "code": "danish"],
    ["name": "Delis", "code": "delis"],
    ["name": "Diners", "code": "diners"],
    ["name": "Dumplings", "code": "dumplings"],
    ["name": "Eastern European", "code": "eastern_european"],
    ["name": "Ethiopian", "code": "ethiopian"],
    ["name": "Fast Food", "code": "hotdogs"],
    ["name": "Filipino", "code": "filipino"],
    ["name": "Fish & Chips", "code": "fishnchips"],
    ["name": "Fondue", "code": "fondue"],
    ["name": "Food Court", "code": "food_court"],
    ["name": "Food Stands", "code": "foodstands"],
    ["name": "French", "code": "french"],
    ["name": "French Southwest", "code": "sud_ouest"],
    ["name": "Galician", "code": "galician"],
    ["name": "Gastropubs", "code": "gastropubs"],
    ["name": "Georgian", "code": "georgian"],
    ["name": "German", "code": "german"],
    ["name": "Giblets", "code": "giblets"],
    ["name": "Gluten-Free", "code": "gluten_free"],
    ["name": "Greek", "code": "greek"],
    ["name": "Halal", "code": "halal"],
    ["name": "Hawaiian", "code": "hawaiian"],
    ["name": "Heuriger", "code": "heuriger"],
    ["name": "Himalayan/Nepalese", "code": "himalayan"],
    ["name": "Hong Kong Style Cafe", "code": "hkcafe"],
    ["name": "Hot Dogs", "code": "hotdog"],
    ["name": "Hot Pot", "code": "hotpot"],
    ["name": "Hungarian", "code": "hungarian"],
    ["name": "Iberian", "code": "iberian"],
    ["name": "Indian", "code": "indpak"],
    ["name": "Indonesian", "code": "indonesian"],
    ["name": "International", "code": "international"],
    ["name": "Irish", "code": "irish"],
    ["name": "Island Pub", "code": "island_pub"],
    ["name": "Israeli", "code": "israeli"],
    ["name": "Italian", "code": "italian"],
    ["name": "Japanese", "code": "japanese"],
    ["name": "Jewish", "code": "jewish"],
    ["name": "Kebab", "code": "kebab"],
    ["name": "Korean", "code": "korean"],
    ["name": "Kosher", "code": "kosher"],
    ["name": "Kurdish", "code": "kurdish"],
    ["name": "Laos", "code": "laos"],
    ["name": "Laotian", "code": "laotian"],
    ["name": "Latin American", "code": "latin"],
    ["name": "Live/Raw Food", "code": "raw_food"],
    ["name": "Lyonnais", "code": "lyonnais"],
    ["name": "Malaysian", "code": "malaysian"],
    ["name": "Meatballs", "code": "meatballs"],
    ["name": "Mediterranean", "code": "mediterranean"],
    ["name": "Mexican", "code": "mexican"],
    ["name": "Middle Eastern", "code": "mideastern"],
    ["name": "Milk Bars", "code": "milkbars"],
    ["name": "Modern Australian", "code": "modern_australian"],
    ["name": "Modern European", "code": "modern_european"],
    ["name": "Mongolian", "code": "mongolian"],
    ["name": "Moroccan", "code": "moroccan"],
    ["name": "New Zealand", "code": "newzealand"],
    ["name": "Night Food", "code": "nightfood"],
    ["name": "Norcinerie", "code": "norcinerie"],
    ["name": "Open Sandwiches", "code": "opensandwiches"],
    ["name": "Oriental", "code": "oriental"],
    ["name": "Pakistani", "code": "pakistani"],
    ["name": "Parent Cafes", "code": "eltern_cafes"],
    ["name": "Parma", "code": "parma"],
    ["name": "Persian/Iranian", "code": "persian"],
    ["name": "Peruvian", "code": "peruvian"],
    ["name": "Pita", "code": "pita"],
    ["name": "Pizza", "code": "pizza"],
    ["name": "Polish", "code": "polish"],
    ["name": "Portuguese", "code": "portuguese"],
    ["name": "Potatoes", "code": "potatoes"],
    ["name": "Poutineries", "code": "poutineries"],
    ["name": "Pub Food", "code": "pubfood"],
    ["name": "Rice", "code": "riceshop"],
    ["name": "Romanian", "code": "romanian"],
    ["name": "Rotisserie Chicken", "code": "rotisserie_chicken"],
    ["name": "Rumanian", "code": "rumanian"],
    ["name": "Russian", "code": "russian"],
    ["name": "Salad", "code": "salad"],
    ["name": "Sandwiches", "code": "sandwiches"],
    ["name": "Scandinavian", "code": "scandinavian"],
    ["name": "Scottish", "code": "scottish"],
    ["name": "Seafood", "code": "seafood"],
    ["name": "Serbo Croatian", "code": "serbocroatian"],
    ["name": "Signature Cuisine", "code": "signature_cuisine"],
    ["name": "Singaporean", "code": "singaporean"],
    ["name": "Slovakian", "code": "slovakian"],
    ["name": "Soul Food", "code": "soulfood"],
    ["name": "Soup", "code": "soup"],
    ["name": "Southern", "code": "southern"],
    ["name": "Spanish", "code": "spanish"],
    ["name": "Steakhouses", "code": "steak"],
    ["name": "Sushi Bars", "code": "sushi"],
    ["name": "Swabian", "code": "swabian"],
    ["name": "Swedish", "code": "swedish"],
    ["name": "Swiss Food", "code": "swissfood"],
    ["name": "Tabernas", "code": "tabernas"],
    ["name": "Taiwanese", "code": "taiwanese"],
    ["name": "Tapas Bars", "code": "tapas"],
    ["name": "Tapas/Small Plates", "code": "tapasmallplates"],
    ["name": "Tex-Mex", "code": "tex-mex"],
    ["name": "Thai", "code": "thai"],
    ["name": "Traditional Norwegian", "code": "norwegian"],
    ["name": "Traditional Swedish", "code": "traditional_swedish"],
    ["name": "Trattorie", "code": "trattorie"],
    ["name": "Turkish", "code": "turkish"],
    ["name": "Ukrainian", "code": "ukrainian"],
    ["name": "Uzbek", "code": "uzbek"],
    ["name": "Vegan", "code": "vegan"],
    ["name": "Vegetarian", "code": "vegetarian"],
    ["name": "Venison", "code": "venison"],
    ["name": "Vietnamese", "code": "vietnamese"],
    ["name": "Wok", "code": "wok"],
    ["name": "Wraps", "code": "wraps"],
    ["name": "Yugoslav", "code": "yugoslav"]
  ]

  var activeSwitchFilters: Set<String> = Set<String>()
  var filters: [String] {
    return Array(activeSwitchFilters)
  }
  var includesDeal: Bool = false
  var includesDealTitle: String = "Offering a Deal"

  var collapsedSections: [Bool] = [true, true, true, true]
  var maximumSectionsWhenCollapsed: [Int] = [1, 1, 1, 5]

  var distances: [[String: String]] = [
    ["name": "Auto"],
    ["name": "0.3 miles", "code": "482"],
    ["name": "1 mile", "code": "1609"],
    ["name": "5 miles", "code": "8046"],
    ["name": "10 miles", "code": "16093"]]

  var sorting: [[String: Any]] = [
    ["name": "Best Match", "code": YelpSortMode.bestMatched],
    ["name": "Distance", "code": YelpSortMode.distance],
    ["name": "Highest Rated", "code": YelpSortMode.highestRated]
  ]

  var selectedDistanceIndex: Int = 0
  var selectedSortingIndex: Int = 0
}

extension YelpFilterViewController: UITableViewDataSource {
  public func numberOfSections(in tableView: UITableView) -> Int {
    return 4
  }

  public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    switch section {
    case 0:
      return 1
    case 1:
      if collapsedSections[1] {
        return maximumSectionsWhenCollapsed[1]
      }
      return distances.count
    case 2:
      if collapsedSections[2] {
        return maximumSectionsWhenCollapsed[2]
      }
      return sorting.count
    case 3:
      if collapsedSections[3] {
        return maximumSectionsWhenCollapsed[3]
      }
      return categories.count
    default:
      return 0
    }
  }

  public func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
    switch section {
    case 0:
      return "Deals"
    case 1:
      return "Distance"
    case 2:
      return "Sort by"
    case 3:
      return "Categories"
    default:
      return nil
    }
  }

  public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let section = indexPath.section
    let row = indexPath.row

    switch section {
    case 0:
      let cell = tableView.dequeueReusableCell(withIdentifier: "FilterSwitchCell", for: indexPath)

      if let switchCell = cell as? YelpFilterSwitchTableViewCell {
        switchCell.setContent(title: includesDealTitle, isSwitchOn: includesDeal)
        switchCell.delegate = self
        return switchCell
      }
      return cell
    case 1:
      let cell = tableView.dequeueReusableCell(withIdentifier: "AutoCollapseCell", for: indexPath)
      if let autoCollapseCell = cell as? AutoCollapseTableViewCell {
        if collapsedSections[section] {
          autoCollapseCell.setContent(title: distances[selectedDistanceIndex]["name"]!, state: .collapsed)
        } else {
          let state: AutoCollapseState = (selectedDistanceIndex == row) ? .selected : .unselected
          autoCollapseCell.setContent(title: distances[row]["name"]!, state: state)
        }

        return autoCollapseCell
      }
      return cell
    case 2:
      let cell = tableView.dequeueReusableCell(withIdentifier: "AutoCollapseCell", for: indexPath)
      if let autoCollapseCell = cell as? AutoCollapseTableViewCell {
        if collapsedSections[section] {
          autoCollapseCell.setContent(title: sorting[selectedSortingIndex]["name"] as! String, state: .collapsed)
        } else {
          let state: AutoCollapseState = (selectedSortingIndex == row) ? .selected : .unselected
          autoCollapseCell.setContent(title: sorting[row]["name"] as! String, state: state)
        }

        return autoCollapseCell
      }
      return cell
    case 3:
      if collapsedSections[section] && row + 1 == maximumSectionsWhenCollapsed[section] {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MoreCell", for: indexPath)
        return cell
      }
      let cell = tableView.dequeueReusableCell(withIdentifier: "FilterSwitchCell", for: indexPath)

      if let switchCell = cell as? YelpFilterSwitchTableViewCell {
        if let title = categories[row]["name"], let code = categories[row]["code"] {
          switchCell.setContent(title: title, isSwitchOn: activeSwitchFilters.contains(code))
          switchCell.delegate = self
          return switchCell
        }
      }
      return cell
    default:
      let cell = UITableViewCell()
      return cell
    }
  }
}

extension YelpFilterViewController: YelpFilterSwitchTableViewCellDelegate {
  func switchCell(switchCell: YelpFilterSwitchTableViewCell, didUpdateValue: Bool) {
    if let indexPath = self.tableView.indexPath(for: switchCell) {
      if indexPath.section == 0 {
        return
      }

      if let code = categories[indexPath.row]["code"] {
        if didUpdateValue {
          self.activeSwitchFilters.insert(code)
        } else {
          self.activeSwitchFilters.remove(code)
        }
      }
    }
  }
}

extension YelpFilterViewController: UITableViewDelegate {
  public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    let section = indexPath.section
    let row = indexPath.row

    if !collapsedSections[section] {
      switch section {
      case 1:
        self.selectedDistanceIndex = row
        collapsedSections[section] = true
        tableView.reloadData()
        break
      case 2:
        self.selectedSortingIndex = row
        collapsedSections[section] = true
        tableView.reloadData()
        break
      default:
        break
      }
    } else if collapsedSections[section] && row == maximumSectionsWhenCollapsed[section] - 1 {
      collapsedSections[section] = !collapsedSections[section]
      tableView.reloadData()
    }

  }
}
