//
//  TeamScheduleVC.swift
//  Assist
//
//  Created by 이영규 on 2017. 6. 28..
//  Copyright © 2017년 YG. All rights reserved.
//

import Foundation
import UIKit
import FSCalendar

class TeamScheduleVC : UIViewController{
    
    @IBOutlet weak var calendar: FSCalendar!
    
    var date = Date()
    
    let dateForamtterGet = DateFormatter()
    
    override func viewDidLoad() {
        
        
        
    }
    
    func calendar(_ calendar: FSCalendar, subtitleFor date: Date) -> String? {
        return ""
        //해당 날짜에 쓸 말.
    }
    
    func calendar(_ calendar: FSCalendar, didSelect date: Date, at monthPosition: FSCalendarMonthPosition) {
        print(date)
        print(monthPosition)
        //해당 날 찍었을 때 나오는 이벤트
        
    }
    
    
    
}
