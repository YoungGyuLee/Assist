//
//  DataPersonalR3.swift
//  Assist
//
//  Created by 이영규 on 2017. 6. 29..
//  Copyright © 2017년 YG. All rights reserved.
//

import UIKit

class DataPersonalR3 : UIViewController, NetworkCallback{
    let ad = UIApplication.shared.delegate as? AppDelegate
    var atk : DataPersonalATK?
    var df : DataPersonalDF?
    var mf : DataPersonalMF?
    var gk : DataPersonalGK?
    var sub : DataPersonalSub?
    
    @IBOutlet var atkVicRate: UILabel!
    @IBOutlet var atkGoal: UILabel!
    @IBOutlet var atkAssist: UILabel!
    @IBOutlet var atkAvgScore: UILabel!
    @IBOutlet var atkAvgLost: UILabel!
    
    @IBOutlet var midVicRate: UILabel!
    @IBOutlet var midGoal: UILabel!
    @IBOutlet var midAssist: UILabel!
    @IBOutlet var midScore: UILabel!
    @IBOutlet var midAvgLost: UILabel!
    
    
    @IBOutlet var dgVicRate: UILabel!
    @IBOutlet var dgNoLost: UILabel!
    @IBOutlet var dgAvgScore: UILabel!
    @IBOutlet var dgAvgLost: UILabel!
    
    
    
    
    func networkResult(resultData resultata: Any, code: String) {
        if code == "개인포지션별기록공격"{
            atk = resultata as! DataPersonalATK
            let assist = gino(atk?.assist)
            let score = gino(atk?.score)
            let lost = gino(atk?.score_against_team)
            let win = gino(atk?.win_game)
            let total = gino(atk?.total_game)
            
            atkVicRate.text = (Int((Float(win)/Float(total))*100)).description
            atkGoal.text = score.description
            atkAssist.text = assist.description
            atkAvgScore.text = ((Float(score)/Float(total))*100).description
            atkAvgLost.text = ((Float(lost)/Float(total))*100).description
            


        
        if code == "개인포지션별기록수비"{
            df = resultata as! DataPersonalDF


            
        }
        if code == "개인포지션별기록미드"{
            mf = resultata as! DataPersonalMF
            let assist = gino(mf?.assist)
            let score = gino(mf?.score)
            let lost = gino(mf?.score_against_team)
            let win = gino(mf?.win_game)
            let total = gino(mf?.total_game)
            
            
            midGoal.text = score.description
            midAssist.text = assist.description
            midScore.text = ((Float(score)/Float(total))*100).description
            midAvgLost.text = ((Float(lost)/Float(total))*100).description
            
        }
        if code == "개인포지션별기록골키"{
            gk = resultata as! DataPersonalGK
            
        }
        if code == "개인포지션별기록서브"{
            sub = resultata as! DataPersonalSub
            
        }
        }
        var dgAvgLost : Int
        var dgAvgScore : Int
        var dgNoLost : Int
        var totalGame : Int
        
        totalGame = gino(df?.total_game)
        if totalGame>0 {
        dgNoLost = gino(df?.no_score_against) + gino(gk?.no_score_against)
        dgAvgLost = (gino(df?.score_against_team) + gino(gk?.score_against_team))/totalGame
        dgAvgScore = (gino(df?.score) + gino(gk?.score))/totalGame
        }

    }
    
    
    @IBOutlet var atkView: UIView!
    @IBOutlet var mfView: UIView!
    @IBOutlet var dfView: UIView!
    
    override func viewDidLoad(){
        atkView.layer.cornerRadius = 4
        mfView.layer.cornerRadius = 4
        dfView.layer.cornerRadius = 4
        
        let model = DataModel(self)
        model.getUserPositionData(player_id: gino(ad?.userId))
    }
}
