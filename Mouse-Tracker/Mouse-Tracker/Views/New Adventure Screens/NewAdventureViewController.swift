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
    
    var sliders: [String: Any] = [:]
    
    //TODO: calls model generate new adventure
    @IBAction func generateAdventureButtonPressed(_ sender: UIButton) {
        sliders["density"] = densitySlider.value * 100
        sliders["intensity"] = intensitySlider.value * 100
        
        
        //TODO: use self.sliders as parameter to function
        print("sliders:", self.sliders)
        
        
        //createNew(userID: useridnumber, options:)
        self.performSegue(withIdentifier: "adventureGenerated", sender: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
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
        }
    }
}
