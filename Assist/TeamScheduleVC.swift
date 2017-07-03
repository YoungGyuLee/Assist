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
    
    
    //통신 후에는 일정이 있는 날은 상관 없다만 일정이 없는 날을 두 번 눌렀을 때 그냥 사라지게끔 해야 함.
    
    @IBOutlet weak var calendar: FSCalendar!
    
    @IBOutlet var listView: UIView!
    
    @IBOutlet var addView: UIView!
    
    @IBOutlet var scroll: UIScrollView!
    var isDate : Bool = false//비어있는걸 통해 왔는지 아닌 지를 판다.
    
    var containerViewController : TeamScheduleAdd?
    //인터페이스를 싱속하는 클래스 관리 변수.
    
    
    var date = Date()
    
    var dates = [Date]()
    var nonSelectedDates = [Date]()

    
    let dateForamtterGet = DateFormatter()
    
    
    //일정이 있는 날은 내용 보이게 하고 일정이 없는 날은 찍었다가 다시 찍으면 원상복귀
    
    
    
    override func viewDidLoad() {
        //로드할 때 여태 찍힌 날짜들이랑 내용 다 불러올 것.
        
        print("스케줄로드")
        
        calendar.locale = Locale(identifier: "ko_kr")
        dateForamtterGet.dateFormat = "yyyy-MM-dd hh:mm:ss"
        dateForamtterGet.locale = Locale(identifier: "ko_kr")
        let date1 : Date? = dateForamtterGet.date(from: "2017-06-12 00:00:00")
        let date2 : Date? = dateForamtterGet.date(from: "2017-06-17 00:00:00")
        
        calendar.allowsMultipleSelection = true
        calendar.select(date1)
        calendar.select(date2)
        
        dates.append(date1!)
        dates.append(date2!)
        
        scroll.isScrollEnabled = false
        
        listView.isHidden = true
        addView.isHidden = true
        
        
        self.calendar.delegate = self
        self.calendar.dataSource = self
        
        
        //나중에 append용 함수를 따로 만들어야 함.
    }
    
    func calendarCurrentMonthDidChange(_ calendar: FSCalendar) {
        // Do something
        //달 변경 이벤트는 여기서
        
        print("날짜 달 달라짐")
    }
    
    
    
    
    func calendar(_ calendar: FSCalendar, didDeselect date: Date, at monthPosition: FSCalendarMonthPosition) {//이게 찍혀있는거 또 찍는거.
        scroll.isScrollEnabled = true
        
        if dates.contains(date){
            listView.isHidden = false
            addView.isHidden = true
            self.calendar.select(date)
        }
        
        
        if nonSelectedDates.contains(date) {
            listView.isHidden = true
            addView.isHidden = true
        }
        
 

        
    }
    
    func calendar(_ calendar: FSCalendar, didSelect date: Date, at monthPosition: FSCalendarMonthPosition) {//이게 비어있는 날짜 찍는거.

        scroll.isScrollEnabled = false
        
        self.dateForamtterGet.dateFormat = "yyyy-MM-dd hh:mm:ss"
        let mydate = dateForamtterGet.string(from: date)
        let mydateReal = dateForamtterGet.date(from: mydate)
    
        listView.isHidden = true
        addView.isHidden = false
        self.date = mydateReal!
        containerViewController?.getDate(date: mydateReal!)
        
        nonSelectedDates.append(date)
        
        //일단은 선택하지 말고 서버하고 통신할 때 선택 눌러지는 것으로
     
    }

    override func viewDidDisappear(_ animated: Bool) {
        self.listView.isHidden = true
        self.addView.isHidden = true
        self.calendar.deselect(self.date)
    }
    
    
    
    
    //prepareforse


    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "TeamScheduleAdd") {
            print("프리페어")
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
