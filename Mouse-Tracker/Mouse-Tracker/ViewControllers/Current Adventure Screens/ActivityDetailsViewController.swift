//
//  ActivityDetailsViewController.swift
//  Mouse-Tracker
//
//  Created by Jack Dangelmaier on 11/14/19.
//  Copyright © 2019 Keegan Papakipos. All rights reserved.
//

import UIKit

class ActivityDetailsViewController: UIViewController {

    @IBOutlet weak var ActivityName: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var locationValue: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var timeValue: UILabel!
    @IBOutlet weak var kidFriendlyLabel: UILabel!
    @IBOutlet weak var kidFriendlyValue: UILabel!
    @IBOutlet weak var typeLabel: UILabel!
    @IBOutlet weak var typeValue: UILabel!
    @IBOutlet weak var heightLabel: UILabel!
    @IBOutlet weak var heightValue: UILabel!
    
    var activity: Activity!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        //TODO: Input all data from the database
        ActivityName.text = "Activity One"
        ActivityName.font = UIFont.boldSystemFont(ofSize: 50.0)
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
