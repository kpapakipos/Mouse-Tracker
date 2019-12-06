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
    
    //TODO: maybe group parks and parkland into a groups that make sense like california parks
    var receiveDataDelegate: canReceiveData!
    let parkOptions = ["Any", "Disneyland", "Disney California Adventure"]
    var parkLandOptions = ["Fantasyland", "Hollywood Land", "Tomorrowland", "Pacific Wharf", "Frontierland", "Mickey's Toon Town", "Critter Country", "Main Street, U.S.A.", "Paradise Gardens", "Grizzly Peak", "New Orleans Square", "Pixar Pier", "Adventureland", "Cars Land", "Galaxy's Edge", "Buena Vista Street"].sorted()
    var slidersForPersistence: [String: Any]!
    
    //TODO: repopulate this screen with previous options
    override func viewDidLoad() {
        super.viewDidLoad()
        //if you put Any in the initial declaration (top of this class), it isn't the first element. I insert Any here to ensure it's the first element in the list
        parkLandOptions.insert("Any", at: 0)
        
        self.parkPicker.delegate = self
        self.parkPicker.dataSource = self
        self.parkLandPicker.delegate = self
        self.parkLandPicker.dataSource = self
        self.kidFriendlySwitch.setOn(self.slidersForPersistence?["kid_friendly"] as? Int == 1 ? true : false, animated: false)
        self.heightRestrictedSwitch.setOn(self.slidersForPersistence?["height_restricted"] as? Int == 1 ? true : false, animated: false)
        let indexForPark = parkOptions.firstIndex(of: self.slidersForPersistence?["park"] as! String)!
        self.parkPicker.selectRow(indexForPark, inComponent: 0, animated: false)
        let indexForParkLand = parkLandOptions.firstIndex(of: self.slidersForPersistence?["park_land"] as! String)!
        self.parkLandPicker.selectRow(indexForParkLand, inComponent: 0, animated: false)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        //send choices the user made on this screen back to the previous screen, so that screen can then send them to the model when the "create adventure" button is pressed
        if (self.isMovingFromParent) {
            let moreOptions: [String:Any] =
                ["kid_friendly": kidFriendlySwitch.isOn ? 1 : 0,
                 "height_restricted": heightRestrictedSwitch.isOn ? 1 : 0,
                 "park": parkOptions[parkPicker.selectedRow(inComponent: 0)],
                 "park_land": parkLandOptions[parkLandPicker.selectedRow(inComponent: 0)]]
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
