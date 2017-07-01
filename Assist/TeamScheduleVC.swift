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

class TeamScheduleVC : UIViewController, FSCalendarDelegate, FSCalendarDataSource, getCurrentDate{
    //인터페이스 상속.
    
    @IBOutlet weak var calendar: FSCalendar!
    
    @IBOutlet var listView: UIView!
    
    @IBOutlet var addView: UIView!
    
    var containerViewController : TeamScheduleAdd?
    //인터페이스를 싱속하는 클래스 관리 변수.
    
    
    var date = Date()

    
    let dateForamtterGet = DateFormatter()
    
    
    override func viewDidLoad() {
        //로드할 때 여태 찍힌 날짜들이랑 내용 다 불러올 것.
        
        calendar.locale = Locale(identifier: "ko_kr")
        dateForamtterGet.dateFormat = "yyyy-MM-dd hh:mm:ss"
        dateForamtterGet.locale = Locale(identifier: "ko_kr")
        let date1 : Date? = dateForamtterGet.date(from: "2017-06-12 00:00:00")
        let date2 : Date? = dateForamtterGet.date(from: "2017-06-17 00:00:00")
        
                calendar.allowsMultipleSelection = true
        calendar.select(date1)
        calendar.select(date2)

        listView.isHidden = true
        addView.isHidden = true
        
        
        self.calendar.delegate = self
        self.calendar.dataSource = self
    }
    
    func calendarCurrentMonthDidChange(_ calendar: FSCalendar!) {
        // Do something
        //달 변경 이벤트는 여기서
        
        print("날짜 달 달라짐")
    }
    
    
    
    
    func calendar(_ calendar: FSCalendar, didDeselect date: Date, at monthPosition: FSCalendarMonthPosition) {
        self.calendar.select(date)
        
//        guard let mem = storyboard?.instantiateViewController(withIdentifier: "TeamEntryMem") as? TeamEntryMem else {return}
//        
//        
//        navigationController?.pushViewController(mem, animated:true)
        
        //addView.
        //이미 등록된 일정 보기.

        
        listView.isHidden = false
        addView.isHidden = true
        
    }
    
    func calendar(_ calendar: FSCalendar, didSelect date: Date, at monthPosition: FSCalendarMonthPosition) {
        self.dateForamtterGet.dateFormat = "yyyy-MM-dd hh:mm:ss"
        let mydate = dateForamtterGet.string(from: date)
        let mydateReal = dateForamtterGet.date(from: mydate)
    
        listView.isHidden = true
        addView.isHidden = false
        self.date = mydateReal!
        containerViewController?.getDate(date: mydateReal!)
     
    }
    
    //prepareforse


    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "TeamScheduleAdd") {
            containerViewController = segue.destination as? TeamScheduleAdd
            //컨트롤러를 통해 목적지 세팅
            containerViewController!.containerToMaster = self
            //뷰 컨테이너에 연결된 뷰 컨테이너의 프로토콜에 연결된 함수들 가져 옴.as?
           // containerViewController!.getCurrentDate = self
            //print("함수 실행")
        }
    }
    
    func getDate(date : Date){
        self.date = date
    }

}
