//
//  MoreOptionsViewController.swift
//  Mouse-Tracker
//
//  Created by Keegan Papakipos on 11/15/19.
//  Copyright © 2019 Keegan Papakipos. All rights reserved.
//

import UIKit

class MoreOptionsViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillDisappear(_ animated: Bool) {
           super .viewWillDisappear(true)
           if (self.isMovingFromParent){
               //TODO: send the information recorded in this screen to the New adventure page so when a new adventure is created then we can send this information
                //Maybe have a button on this page that creats a new adventure
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
