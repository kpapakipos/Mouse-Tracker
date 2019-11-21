//
//  MoreOptionsViewController.swift
//  Mouse-Tracker
//
//  Created by Keegan Papakipos on 11/15/19.
//  Copyright © 2019 Keegan Papakipos. All rights reserved.
//

import UIKit

class MoreOptionsViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    @IBOutlet weak var kidFriendlySwitch: UISwitch!
    @IBOutlet weak var heightRestrictedSwitch: UISwitch!
    @IBOutlet weak var parkPicker: UIPickerView!
    @IBOutlet weak var parkLandPicker: UIPickerView!
    
    var receiveDataDelegate: canReceiveData!
    let parkOptions = ["Any", "Disneyland", "Disney California Adventure"]
    var parkLandOptions = ["Fantasyland", "Hollywood Land", "Tomorrowland", "Pacific Wharf", "Frontierland", "Mickey's Toon Town", "Critter Country", "Main Street, U.S.A.", "Paradise Gardens", "Grizzly Peak", "Hollywood Land", "New Orleans Square", "Pixar Pier", "Adventureland", "Cars Land", "Galaxy's Edge", "Buena Vista Street"].sorted()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //if you put Any in the initial declaration (before sorting), it isn't the first element
        parkLandOptions.insert("Any", at: 0)
        
        self.parkPicker.delegate = self
        self.parkPicker.dataSource = self
        self.parkLandPicker.delegate = self
        self.parkLandPicker.dataSource = self
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        if (self.isMovingFromParent) {
            //TODO: send the information recorded in this screen to the New adventure page so when a new adventure is created then we can send this information
            //Maybe have a button on this page that creates a new adventure
            let moreOptions: [String:AnyObject] =
                ["kid_friendly": (kidFriendlySwitch.isOn ? 1 : 0) as AnyObject,
                 "height_restricted": (heightRestrictedSwitch.isOn ? 1 : 0) as AnyObject,
                 "park": parkOptions[parkPicker.selectedRow(inComponent: 0)] as AnyObject,
                 "park_land": parkLandOptions[parkLandPicker.selectedRow(inComponent: 0)] as AnyObject]
            receiveDataDelegate.pass(moreOptions)
        }
    }

    // Number of columns of data
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    // The number of rows of data
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if pickerView == parkPicker {
            return parkOptions.count
        }
        else {
            return parkLandOptions.count
        }
    }
    
    // The data to return for the row and component (column) that's being passed in
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if pickerView == parkPicker {
            return parkOptions[row]
        }
        else {
            return parkLandOptions[row]
        }
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
