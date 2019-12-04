//
//  Activity.swift
//  Mouse-Tracker
//
//  Created by Keegan Papakipos on 11/30/19.
//  Copyright © 2019 Keegan Papakipos. All rights reserved.
//

import UIKit

class Activity: NSObject {
    var title: String
    var descrip: String
    var trivia: String
    var completed: Bool
    
    init(title: String, description: String, trivia: String, completed: Bool = false) {
        self.title = title
        self.descrip = description
        self.trivia = trivia
        self.completed = completed
        super.init()
    }
}
