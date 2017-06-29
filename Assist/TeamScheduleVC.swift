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

class TeamScheduleVC : UIViewController, FSCalendarDelegate, FSCalendarDataSource{
    
    @IBOutlet weak var calendar: FSCalendar!
    var dates = [Date]()
    
    
    var date = Date()

    
    let dateForamtterGet = DateFormatter()
    
    override func viewWillAppear(_ animated: Bool) {
        
        
    }
    
    override func viewDidLoad() {
        calendar.locale = Locale(identifier: "ko_kr")
        //dateForamtterGet.locale = Locale(identifier: "ko")
        dateForamtterGet.dateFormat = "yyyy-MM-dd hh:mm:ss"
        let date1 : Date? = dateForamtterGet.date(from: "2017-06-12 00:00:00")
        let date2 : Date? = dateForamtterGet.date(from: "2017-06-17 00:00:00")
        calendar.allowsMultipleSelection = true
        calendar.select(date1)
        calendar.select(date2)
        print(date1!)
        print(date2!)
        dates.append(date1!)
        dates.append(date2!)
        print(dates)
        
        
        
        self.calendar.delegate = self
        self.calendar.dataSource = self
        print("날짜1")
    }
    
    func calendarCurrentMonthDidChange(_ calendar: FSCalendar!) {
        // Do something
        print("날짜 달 달라짐")
    }
    
    func calendar(_ calendar: FSCalendar, didDeselect date: Date, at monthPosition: FSCalendarMonthPosition) {
        self.calendar.select(date)
        guard let mem = storyboard?.instantiateViewController(withIdentifier: "TeamEntryMem") as? TeamEntryMem else {return}
        
        
        navigationController?.pushViewController(mem, animated:true)
        
        
        
    }
    
    
    
    func calendar(_ calendar: FSCalendar, didSelect date: Date, at monthPosition: FSCalendarMonthPosition) {
        print("날짜2")


        //해당 날 찍었을 때 나오는 이벤트
    }
    
    
    
    
    
    
}
