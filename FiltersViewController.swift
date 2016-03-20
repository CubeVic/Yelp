//
//  FiltersViewController.swift
//  Yelp
//
//  Created by victor aguirre on 3/19/16.
//  Copyright © 2016 Timothy Lee. All rights reserved.
//

import UIKit

@objc protocol FiltersViewControllerDelegate {
    optional func filtersViewController(filtersViewController: FiltersViewController, didUpdateFilters filters: [String:AnyObject])
}


enum sections : String {
    case category = "Category"
    case sort = "Filter by"
    case deal = "Deal"
}

class FiltersViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, SwitchCellDelegate, DealCellDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    var categories: [[String:String]]!
    var sort: [[String:String]]!
    
    var switchStates = [Int:Bool]()
    var dealState = [Int:Bool]()
    
    weak var delegate: FiltersViewControllerDelegate?
    
    let filterStructure: [[sections]] = [[.category],[.sort],[.deal]]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        categories = yelpCategories()
        sort = yelpSort()
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return filterStructure.count ?? 0
    }
    
    func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        
        if section == 0 {
            return sections.category.rawValue
        } else if section == 1 {
            return sections.sort.rawValue
        } else {
            return sections.deal.rawValue
        }
        
        //return "this is a section"
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return categories.count
        } else if section == 1 {
            return 3
        } else {
            return 1
        }
        
        
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
            switch indexPath.section {
                case 0:
                    let cell = tableView.dequeueReusableCellWithIdentifier("SwitchCell", forIndexPath: indexPath) as! SwitchCell
                        cell.categoryLabel.text = categories[indexPath.row]["name"]
                        cell.delegate = self
                        cell.onSwitch.on = switchStates[indexPath.row]  ?? false
                return cell
                
                case 1:
                    let cell = tableView.dequeueReusableCellWithIdentifier("SortCell", forIndexPath: indexPath) as! SortCell
                        cell.sortLabel.text = sort[indexPath.row]["name"]
                    
                return cell
                
                case 2:
                    let cell = tableView.dequeueReusableCellWithIdentifier("DealCell", forIndexPath: indexPath) as! DealCell
                    cell.delegate = self
                    cell.dealSwitch.on = dealState[indexPath.row] ?? false
                return cell
                
                default:
                return UITableViewCell()
                
            }
    }
    
    
    @IBAction func onCancelButton(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    
    @IBAction func onSearchButton(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion: nil)
        var filters = [String : AnyObject]()
        
        var selectedCategories = [String]()
        
        for (row,isSelected) in switchStates {
            if isSelected {
                selectedCategories.append(categories[row]["code"]!)
            }
        }
        
        if selectedCategories.count > 0 {
            filters["categories"] = selectedCategories
        }
        
        filters["deal"] = dealState[0] ?? false
        
        delegate?.filtersViewController?(self, didUpdateFilters: filters)
    }
    
    func switchCell(switchCell: SwitchCell, didChangeValue value: Bool) {
        let indexPath = tableView.indexPathForCell(switchCell)!
        switchStates[indexPath.row] = value
        
    }
    
    func dealCell(dealCell: DealCell, didChangeValue value: Bool) {
        let indexPath = tableView.indexPathForCell(dealCell)!
        dealState[indexPath.row] = value
    }
    
    func yelpCategories() -> [[String:String]]{
        return [["name" : "Afghan" , "code" : "afghani"],
            ["name" : "African" , "code" : "african"],
            ["name" : "American, new" , "code" : "newamerican"],
            ["name" : "Argentine" , "code" : "argentine"],
            ["name" : "Australian" , "code" : "australian"]]
    }
    
    func yelpSort() -> [[String:String]] {
        return [["name" : "Best Matched", "code" : ".BestMatched"], ["name" : "Distance" , "code" : ".Distance"], ["name" : "HighestRated", "code" : ".HighestRated"]]
    }
    
    /*
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
    // Get the new view controller using segue.destinationViewController.
    // Pass the selected object to the new view controller.
    }
    */
    
}
