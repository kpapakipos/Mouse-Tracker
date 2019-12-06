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
    @IBOutlet weak var descriptionValue: UILabel!
    @IBOutlet weak var triviaValue: UILabel!
    @IBOutlet weak var completedValue: UILabel!
    
    var activity: Activity!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        //TODO: Input all data from the database
        ActivityName.text = activity.title
        ActivityName.font = UIFont.boldSystemFont(ofSize: 40.0)
        descriptionValue.text = activity.descrip
        triviaValue.text = activity.trivia
        completedValue.text = activity.completed ? "Yes" : "No"
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
