//
//  SignSearchDetailScroll.swift
//  Assist
//
//  Created by 이영규 on 2017. 6. 30..
//  Copyright © 2017년 YG. All rights reserved.
//

import UIKit
import KDCircularProgress
import Kingfisher

class SignSearchDetailScroll : UIViewController, NetworkCallback{
    
    @IBOutlet var teamImg: UIImageView!
    @IBOutlet var teamName: UILabel!
    @IBOutlet var place: UILabel!
    @IBOutlet var coach: UILabel!
    @IBOutlet var foundDate: UILabel!
    @IBOutlet var teamMsg: UITextView!
    
    var progress1: KDCircularProgress!
    @IBOutlet var progressbase: UIView!
    
    @IBOutlet var sign: UIButton!
    var profileList : TeamProfileResponse?
    var signResponse : SignVO?
    
    var id : Int?
    let ad = UIApplication.shared.delegate as? AppDelegate
    
    @IBOutlet var regionRank: UILabel!
    
    
    @IBOutlet var totalGame: UILabel!
    @IBOutlet var winGame: UILabel!
    @IBOutlet var drawGame: UILabel!
    @IBOutlet var loseGame: UILabel!
    
    @IBOutlet var averageLost: UILabel!
    @IBOutlet var averageScore: UILabel!
    
    @IBOutlet var winRate: UILabel!
    
    
    
    func networkResult(resultData: Any, code: String) {
        print("들어옴 3")
        if code == "팀프로필"{
            //progress1 = KDCircularProgress(frame: progressbase.frame)
            profileList = resultData as! TeamProfileResponse
            
            teamName.text = gsno(profileList!.teamname)
            place.text = gsno(profileList!.region)
            coach.text = gsno(profileList!.manager)
            foundDate.text = transferString(date: gsno(profileList!.found_dt))
            teamMsg.text = gsno(profileList!.message)
            //progressbase
            progress1 = KDCircularProgress(frame: CGRect(x: 0, y: 0, width: progressbase.frame.size.width, height: progressbase.frame.size.height))
            

            progress1.angle = (Double(gino(profileList!.win_game!)))/(Double(gino(profileList!.total_game!)))*360

            progress1.startAngle = -90
            progress1.clockwise = true
            progress1.glowMode = .forward
            progress1.roundedCorners = false
            progress1.set(colors: UIColor.yellow)
            
            
            totalGame.text = profileList!.total_game?.description
            winGame.text = (gino(profileList!.win_game)).description
            drawGame.text = (gino(profileList!.draw_game)).description
            loseGame.text = (gino(profileList!.lose_game)).description
            
            winRate.text = ((gino(profileList!.win_game))*100/(gino(profileList!.total_game))).description
            
            print(gsno(profileList?.profile_pic_url))
         
            let imgURL = ""
            
            averageLost.text = ((Double(gino(profileList!.total_score_against!)))/(Double(gino(profileList!.total_game!)))).description
            
            averageScore.text = ((Double(gino(profileList!.total_score!)))/(Double(gino(profileList!.total_game!)))).description
            
            
            print(imgURL)
            
            KingfisherManager.shared.cache.clearMemoryCache()
            teamImg.imageFromUrl(imgURL, defaultImgPath: "symbol")
            
            KingfisherManager.shared.cache.clearMemoryCache()
        

            progress1.animate(fromAngle: 0, toAngle: progress1.angle
, duration: 5) { completed in
                if completed {
                    print("animation stopped, completed")
                } else {
                    print("animation stopped, was interrupted")
                }
            }
            
            progressbase.addSubview(progress1)
            //progress1.
            
            //boardListTable.reloadData()
        }



    }
    override func viewWillAppear(_ animated: Bool) {
        print("들어옴 2")
        id = gino(ad?.myTeamId)
        if let detailID = id {
            let model = SignSplashModel(self)
            print(detailID)
            model.getTeamProfile(team_id: detailID)
        }

    }
    
    @IBAction func sign(_ sender: Any) {
        


    }
    
    override func viewDidLoad() {
        print("들어옴 설마 여기")

        
    }
    
    func transferString(date : String)->String{
        let index = date.index(date.startIndex, offsetBy: 10)
        var fullDate: String = date.substring(to: index)
        
        //fullDate.components(separatedBy: )
        let fullDateArr = fullDate.components(separatedBy: "-")
        
        let year = fullDateArr[0]
        let month = fullDateArr[1]
        let day = fullDateArr[2]
        
        let dateText = "\(year)년 \(month)월 \(day)월 "
        
        
        
        
        
        return dateText
    }
    
    
}
