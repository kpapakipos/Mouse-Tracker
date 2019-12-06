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
    
    var adventure: Adventure!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        CurrentAdvTableView.delegate = self
        CurrentAdvTableView.dataSource = self
        // Do any additional setup after loading the view.
    }
    
    //displays number of rows
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // TODO: calls model to return number of activities there are
        return self.adventure.activities.count
    }
    
    //displays content on the table
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "CurrentAdvCell", for: indexPath) as! ActivityTableViewCell
        
        //TODO: should put the names of the activities from the database in here
        cell.ActivityNameLabel?.text = self.adventure.activities[indexPath.row].title //puts data from array into cell
        
        //TODO: adds image should be based on if the activity is checked off
        cell.MickeyCheckBox?.image = self.adventure.activities[indexPath.row].completed ? UIImage(named: "MickeyFilled") : UIImage(named: "MickeyCheck")
        
        return cell
    }
    
    //this runs if table is clicked
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        //TODO: add offical picture
        //TODO: Update database
        //TODO: Update %
        let cell = tableView.cellForRow(at: indexPath) as! ActivityTableViewCell
        cell.MickeyCheckBox.image = cell.MickeyCheckBox.image == UIImage(named: "MickeyCheck") ? UIImage(named: "MickeyFilled") : UIImage(named: "MickeyCheck")
        self.adventure.activities[indexPath.row].completed = !self.adventure.activities[indexPath.row].completed
        
        //This is an animation option that makes the click look nicer. Flashes instead of stays grey
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    //Will go to the Activity details page if the details button is clicked
    func tableView(_ tableView: UITableView, accessoryButtonTappedForRowWith indexPath: IndexPath) {
        self.performSegue(withIdentifier: "goToActivityDetails", sender: adventure.activities[indexPath.row])
    }
    
    
    //this runs when back button is pressed
    //TODO: make sure that the previous adventure page is reloaded
    override func viewWillDisappear(_ animated: Bool) {
        super .viewWillDisappear(true)
        if (self.isMovingFromParent){
            navigationController?.popToRootViewController(animated: true)
        }
    }

    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToActivityDetails" {
            (segue.destination as! ActivityDetailsViewController).activity = sender as? Activity
        }
    }

}
