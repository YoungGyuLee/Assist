//
//  DataTeamR3.swift
//  Assist
//
//  Created by 이영규 on 2017. 6. 29..
//  Copyright © 2017년 YG. All rights reserved.
//

import Foundation
import UIKit

class DataTeamR3 : UIViewController, NetworkCallback, UITableViewDelegate, UITableViewDataSource{
    
    @IBOutlet var taticRecord: UITableView!
    var taticList : [DataTeamResponse] = [DataTeamResponse]()

    let ad = UIApplication.shared.delegate as? AppDelegate
    //var tacticList : [DataTacticVO] = [DataTacticVO]()
    func networkResult(resultData: Any, code: String) {
        if code == "팀기록전술"{
            taticList = resultData as! [DataTeamResponse]
            print(taticList)
            taticRecord.reloadData()
        }
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //return searchList.count
        return taticList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = taticRecord.dequeueReusableCell(withIdentifier: "DataTacTicCell") as! DataTacTicCell
        //해당 셀 이름과 클래스 명시
        let tacticVO = taticList[indexPath.row]

        cell.tactic.text = tacticVO.tactic
        cell.total_game.text = tacticVO.total_game?.description
        cell.win_game.text = tacticVO.win_game?.description
        cell.draw_game.text = tacticVO.draw_game?.description
        cell.lose_game.text = tacticVO.lose_game?.description
        
        if tacticVO.total_game != 0{
            cell.win_rate.text = Float((gino(tacticVO.win_game))*100/(gino(tacticVO.total_game))).description
        }
        else{
            cell.win_rate.text = "0"
        }
        
        return cell
        
    }
    
    override func viewDidLoad(){
        let model = DataModel(self)
        model.getTacticReport(team_id: gino(ad?.myTeamId))
        taticRecord.delegate = self
        taticRecord.dataSource = self
    }
    
}
