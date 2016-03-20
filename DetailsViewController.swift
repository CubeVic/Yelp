//
//  DetailsViewController.swift
//  Yelp
//
//  Created by victor aguirre on 3/20/16.
//  Copyright © 2016 Timothy Lee. All rights reserved.
//

import UIKit

class DetailsViewController: UIViewController {

    @IBOutlet weak var thumbnailImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var distanceLabel: UILabel!
    @IBOutlet weak var ratingImageView: UIImageView!
    @IBOutlet weak var reviewLabel: UILabel!
    @IBOutlet weak var addressLabel: UILabel!
    @IBOutlet weak var categoryLabel: UILabel!
    @IBOutlet weak var wrapperView: UIView!
    
    var business: Business!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        thumbnailImageView.setImageWithURL(business.imageURL!)
        thumbnailImageView.layer.cornerRadius = 5
        thumbnailImageView.clipsToBounds = true
        wrapperView.layer.cornerRadius = 5
        wrapperView.clipsToBounds = true
        nameLabel.text = business.name
        nameLabel.preferredMaxLayoutWidth = nameLabel.frame.size.width
        distanceLabel.text = "\(business.distance!)"
        ratingImageView.setImageWithURL(business.ratingImageURL!)
        reviewLabel.text = "\(business.reviewCount!) reviews"
        addressLabel.text = business.address
        categoryLabel.text = business.categories
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
