//
//  NewAdventureViewController.swift
//  Mouse-Tracker
//
//  Created by Keegan Papakipos on 11/15/19.
//  Copyright © 2019 Keegan Papakipos. All rights reserved.
//

import UIKit

protocol canReceiveData {
    func pass(_ data: [String: AnyObject])
}

class NewAdventureViewController: UIViewController, canReceiveData {
    @IBOutlet weak var densitySlider: UISlider!
    @IBOutlet weak var intensitySlider: UISlider!
    
    var sliders: [String: AnyObject] = [:]
    
    //TODO: calls model generate new adventure
    @IBAction func generateAdventureButtonPressed(_ sender: UIButton) {
        //TODO: use self.sliders as parameter to function
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        sliders["density"] = Int(densitySlider.value * 100) as AnyObject
        sliders["intensity"] = Int(intensitySlider.value * 100) as AnyObject
    }
    
    func pass(_ data: [String: AnyObject]) {
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
