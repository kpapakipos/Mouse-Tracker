//
//  ActivityTableViewCell.swift
//  Mouse-Tracker
//
//  Created by Jack Dangelmaier on 11/14/19.
//  Copyright © 2019 Keegan Papakipos. All rights reserved.
//

import UIKit

class ActivityTableViewCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    @IBOutlet weak var ActivityNameLabel: UILabel!
    
    @IBOutlet weak var MickeyCheckBox: UIImageView!
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
