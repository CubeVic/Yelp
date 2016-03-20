//
//  BusinessesViewController.swift
//  Yelp
//
//  Created by Timothy Lee on 4/23/15.
//  Copyright (c) 2015 Timothy Lee. All rights reserved.
//

import UIKit

class BusinessesViewController: UIViewController, UITableViewDelegate,UITableViewDataSource, UISearchBarDelegate, FiltersViewControllerDelegate {

    var businesses: [Business]!

    @IBOutlet weak var tableView: UITableView!
    var searchBar: UISearchBar!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        searchBar = UISearchBar()
        searchBar.sizeToFit()
        navigationItem.titleView = searchBar
        searchBar.delegate = self
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = 120
        

        Business.searchWithTerm("Thai", completion: { (businesses: [Business]!, error: NSError!) -> Void in
            self.businesses = businesses
            
            self.tableView.reloadData()
        
            for business in businesses {
                print(business.name!)
                print(business.address!)
            }
        })

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
    
    

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if businesses != nil {
            return businesses.count
        } else {
            return 0
        }
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("BusinessCell", forIndexPath: indexPath) as! BusinessCell
        
        cell.business = businesses[indexPath.row]
        
        return cell
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "detailsSegue" {
            let cell = sender as! UITableViewCell
            let indexPath = tableView.indexPathForCell(cell)
            print(indexPath?.row)
            let vc = segue.destinationViewController as! DetailsViewController
            vc.business = businesses[(indexPath?.row)!]
            
        }else {
            let navigationController = segue.destinationViewController as! UINavigationController
            let filtersViewController = navigationController.topViewController as! FiltersViewController
            filtersViewController.delegate = self
        }

    }
    
    
    
    func filtersViewController(filtersViewController: FiltersViewController, didUpdateFilters filters: [String : AnyObject]) {
        
        let categories = filters["categories"] as? [String]
        let deal = filters["deal"] as! Bool
        let sort = filters["sort"] as! Int

        
        switch sort {
            case 0:
                Business.searchWithTerm("Restaurants", sort: YelpSortMode.BestMatched, categories: categories, deals: deal){
                    (businesses: [Business]!, error: NSError!) -> Void in
                    self.businesses = businesses
                    self.tableView.reloadData()
            }
            case 1:
                Business.searchWithTerm("Restaurants", sort: YelpSortMode.Distance, categories: categories, deals: deal){
                    (businesses: [Business]!, error: NSError!) -> Void in
                    self.businesses = businesses
                    self.tableView.reloadData()
            }
            case 2:
                Business.searchWithTerm("Restaurants", sort: YelpSortMode.HighestRated, categories: categories, deals: deal){
                    (businesses: [Business]!, error: NSError!) -> Void in
                    self.businesses = businesses
                    self.tableView.reloadData()
            }
            default:
                Business.searchWithTerm("Restaurants", sort: nil, categories: categories, deals: deal){
                    (businesses: [Business]!, error: NSError!) -> Void in
                    self.businesses = businesses
                    self.tableView.reloadData()
            }
        }
        
    }
    
    func searchBar(searchBar: UISearchBar, textDidChange searchText: String) {
        
        Business.searchWithTerm(searchText, sort: nil, categories: ["asianfusion", "burgers"], deals: nil) {
            (businesses: [Business]!, error: NSError!) -> Void in
            self.businesses = businesses
            self.tableView.reloadData()
        }

    }
    
    
    
    
}