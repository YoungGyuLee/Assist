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


class TeamScheduleVC : UIViewController, FSCalendarDelegate, FSCalendarDataSource, getCurrentDate, UITableViewDelegate, UITableViewDataSource, NetworkCallback{
    //인터페이스 상속.
   
    @IBOutlet weak var entryMemTable: UITableView!
    @IBOutlet weak var noEntryMemTable: UITableView!
  
    var entryList : [TeamEntryVO] = [TeamEntryVO]()
    var noEntryList : [TeamNoEntryVO] = [TeamNoEntryVO]()
    
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

    var scheduleList : [TeamMonthResponse] = [TeamMonthResponse]()
    
    
    let dateForamtterGet = DateFormatter()
    let dateForamtterGet1 = DateFormatter()
    
    let ad = UIApplication.shared.delegate as? AppDelegate
    //일정이 있는 날은 내용 보이게 하고 일정이 없는 날은 찍었다가 다시 찍으면 원상복귀
    
    
    var numberForName : Dictionary<Date,Int> = Dictionary<Date,Int>()
    
    @IBOutlet var matchDay: UILabel!
    
    @IBOutlet var matchPlace: UILabel!
    
    @IBOutlet var againstTeam: UILabel!
    
    @IBOutlet var message: UILabel!
    
    @IBOutlet var tempView: UIView!
    
    var teamID : Int?
    func networkResult(resultData: Any, code: String) {
        print("통신~")
        if code == "팀일정조회"{
            scheduleList = resultData as! [TeamMonthResponse]
            print(scheduleList)
            calendar.locale = Locale(identifier: "ko_kr")
            dateForamtterGet.dateFormat = "yyyy-MM-dd"
            //dateForamtterGet1.dateFormat = "yyyy-MM-dd1T00:00:00.00Z"
            dateForamtterGet.locale = Locale(identifier: "ko_kr")
            dateForamtterGet1.locale = Locale(identifier: "ko_kr")
            
            initCalendar()
            

            
            
            //boardListTable.reloadData()
        }
        if code == "팀참가명단조회"{
            print("팀참가명단조회")
            entryList = resultData as! [TeamEntryVO]

            entryMemTable.isHidden = false
            entryMemTable.reloadData()
        }
        if code == "팀불참명단조회"{
            print("팀불참명단조회")
            noEntryList = resultData as! [TeamNoEntryVO]
            //boardListTable.reloadData()
            

            noEntryMemTable.isHidden = false
            noEntryMemTable.reloadData()
        }
        if code == "참가등록"{
            
            
        }
        
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
//         print("스케줄로드1")
//        let model = TeamModel(self)
//        model.getTeamSchedule(team_id: 9, year: 2017, month: 6)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
        
    }
    
    override func viewDidLoad() {
        //로드할 때 여태 찍힌 날짜들이랑 내용 다 불러올 것.
        
        print("스케줄로드")
        tempView.isHidden = true
        
        //값 넣어야 함.
        let model = TeamModel(self)
        print(ad?.myTeamId!)
        teamID = ad?.myTeamId
        model.getTeamSchedule(team_id:(ad?.myTeamId!)!, year: 2017, month: 7)
        
        scroll.isScrollEnabled = false
        
        //listView.isHidden = true
        addView.isHidden = true
        //listView.
        
        self.calendar.delegate = self
        self.calendar.dataSource = self
        
        entryMemTable.dataSource = self
        entryMemTable.delegate = self
  
        noEntryMemTable.dataSource = self
        noEntryMemTable.delegate = self

        
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
            //numberForName[date]
            //var index = scheduleList.con
        
            let matchText = scheduleList[numberForName[date]!].game_dt
            
            matchDay.text = converDateToString(date: matchText!)
                //scheduleList[numberForName[date]!].game_dt
                
            matchPlace.text = scheduleList[numberForName[date]!].place
            
            againstTeam.text = scheduleList[numberForName[date]!].against_team
            
            message.text = scheduleList[numberForName[date]!].message
            ad?.scheduleId = scheduleList[numberForName[date]!].id
            //ad?.team_id =
            //ad?.myTeamId
            let model = TeamModel(self)
            model.getScheduleAttendee(schedule_id: gino(scheduleList[numberForName[date]!].id))
            
            entryMemTable.reloadData()
            noEntryMemTable.reloadData()
            //let model = TeamModel(self.listView.self)
            //model.getTeamSchedule(team_id: 8, year: 2017, month: 7)
            //print(scheduleList[numberForName[date]!].id)

            //listView.reloadInputViews()
            
        }
        

        
        
