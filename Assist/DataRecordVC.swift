//
//  DataRecordVC.swift
//  Assist
//
//  Created by 이영규 on 2017. 6. 29..
//  Copyright © 2017년 YG. All rights reserved.
//

import Foundation

import UIKit

class DataRecordVC : UIViewController, UITableViewDelegate, UITableViewDataSource, NetworkCallback{
    
    
    @IBOutlet var recordTable: UITableView!
    var recordList : [DataScheduleResponse] = [DataScheduleResponse]()
    
    
    let ad = UIApplication.shared.delegate as? AppDelegate
    
    
    func networkResult(resultData: Any, code: String) {
        if code == "기록조회"{
            print("기록 조회 들어옴")
            recordList = resultData as! [DataScheduleResponse]
            print(recordList.count)
            recordTable.reloadData()
        }
        
    }
    
    @IBAction func temp(_ sender: Any) {
//        guard let entry = storyboard?.instantiateViewController(withIdentifier: "DataDetailEntry") as? DataDetailEntry else {return}
//        
//        navigationController?.present(entry, animated:false, completion:{})
        //navigationController?.pushViewController(entry, animated: true)
    }
    
    override func viewDidLoad() {
        let model = DataModel(self)
        print(ad?.myTeamId)
        model.getTeamDateRecord(team_id: gino(ad?.myTeamId))
        recordTable.delegate = self
        recordTable.dataSource = self
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return recordList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = recordTable.dequeueReusableCell(withIdentifier: "DataTeamRecordCell") as! DataTeamRecordCell
        
        
//        @IBOutlet var matchDay: UILabel!
//        
//        @IBOutlet var myTeamProfile: UIImageView!
//        @IBOutlet var myTeamName: UILabel!
//        @IBOutlet var myTeamScore: UILabel!
//        
//        @IBOutlet var enemyProfile: UIImageView!
//        @IBOutlet var enemyScore: UILabel!
//        @IBOutlet var enemyName: UILabel!
//        
        
//        var id : Int?
//        var game_dt : String?
//        var place : String?
//        var against_team : String?
//        var message : String?
//        var score_team : Int?
//        var score_against_team : Int?
//        var tactic : String?
        
        
        //해당 셀 이름과 클래스 명시
        let recordVO = recordList[indexPath.row]
        
        //cell.myTeam.text = rankVO.teamname
        cell.matchDay.text = recordVO.game_dt
        cell.myTeamScore.text = recordVO.score_team?.description
        cell.enemyScore.text = recordVO.score_against_team?.description
        
//        cell.draw.text = rankVO.draw_game?.description
//        let winGame : Int = rankVO.win_game!
//        cell.win.text = winGame.description
//        cell.lose.text = rankVO.lose_game?.description
//        let totalGame : Int = rankVO.total_game!
//        cell.totalGame.text = totalGame.description
//        cell.rate.text = ((Float(winGame)/Float(totalGame)*100)).description
//        cell.rank.text = rankVO.rank?.description
//        
        
        
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //테이블 셀 선택 이벤트.
        let recordVO = recordList[indexPath.row]
        //if recordVO.score_team == -1{
        guard let entry = storyboard?.instantiateViewController(withIdentifier: "DataDetailEntry") as? DataDetailEntry else {return}
        
        
        //기록 입력 안 됐을 때
        entry.id = recordVO.id
        entry.game_dt = recordVO.game_dt
        entry.place = recordVO.place
        entry.against_team = recordVO.against_team
        entry.message = recordVO.message
        entry.score_team = recordVO.score_team
        entry.score_against_team = recordVO.score_against_team
        entry.tactic = recordVO.tactic

            ad?.scheduleIdForStg = gino(recordVO.id)
        //        guard let entry = storyboard?.instantiateViewController(withIdentifier: "DataDetailEntry") as? DataDetailEntry else {return}
        //
        navigationController?.present(entry, animated:false, completion:{})
        //navigationController?.pushViewController(entry, animated: true)
      ///  }
     //   else{
      //      //기록 조회 페이지로.
     //   }
        
        
    }
    
}
