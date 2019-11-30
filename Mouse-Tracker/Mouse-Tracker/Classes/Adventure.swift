//
//  Adventure.swift
//  Mouse-Tracker
//
//  Created by Keegan Papakipos on 11/30/19.
//  Copyright © 2019 Keegan Papakipos. All rights reserved.
//

import UIKit

class Adventure: NSObject {
    var startDate: Date
    var completedDate: Date?
    var activities: [Activity]
    var title: String
    var options: [String:Any]
    
    init(start: Date, completed: Date? = nil, activities: [Activity], title: String, options: [String:Any]) {
        self.startDate = start
        self.completedDate = completed
        self.activities = activities
        self.title = title
        self.options = options
        super.init()
    }
}
