//
//  RepresentativeTableViewCell.swift
//  Representatives
//
//  Created by Angela Montierth on 3/2/17.
//  Copyright © 2017 Angela Montierth. All rights reserved.
//

import UIKit

class RepresentativeTableViewCell: UITableViewCell {
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var partyLabel: UILabel!
    @IBOutlet weak var districtLabel: UILabel!
    @IBOutlet weak var websiteLabel: UILabel!
    @IBOutlet weak var phoneLabel: UILabel!
    
    var representative: Representative? {
        didSet {
            updateViews()
        }
    }
    
    func updateViews() {
        
        guard let representative = self.representative else { return }
        
        nameLabel.text = representative.name
        partyLabel.text = representative.party
        districtLabel.text = representative.district
        websiteLabel.text = representative.link
        phoneLabel.text = representative.phone
        
        
    }
}






