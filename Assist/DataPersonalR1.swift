//
//  DataPersonalR1.swift
//  Assist
//
//  Created by 이영규 on 2017. 6. 29..
//  Copyright © 2017년 YG. All rights reserved.
//

import UIKit
class DataPersonalR1 : UIViewController, NetworkCallback{
    let ad = UIApplication.shared.delegate as? AppDelegate
    var userAffect : DataPersonalAttendAf?
    var userNoaffect: DataPersonalNoattendAf?
    
    
    @IBOutlet var totalGame: UILabel!
    @IBOutlet var score: UILabel!
    @IBOutlet var assist: UILabel!
    @IBOutlet var lost: UILabel!
    
    @IBOutlet var afVicRate: UILabel!
    @IBOutlet var avgLost: UILabel!
    @IBOutlet var avgScore: UILabel!
    
    @IBOutlet var noAfVicRate: UILabel!
    @IBOutlet var avgScoreN: UILabel!
    @IBOutlet var avgLostN: UILabel!
    
    
    
    
//    "total_game": 55,
//    "win_game": 40,
//    "score_team": 12,
//    "score_against_team": 13
    func networkResult(resultData: Any, code: String) {
        if code == "개인영향참가"{
            userAffect = resultData as! DataPersonalAttendAf
            score.text = gino(ad?.myScore).description
            assist.text = gino(ad?.myAssist).description
            
            //print("개인여여")
            totalGame.text = gino(userAffect?.total_game).description

            lost.text = gino(userAffect?.score_against_team).description

            afVicRate.text = (Float(gino(userAffect?.win_game))/Float(gino(userAffect?.total_game))).description
            print("개인 승률")
            
            print(gino(userAffect?.win_game))
            print(gino(userAffect?.total_game))
            print((Float(gino(userAffect?.win_game))/Float(gino(userAffect?.total_game))).description)
            avgScore.text = (Float(gino(userAffect?.score_team))/Float(gino(userAffect?.total_game))).description
            avgLost.text = (Float(gino(userAffect?.score_against_team))/Float(gino(userAffect?.total_game))).description
            
        }
        
        if code == "개인영향불참"{
           userNoaffect = resultData as! DataPersonalNoattendAf
            
            afVicRate.text = (Float(gino(userNoaffect?.win_game))/Float(gino(userNoaffect?.total_game))).description
            avgScore.text = (Float(gino(userNoaffect?.score_team))/Float(gino(userNoaffect?.total_game))).description
            avgLost.text = (Float(gino(userNoaffect?.score_against_team))/Float(gino(userNoaffect?.total_game))).description
        }
    }
    
    
    @IBOutlet var totalView: UIView!
    
    @IBOutlet var scoreView: UIView!
    
    @IBOutlet var assistView: UIView!

    @IBOutlet var lostView: UIView!
    
    @IBOutlet var attendView: UIView!
    
    
    @IBOutlet var noattendView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        coachText.layer.borderWidth = 1
//        coachText.layer.borderColo = uicolorFromHex(rgbValue: 0x46B2CE)
        
        
        totalView.layer.cornerRadius = totalView.frame.height/2
        totalView.layer.mask?.masksToBounds = true
        
        scoreView.layer.cornerRadius = scoreView.frame.height/2
        scoreView.layer.mask?.masksToBounds = true
        
        assistView.layer.cornerRadius = assistView.frame.height/2
        assistView.layer.mask?.masksToBounds = true
        
        lostView.layer.cornerRadius = lostView.frame.height/2
        lostView.layer.mask?.masksToBounds = true
        
        
        attendView.layer.cornerRadius = 4
        noattendView.layer.cornerRadius = 4
        
        let model = DataModel(self)
        model.getUserAffect(player_id: gino(ad?.userId))
        

    }


    
}
