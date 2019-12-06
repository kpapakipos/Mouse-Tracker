//
//  NewAdventureViewController.swift
//  Mouse-Tracker
//
//  Created by Keegan Papakipos on 11/15/19.
//  Copyright © 2019 Keegan Papakipos. All rights reserved.
//

import UIKit

protocol canReceiveData {
    func pass(_ data: [String: Any])
}

class NewAdventureViewController: UIViewController, canReceiveData {
    @IBOutlet weak var densitySlider: UISlider!
    @IBOutlet weak var intensitySlider: UISlider!
    
    var appendAdventureDelegate: canAppendNewAdventure!
    
    var sliders: [String: Any] = [:]
    
    //TODO: calls model generate new adventure
    @IBAction func generateAdventureButtonPressed(_ sender: UIButton) {
        sliders["density"] = densitySlider.value * 100
        sliders["intensity"] = intensitySlider.value * 100
        
        //TODO: use self.sliders as parameter to function
        print("sliders:", self.sliders)
        
        
        //createNew(userID: useridnumber, options:)
        //this demo adventure should be replaced with a real model call
        let activities = [Activity(title: "Space Mountain", description: "Intense Dark inside Roller Coaster", trivia: "Consider one of the most fun rides at Disney"), Activity(title: "Pin Trading", description: "Trade a pin with one of the characters", trivia: "Special events have limited edition pins"), Activity(title: "Its a Small World", description: "Great ride for all ages", trivia: "2014 Cinderella was added to the ride")]
        
        let newAdv = Adventure(start: Date(), completed: nil, activities: activities, title: "Testerino Adventurino", options: ["density": 35, "intensity": 73, "kid_friendly": 1, "height_restricted": 0, "park": "Disneyland", "park_land": "Adventureland"])
        self.appendAdventureDelegate.append(newAdv)
        
        self.performSegue(withIdentifier: "adventureGenerated", sender: newAdv)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //set default values for some adventure options
        sliders["kid_friendly"] = 0
        sliders["height_restricted"] = 0
        sliders["park"] = "Any"
        sliders["park_land"] = "Any"
    }
    
    func pass(_ data: [String: Any]) {
        for (key, value) in data {
            self.sliders[key] = value
        }
    }
    
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "moreOptionsSegue" {
            (segue.destination as! MoreOptionsViewController).receiveDataDelegate = self
            (segue.destination as! MoreOptionsViewController).slidersForPersistence = self.sliders
        }
        else if segue.identifier == "adventureGenerated" {
            (segue.destination as! CurrentAdvViewController).adventure = sender as? Adventure
        }
    }
}