        if nonSelectedDates.contains(date) {
            listView.isHidden = true
            addView.isHidden = true
        }
        
 

        
    }
    
    
    func converDateToString(date : String)->String{
        
        let index = date.index(date.startIndex, offsetBy: 10)
        var fullDate: String = date.substring(to: index)
        
        //fullDate.components(separatedBy: <#T##CharacterSet#>)
        let fullDateArr = fullDate.components(separatedBy: "-")
        
        let year = fullDateArr[0]
        let month = fullDateArr[1]
        let day = fullDateArr[2]
        
        let dateText = "\(year)년 \(month)월 \(day)월 "
        
        
        //00:00:00.000Z"
        
        let index2 = date.index(date.startIndex, offsetBy: 11)
        var fullTimeTemp: String = date.substring(from: index2)
        
        var fullTime : String = fullTimeTemp.replacingOccurrences(of: "T", with: "")
        var fullTime2 : String = fullTime.replacingOccurrences(of: ".000Z", with: "")
        
        let fullTimeArr = fullTime2.components(separatedBy: ":")
        let hour = fullTimeArr[0]
        let min = fullTimeArr[1]
        
        let timeText = "\(hour)시 \(min)분"
        
        return "\(dateText)\(timeText)"
        
        
    }
    
    func calendar(_ calendar: FSCalendar, didSelect date: Date, at monthPosition: FSCalendarMonthPosition) {//이게 비어있는 날짜 찍는거.

        scroll.isScrollEnabled = false
        
        self.dateForamtterGet.dateFormat = "yyyy-MM-dd hh:mm:ss"
        let mydate = dateForamtterGet.string(from: date)
        let mydateReal = dateForamtterGet.date(from: mydate)
    
       // listView.isHidden = true
        addView.isHidden = false
        self.date = mydateReal!
        containerViewController?.getDate(date: mydateReal!)
        
        nonSelectedDates.append(date)
        ad?.date = self.date
        //일단은 선택하지 말고 서버하고 통신할 때 선택 눌러지는 것으로
        matchDay.text = "등록된 일정이 없습니다."
        
        matchPlace.text = "등록된 일정이 없습니다."
        
        againstTeam.text = "등록된 일정이 없습니다."
        
        message.text = "등록된 일정이 없습니다."
        
     
    }

    override func viewDidDisappear(_ animated: Bool) {
       // self.listView.isHidden = true
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

    func initCalendar(){
        print("캘린더 인잇")
        calendar.allowsMultipleSelection = true
        //scheduleList.count
        print(scheduleList.count)
        for i in 0...(scheduleList.count-1){
            print("캘린더 인잇1")
            let index = scheduleList[i].game_dt?.index((scheduleList[i].game_dt?.startIndex)!, offsetBy: 10)
            print("캘린더 인잇2")
            var temp = scheduleList[i].game_dt?.substring(to: index!)
            let date : Date? = dateForamtterGet.date(from: temp!)
            numberForName[date!] = i
            
            dates.append(date!)
            calendar.select(date)
            
        }
       // calendar.allowsMultipleSelection = true

    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    //아래는 테이블 뷰
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if tableView  == self.entryMemTable{
            return entryList.count
        }
        else{
            return noEntryList.count
        }
    }
    //func tanu
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        //var cell:UITableViewCell?
        if tableView  == self.entryMemTable {
            var cell : EntryCell = tableView.dequeueReusableCell(withIdentifier: "EntryCell") as! EntryCell            //해당 셀 이름과 클래스 명시
            print("팀 참가 셀")
            
            let entryName = entryList[indexPath.row]
            cell.entryName.text = gsno(entryName.username)

            return cell
        }
            
        else{
            var cell : NoEntryCell = noEntryMemTable.dequeueReusableCell(withIdentifier: "NoEntryCell") as! NoEntryCell            //해당 셀 이름과 클래스 명시
            print("팀 불참 셀")
            let noEntryName = noEntryList[indexPath.row]
            cell.noEntryName.text = gsno(noEntryName.username)
            return cell
            
        }
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    
    @IBAction func InEntry(_ sender: Any) {
        let model = TeamModel(self)
        model.addEntry(schedule_id : gino(ad?.scheduleId), player_id : gino(ad?.userId), attendance : "attend")
        entryMemTable.reloadData()
        //entryList.relo
        
    }
    
    
    
}
