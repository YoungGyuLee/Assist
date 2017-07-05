//
//  TeamEntryMem.swift
//  Assist
//
//  Created by 이영규 on 2017. 6. 29..
//  Copyright © 2017년 YG. All rights reserved.
//

import Foundation

import UIKit

class TeamEntryMem : UIViewController, NetworkCallback, UITableViewDelegate, UITableViewDataSource{
    
    @IBOutlet var entryTable: UITableView!
     var memList : [TeamMemberResponse] = [TeamMemberResponse]()
    let ad = UIApplication.shared.delegate as? AppDelegate
    
    
    func networkResult(resultData: Any, code: String) {
        if code == "팀멤버조회"{
            memList = resultData as! [TeamMemberResponse]
            
            //boardListTable.reloadData()
            entryTable.reloadData()
        }
        
    }
    
    
    
    
    
    override func viewDidLoad() {
        let model = TeamModel(self)
        model.getTeamMember(team_id: gino(ad?.myTeamId))
        
        
        
        
        entryTable.delegate = self
        entryTable.dataSource = self
        
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return memList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = entryTable.dequeueReusableCell(withIdentifier: "TeamEntryMemCell") as! TeamEntryMemCell
        
        //해당 셀 이름과 클래스 명시
        let memVO = memList[indexPath.row]
        
//        @IBOutlet var backNum: UILabel!
//        
//        @IBOutlet var name: UILabel!
//        @IBOutlet var age: UILabel!
//        
//        @IBOutlet var position: UILabel!
//        @IBOutlet var gameDay: UILabel!
//        @IBOutlet var goal: UILabel!
//        @IBOutlet var assist: UILabel!
        
        cell.age.text = memVO.age?.description
        cell.name.text = memVO.username
        cell.backNum.text = memVO.backnumber?.description
        cell.position.text = memVO.position
        cell.gameDay.text = memVO.total_game?.description
        cell.goal.text = memVO.score?.description
        cell.assist.text = memVO.assist?.description
        
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //테이블 셀 선택 이벤트.
        
        
    }
    
    
    
}
