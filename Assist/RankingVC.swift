//
//  RankingVC.swift
//  Assist
//
//  Created by 이영규 on 2017. 7. 5..
//  Copyright © 2017년 YG. All rights reserved.
//

import Foundation
import UIKit

class RankingVC : UIViewController, NetworkCallback, UITableViewDelegate, UITableViewDataSource{
    
    var rankList : [RankVO] = [RankVO]()
    @IBOutlet var rankTable: UITableView!
    
    
    func networkResult(resultData: Any, code: String) {
        if code == "랭킹조회"{
            rankList = resultData as! [RankVO]

            //boardListTable.reloadData()
            rankTable.reloadData()
        }
        
    }
    
    override func viewDidLoad() {
        
        let model = RankModel(self)
        model.getRank()
        
        
        rankTable.delegate = self
        rankTable.dataSource = self
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return rankList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = rankTable.dequeueReusableCell(withIdentifier: "RankCell") as! RankCell

        //해당 셀 이름과 클래스 명시
        let rankVO = rankList[indexPath.row]
        
        cell.myTeam.text = rankVO.teamname
        cell.draw.text = rankVO.draw_game?.description
        let winGame : Int = rankVO.win_game!
        cell.win.text = winGame.description
        cell.lose.text = rankVO.lose_game?.description
        let totalGame : Int = rankVO.total_game!
        cell.totalGame.text = totalGame.description
        cell.rate.text = ((Float(winGame)/Float(totalGame)*100)).description
        cell.rank.text = rankVO.rank?.description
        
        
        
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            //테이블 셀 선택 이벤트.
        
        
    }    
    @IBAction func toMain(_ sender: Any) {
        dismiss(animated: true, completion: {})
    }
    

    
    
}
