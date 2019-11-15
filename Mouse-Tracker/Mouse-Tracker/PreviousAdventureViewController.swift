//
//  PreviousAdventureViewController.swift
//  Mouse-Tracker
//
//  Created by Jack Dangelmaier on 11/14/19.
//  Copyright © 2019 Keegan Papakipos. All rights reserved.
//

import UIKit

class PreviousAdventureViewController : UIViewController, UITableViewDataSource, UITableViewDelegate{
  

    @IBOutlet weak var PreviousAdvTable: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        PreviousAdvTable.dataSource = self
        PreviousAdvTable.delegate = self
        // Do any additional setup after loading the view.
    }
    
    let tempActivityArray = ["Find Hidden Mickey", "Roller Coaster 1", "Fun thing 3"]
    
    //TODO: grab number of previous adventure and return here
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
          return tempActivityArray.count
      }
      
    //TODO: grab information for these adventures and place information here
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PreviousAdvCell", for: indexPath) as! AdventureTableViewCell
        
        cell.AdventureName.text = "Adventure \(indexPath.row + 1)"
            //tempActivityArray[indexPath.row]
        cell.ProgressStatus.text = tempActivityArray[indexPath.row]
        cell.Details.text = tempActivityArray[indexPath.row]
        
        
        
        return cell
      }
    
    
    //TODO: Update to navigation controller
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        self.performSegue(withIdentifier: "goToAdventure", sender: self)
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
