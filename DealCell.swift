//
//  DealCell.swift
//  Yelp
//
//  Created by victor aguirre on 3/20/16.
//  Copyright © 2016 Timothy Lee. All rights reserved.
//

import UIKit

@objc protocol DealCellDelegate {
   optional func dealCell(dealCell: DealCell, didChangeValue value: Bool)
}

class DealCell: UITableViewCell {

    @IBOutlet weak var dealSwitch: UISwitch!
    
    weak var delegate: DealCellDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
     
        dealSwitch.addTarget(self, action: "switchChanged", forControlEvents: UIControlEvents.ValueChanged)
    }


    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    
    func switchChanged() {
        delegate?.dealCell?(self, didChangeValue: dealSwitch.on)
    }
    
}
