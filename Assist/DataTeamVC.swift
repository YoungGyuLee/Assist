//
//  DataTeamVC.swift
//  Assist
//
//  Created by 이영규 on 2017. 6. 29..
//  Copyright © 2017년 YG. All rights reserved.
//

import Foundation
import KDCircularProgress
import UIKit

class DataTeamVC : UIViewController, NetworkCallback{
    
   // 팀기록일반
    var profileList : TeamProfileResponse?
    var signResponse : SignVO?
    
    var id : Int?
    let ad = UIApplication.shared.delegate as? AppDelegate
    
    var progress1: KDCircularProgress!
    @IBOutlet var progressbase: UIView!
    
    @IBOutlet var teamName: UILabel!
    @IBOutlet var totalGame: UILabel!
    @IBOutlet var winGame: UILabel!
    @IBOutlet var drawGame: UILabel!
    @IBOutlet var loseGame: UILabel!
    
    @IBOutlet var averageLost: UILabel!
    @IBOutlet var averageScore: UILabel!
    
    @IBOutlet var winRate: UILabel!
    func networkResult(resultData: Any, code: String) {
        if code == "팀프로필"{
            //progress1 = KDCircularProgress(frame: progressbase.frame)
            profileList = resultData as! TeamProfileResponse
            
            teamName.text = profileList?.teamname
            //progressbase
            progress1 = KDCircularProgress(frame: CGRect(x:0 , y: 0, width: progressbase.frame.size.width, height: progressbase.frame.size.height))
            
            
            totalGame.text = profileList!.total_game?.description
            winGame.text = (gino(profileList!.win_game)).description
            drawGame.text = (gino(profileList!.draw_game)).description
            loseGame.text = (gino(profileList!.lose_game)).description
            

            if gino(profileList!.total_game) == 0 {
                winRate.text = "0"
            }
            else{
            winRate.text = ((gino(profileList!.win_game))*100/(gino(profileList!.total_game))).description
                progress1.angle = (Double(gino(profileList!.win_game!)))/(Double(gino(profileList!.total_game!)))*360
                print(gino(profileList!.win_game))
                print(gino(profileList!.total_game))
            }
            
            averageLost.text = ((Double(gino(profileList!.total_score_against!)))/(Double(gino(profileList!.total_game!)))).description
            
            averageScore.text = ((Double(gino(profileList!.total_score!)))/(Double(gino(profileList!.total_game!)))).description
            
            progress1.startAngle = -90
            progress1.clockwise = true
            progress1.glowMode = .forward
            progress1.roundedCorners = false
            progress1.set(colors: UIColor.yellow)
            

            
            progress1.animate(fromAngle: 0, toAngle: progress1.angle
            , duration: 5) { completed in
                if completed {
                    print("animation stopped, completed")
                } else {
                    print("animation stopped, was interrupted")
                }
            }
            
            progress1.reloadInputViews()
            progressbase.addSubview(progress1)
 
        }
    }
    
    
    override func viewDidLoad() {
        let model = SignSplashModel(self)
        print("팀넘버 \(gino(ad?.myTeamId))")
        model.getTeamProfile(team_id: gino(ad?.myTeamId))
        
    }
    
}
