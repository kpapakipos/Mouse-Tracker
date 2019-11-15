//
//  AdventureTableViewCell.swift
//  Mouse-Tracker
//
//  Created by Jack Dangelmaier on 11/14/19.
//  Copyright © 2019 Keegan Papakipos. All rights reserved.
//

import UIKit

class AdventureTableViewCell: UITableViewCell {

    @IBOutlet weak var AdventureName: UILabel!
    
    @IBOutlet weak var ProgressStatus: UILabel!
    
    @IBOutlet weak var Details: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
