//
//  CurrentAdvViewController.swift
//  Mouse-Tracker
//
//  Created by Jack Dangelmaier on 11/14/19.
//  Copyright © 2019 Keegan Papakipos. All rights reserved.
//

import UIKit

class CurrentAdvViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{
    
    @IBOutlet weak var CurrentAdvTableView: UITableView!
    
    @IBOutlet weak var percentComplete: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        CurrentAdvTableView.delegate = self
        CurrentAdvTableView.dataSource = self
        // Do any additional setup after loading the view.
    }
    
    let tempActivityArray = ["Find Hidden Mickey", "Roller Coaster 1", "Fun thing 3"]
    
    //displays number of rows
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // TODO: calls model to return number of activities there are
        return tempActivityArray.count
    }
    
    //displays content on the list
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "CurrentAdvCell", for: indexPath) as! ActivityTableViewCell
        
        //TODO: should put the names of the activities from the database in here
        cell.ActivityNameLabel?.text = tempActivityArray[indexPath.row] //puts data from array into cell
        
        //TODO: adds image should be based on if the activity is checked off
        cell.MickeyCheckBox?.image = UIImage(named: "MickeyFace")
        
        return cell
    }
    
    
    //this runs if table is clicked
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        //TODO: update mickey photo image here
        //this does not work properly
        let cell = tableView.dequeueReusableCell(withIdentifier: "CurrentAdvCell", for: indexPath) as! ActivityTableViewCell
        
        cell.MickeyCheckBox?.image = UIImage(named: "Mickey")
        
        //This is an animation option that makes the click look nicer. Flashes instead of stays grey
        tableView.deselectRow(at: indexPath, animated: true)
        
        //TODO: Update database
        //TODO: Update %
        
    }
    
    //Will go to the Activity details page if the details button is clicked
    func tableView(_ tableView: UITableView, accessoryButtonTappedForRowWith indexPath: IndexPath) {
         self.performSegue(withIdentifier: "goToActivityDetails", sender: self)
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
