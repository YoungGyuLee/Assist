//
//  TeamMemberVC.swift
//  Assist
//
//  Created by 이영규 on 2017. 6. 28..
//  Copyright © 2017년 YG. All rights reserved.
//

import Foundation
import UIKit

class TeamMemeberVC : UIViewController, UITableViewDelegate, UITableViewDataSource, NetworkCallback{
    
   // @IBOutlet var entryMemTable: UITableView!
    
    //@IBOutlet var noEntryMemTable: UITableView!
    
    
    @IBOutlet var entryMemTable: UITableView!
    @IBOutlet var noEntryMemTable: UITableView!
    
    
    var entryList : [TeamEntryVO] = [TeamEntryVO]()
    var noEntryList : [TeamNoEntryVO] = [TeamNoEntryVO]()
    //var response = TeamEntryResponse?()
    
    //var response = TeamEntryResponse()
    
    @IBOutlet var listView: UIView!
    //var place_data = ["서울시", "성남시", "제네바", "오타와", "레이캬비크"]
    let ad = UIApplication.shared.delegate as? AppDelegate
    
    
    func networkResult(resultData: Any, code: String) {
        print("팀 통신")
        if code == "팀참가명단조회"{
            print("팀참가명단조회")
            entryList = resultData as! [TeamEntryVO]
     
            //boardListTable.reloadData()

            //entryList.append(TeamEntryVO()
            print(entryList[0].username)
            
            entryMemTable.isHidden = false
            entryMemTable.reloadData()
        }
        if code == "팀불참명단조회"{
            print("팀불참명단조회")
            noEntryList = resultData as! [TeamNoEntryVO]
            //boardListTable.reloadData()
            
            print(noEntryList[0].username)
            noEntryMemTable.isHidden = false
            noEntryMemTable.reloadData()
        }
    }
    
    
    override func viewWillAppear(_ animated: Bool) {

        //model.getScheduleAttendee(schedule_id: gino(ad?.scheduleId))
        //print(gino(ad?.scheduleId))
        print("서브3")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        print("서브1")
    }

    override func viewDidLoad() {
        let model = TeamModel(self)
        model.getScheduleAttendee(schedule_id: gino(4))
        print("서브2")
        
        entryMemTable.isHidden = true
        noEntryMemTable.isHidden = true
        entryMemTable.delegate = self
        noEntryMemTable.delegate = self
        entryMemTable.dataSource = self
        noEntryMemTable.dataSource = self

    }
    
    
    
    
    
    
    
    @IBAction func addEntry(_ sender: Any) {
//        let entry = "이영규"
//        let data1 = TeamEntryVO(entryName: entry)
     
        //entryList.append(data1)
        //searchList.append(data2)
        //searchList.append(data3)
        entryMemTable.isHidden = false
        entryMemTable.reloadData()
        //entryMemTable.registerClass(UITableViewCell.self, forCellReuseIdentifier: "TeamEntryCell")
        
        noEntryMemTable.isHidden = false
        noEntryMemTable.reloadData()
//        noEntryMemTable.registerClass(UITableViewCell.self, forCellReuseIdentifier: "TeamNoEntryCell")
        
    }
    
    
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
        let cell = entryMemTable.dequeueReusableCell(withIdentifier: "TeamEntryCell") as! TeamEntryCell
        //해당 셀 이름과 클래스 명시
            print("팀 참가 셀")
        let noEntryName = entryList[indexPath.row]
        cell.entryName.text = gsno(noEntryName.username)
        //cell.
            return cell
        }
        
        else{
            let cell = entryMemTable.dequeueReusableCell(withIdentifier: "TeamNoEntryCell") as! TeamNoEntryCell
            //해당 셀 이름과 클래스 명시
            print("팀 불참 셀")
            let noEntryName = noEntryList[indexPath.row]
            cell.noEntryName.text = gsno(noEntryName.username)
            return cell
            
        }
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

    }

    
    
    
}
