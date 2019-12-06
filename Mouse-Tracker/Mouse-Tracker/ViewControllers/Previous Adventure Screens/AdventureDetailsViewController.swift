//
//  AdventureDetailsViewController.swift
//  Mouse-Tracker
//
//  Created by Jack Dangelmaier on 11/19/19.
//  Copyright © 2019 Keegan Papakipos. All rights reserved.
//

import UIKit

class AdventureDetailsViewController: UIViewController {

    @IBOutlet weak var AdventureName: UILabel!
    
    @IBOutlet weak var parkLabel: UILabel!
    @IBOutlet weak var parksValue: UILabel!
    
    @IBOutlet weak var parkLandLabel: UILabel!
    @IBOutlet weak var parkLandValues: UILabel!
    
    @IBOutlet weak var densityLabel: UILabel!
    @IBOutlet weak var densityValue: UILabel!
    
    @IBOutlet weak var intensityLabel: UILabel!
    @IBOutlet weak var intensityValue: UILabel!
    
    @IBOutlet weak var kidFriendlyLabel: UILabel!
    @IBOutlet weak var kidFriendlyValue: UILabel!
    
    @IBOutlet weak var heightRestrictedLabel: UILabel!
    @IBOutlet weak var heightRestrictedValue: UILabel!
    
    @IBOutlet weak var advPagePicture: UIImageView!
    
    var adventure: Adventure!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.AdventureName.text = adventure.title
        self.AdventureName.font = UIFont.boldSystemFont(ofSize: 40.0)
        self.parksValue.text = adventure.options["park"] as? String
        self.parkLandValues.text = adventure.options["park_land"] as? String
        self.densityValue.text = String(adventure.options["density"] as! Int)
        self.intensityValue.text = String(adventure.options["intensity"] as! Int)
        self.kidFriendlyValue.text = adventure.options["kid_friendly"] as! Int == 1 ? "True" : "False"
        self.heightRestrictedValue.text = adventure.options["height_restricted"] as! Int == 1 ? "True" : "False"
    
        self.advPagePicture.image = UIImage(named: "DisneyCastle")
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
