//
//  DataPersonalVC.swift
//  Assist
//
//  Created by 이영규 on 2017. 6. 29..
//  Copyright © 2017년 YG. All rights reserved.
//

import Foundation
import UIKit
import Kingfisher

class DataPersonalVC : UIViewController, NetworkCallback{
    
    @IBOutlet var userProfile: UIImageView!
    @IBOutlet var userName: UILabel!
    @IBOutlet var teamName: UILabel!
    @IBOutlet var userHeight: UILabel!
    
    @IBOutlet var userWeight: UILabel!
    @IBOutlet var userAge: UILabel!
    
    @IBOutlet var userPosition: UILabel!
    
    
    @IBOutlet var teamProfile: UIImageView!
    
    //GET /static/images/profileImg/player/dshyun0226_2@gmail.com_profile.jpg
    // GET /static/images/profileImg/team/FC CIC_profile.jpg
    let ad = UIApplication.shared.delegate as? AppDelegate
    var userData : DataPersonalResponse?
    var teamData : TeamProfileResponse?
    
    func networkResult(resultData: Any, code: String) {
        if code == "개인일반"{
            userData = resultData as! DataPersonalResponse
            
            let URL = ""
            
            userProfile.imageFromUrl(URL, defaultImgPath: "symbol")
            
            userName.text = gsno(userData?.username)
            userHeight.text = gfno(userData?.height).description
            userWeight.text = gfno(userData?.weight).description
            userAge.text = gino(userData?.age).description
            userPosition.text = gsno(userData?.position)
            ad?.myScore = gino(userData?.score)
            
            ad?.myAssist = gino(userData?.assist)
            //teamName.text = gsno(userData?.)
            let model1 = SignSplashModel(self)
            model1.getTeamProfile(team_id: gino(userData?.team_id))
            
            
        }
        if code == "팀프로필" {
            teamData = resultData as! TeamProfileResponse
            let URL = ""
            teamProfile.imageFromUrl(URL, defaultImgPath: "symbol")
            teamName.text = gsno(teamData?.teamname)
            
            
        }
        
        
    }
    
    
    override func viewDidLoad() {

        
        
        let model = DataModel(self)
        model.getUserInfo(player_id: gino(ad?.userId))
        super.viewDidLoad()
        
    }
    
    
    
    
}
