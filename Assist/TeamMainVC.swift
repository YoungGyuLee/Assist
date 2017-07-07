//
//  TeamMainVC.swift
//  Assist
//
//  Created by 이영규 on 2017. 6. 28..
//  Copyright © 2017년 YG. All rights reserved.
//

import Foundation
import UIKit

class TeamMainVC : UIViewController, NetworkCallback{
    @IBOutlet var teamImg: UIImageView!
        //307 347 387

    @IBOutlet var teamName: UILabel!

    
    @IBOutlet var message: UILabel!
    @IBOutlet var coach: UILabel!

    @IBOutlet var found_dt: UILabel!
    
    @IBOutlet var place: UILabel!
    
    let ad = UIApplication.shared.delegate as? AppDelegate
    
    var profileList : TeamProfileResponse?
    override func viewDidLoad() {
        //teamImg.layer.cornerRadius =
        
        let model = SignSplashModel(self)
        model.getTeamProfile(team_id: gino(ad?.myTeamId))
        
        

        
    }
    
    func networkResult(resultData: Any, code: String) {
        if code == "팀프로필"{
            //progress1 = KDCircularProgress(frame: progressbase.frame)
            profileList = resultData as! TeamProfileResponse
            
            teamName.text = gsno(profileList!.teamname)
            place.text = gsno(profileList!.region)
            coach.text = gsno(profileList!.manager)
            found_dt.text = gsno(profileList!.found_dt)
            message.text = gsno(profileList!.message)
            //progressbase
            
            let imgURL = "http://13.124.136.174:3000/static/images/profileImg/team/\(gsno(profileList?.profile_pic_url))"

            teamImg.imageFromUrl(gsno(imgURL), defaultImgPath: "symbol")
        }

    }
}
