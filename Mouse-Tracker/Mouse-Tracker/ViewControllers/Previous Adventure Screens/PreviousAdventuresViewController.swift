//
//  PreviousAdventuresViewController.swift
//  Mouse-Tracker
//
//  Created by Jack Dangelmaier on 11/14/19.
//  Copyright © 2019 Keegan Papakipos. All rights reserved.
//

import UIKit

protocol canAppendNewAdventure {
    func append(_ data: Adventure)
}

class PreviousAdventuresViewController : UIViewController, UITableViewDataSource, UITableViewDelegate, canAppendNewAdventure {
  
    @IBOutlet weak var PreviousAdvTable: UITableView!
    
    var adventures = [Adventure(start: Date(), activities: [Activity(title: "Find a Hidden Mickey", description: "It's very near the entrance.", trivia: "This Mickey is the oldest one at any Disney park."), Activity(title: "Haunted Mansion", description: "Experence the thrills of this Haunted Mansion", trivia: "This ride has been updated numerous times")], title: "Demo Adventure", options: ["density": 35, "intensity": 73, "kid_friendly": 1, "height_restricted": 0, "park": "Disneyland", "park_land": "Adventureland"])]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        PreviousAdvTable.dataSource = self
        PreviousAdvTable.delegate = self
        // Do any additional setup after loading the view.
    }
    
    //this automatically reloads the page anytime it is viewed which is needed after a new adventure is created and the user goes back to this page
    override func viewWillAppear(_ animated: Bool) {
        self.PreviousAdvTable.reloadData()
    }
    
    //TODO: grab number of previous adventure and return here
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
          return adventures.count
      }
      
    //TODO: grab information for these adventures and place information here
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PreviousAdvCell", for: indexPath) as! AdventureTableViewCell
        
        let adv = adventures[indexPath.row]
        cell.AdventureName.text = adv.title
        //tempActivityArray[indexPath.row]
        //TODO: make these values real
        /*cell.ProgressStatus.text = tempActivityArray[indexPath.row].progressPercent */
        
        var progress = 0
        var count = 0.0
        for activity in adv.activities {
            if activity.completed{
                count += 1
            }
        }
        progress = Int(double_t(adv.activities.count != 0 ? (count / double_t(adv.activities.count) * 100) : 100))
        cell.ProgressStatus.text = String(progress) + "%"
        
        
        return cell
      }
    
    
    //TODO: Update to navigation controller
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        self.performSegue(withIdentifier: "goToAdventure", sender: adventures[indexPath.row])
    }
      
    
    func tableView(_ tableView: UITableView, accessoryButtonTappedForRowWith indexPath: IndexPath) {
        self.performSegue(withIdentifier: "goToAdvDetails", sender: adventures[indexPath.row])
    }
    
    func append(_ data: Adventure) {
        self.adventures.append(data)
        self.PreviousAdvTable.reloadData()
    }
    
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToAdvDetails" {
            (segue.destination as! AdventureDetailsViewController).adventure = sender as? Adventure
        }
        else if segue.identifier == "goToAdventure" {
            (segue.destination as! CurrentAdvViewController).adventure = sender as? Adventure
        }
        else if segue.identifier == "goToNewAdventure" {
            (segue.destination as! NewAdventureViewController).appendAdventureDelegate = self
        }
    }

}
