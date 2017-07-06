//
//  DataTeamR1.swift
//  Assist
//
//  Created by 이영규 on 2017. 6. 29..
//  Copyright © 2017년 YG. All rights reserved.
//

import Foundation
import UIKit
class DataTeamR1 : UIViewController, NetworkCallback{
    
    var recordList : [DataScheduleResponse] = [DataScheduleResponse]()
    let ad = UIApplication.shared.delegate as? AppDelegate
    override func viewDidLoad(){
        let model = DataModel(self)
        model.getTeamDateRecord(team_id: gino(ad?.myTeamId))
    }
    @IBOutlet var firstGameView: UIImageView!
    @IBOutlet var fireGameDate: UILabel!
    @IBOutlet var firstGameWin: UILabel!
    @IBOutlet var firstGameLose: UILabel!
    
    
    @IBOutlet var secondView: UIImageView!
    @IBOutlet var secondDate: UILabel!
    @IBOutlet var secondWin: UILabel!
    @IBOutlet var secondLose: UILabel!
    
    @IBOutlet var thirdView: UIImageView!
    @IBOutlet var thirdDate: UILabel!
    @IBOutlet var thirdWin: UILabel!
    @IBOutlet var thirdLose: UILabel!
    
    @IBOutlet var fourthView: UIImageView!
    @IBOutlet var fouthDate: UILabel!
    @IBOutlet var fourthWin: UILabel!
    @IBOutlet var fouthLose: UILabel!
    
    @IBOutlet var fifthView: UIImageView!
    @IBOutlet var fifthDate: UILabel!
    @IBOutlet var fifthWin: UILabel!
    @IBOutlet var fifthLose: UILabel!
    
    func networkResult(resultData: Any, code: String) {
        if code == "기록조회"{
            recordList = resultData as! [DataScheduleResponse]
            
            fillRecord()

            
            
        }
        
    }
    
    func fillRecord(){
        if(recordList.count>0){
            fireGameDate.text = transferString(date: recordList[recordList.count-1].game_dt!)
            firstGameWin.text = recordList[recordList.count-1].score_team?.description
            firstGameLose.text = recordList[recordList.count-1].score_against_team?.description
        }
        else{
            
        }
        
        if(recordList.count-1>0){
            secondDate.text = transferString(date: recordList[recordList.count-2].game_dt!)
            secondWin.text = recordList[recordList.count-2].score_team?.description
            secondLose.text = recordList[recordList.count-2].score_against_team?.description
            
        }
        else{
            
        }
        
        if(recordList.count-2>0){
            thirdDate.text = transferString(date: recordList[recordList.count-3].game_dt!)
            thirdWin.text = recordList[recordList.count-3].score_team?.description
            thirdLose.text = recordList[recordList.count-3].score_against_team?.description
            
        }
        else{
            
        }
        
        if(recordList.count-3>0){
            fouthDate.text = transferString(date: recordList[recordList.count-4].game_dt!)
            fourthWin.text = recordList[recordList.count-4].score_team?.description
            fouthLose.text = recordList[recordList.count-4].score_against_team?.description
            
        }
        else{
            
        }
        
        if(recordList.count-4>0){
            fifthDate.text = transferString(date: recordList[recordList.count-5].game_dt!)
            fifthWin.text = recordList[recordList.count-5].score_team?.description
            fifthLose.text = recordList[recordList.count-5].score_against_team?.description
        }
        else{
            
        }
        

    }
    
    func transferString(date : String)->String{
        let index = date.index(date.startIndex, offsetBy: 10)
        var fullDate: String = date.substring(to: index)
        
        //fullDate.components(separatedBy: <#T##CharacterSet#>)
        let fullDateArr = fullDate.components(separatedBy: "-")
        
        let year = fullDateArr[0]
        let month = fullDateArr[1]
        let day = fullDateArr[2]
        
        let dateText = "\(month)월 \(day)월 "
        
        return dateText
    }
    
    
}
