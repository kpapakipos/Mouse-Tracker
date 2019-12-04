//
//  PreviousAdventuresViewController.swift
//  Mouse-Tracker
//
//  Created by Jack Dangelmaier on 11/14/19.
//  Copyright © 2019 Keegan Papakipos. All rights reserved.
//

import UIKit

class PreviousAdventuresViewController : UIViewController, UITableViewDataSource, UITableViewDelegate{
  
    @IBOutlet weak var PreviousAdvTable: UITableView!
    
    let adventures = [Adventure(start: Date(), activities: [Activity(title: "Hidden Mickey 1", description: "Find the first hidden Mickey in Disneyland! It's very near the entrance.", trivia: "This Mickey is the oldest one at any Disney park.")], title: "Demo Adventure", options: ["density": 35, "intensity": 73, "kid_friendly": 1, "height_restricted": 0, "park": "Disneyland", "park_land": "Adventureland"])]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        PreviousAdvTable.dataSource = self
        PreviousAdvTable.delegate = self
        // Do any additional setup after loading the view.
    }
    
    //this automatically reloads the page anytime it is viewed which is needed after a new adventure is created and the user goes back to this page
    override func viewWillAppear(_ animated: Bool) {
        self.viewDidLoad()
    }
    
    //TODO: grab number of previous adventure and return here
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
          return adventures.count
      }
      
    //TODO: grab information for these adventures and place information here
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PreviousAdvCell", for: indexPath) as! AdventureTableViewCell
        
        cell.AdventureName.text = "Adventure \(indexPath.row + 1)"
            //tempActivityArray[indexPath.row]
        //TODO: make these values real
        /*cell.ProgressStatus.text = tempActivityArray[indexPath.row].progressPercent
        cell.Details.text = tempActivityArray[indexPath.row].details*/
        
        
        
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
    
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToAdvDetails" {
            (segue.destination as! AdventureDetailsViewController).adventure = sender as? Adventure
        }
        else if segue.identifier == "goToAdventure" {
            (segue.destination as! CurrentAdvViewController).adventure = sender as? Adventure
        }
    }

}
