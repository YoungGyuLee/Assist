//
//  TeamScheduleInsert.swift
//  Assist
//
//  Created by 이영규 on 2017. 6. 30..
//  Copyright © 2017년 YG. All rights reserved.
//

import UIKit

class TeamScheduleInsert : UIViewController{
    
    
    @IBOutlet var gameDate: UILabel!
    var gameDateString : String?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        gameDate.text = gameDateString
        
    }
    
    
}
