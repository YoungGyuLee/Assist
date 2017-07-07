//
//  DataTeamR4.swift
//  Assist
//
//  Created by 이영규 on 2017. 6. 29..
//  Copyright © 2017년 YG. All rights reserved.
//

import Foundation
import UIKit

class DataTeamR4 : UIViewController, NetworkCallback{
    
    @IBOutlet var goal1st: UIImageView!
    @IBOutlet var goal1stName: UILabel!
    @IBOutlet var goal1stScore: UILabel!
    
    @IBOutlet var goal2nd: UIImageView!
    @IBOutlet var goal2ndScore: UILabel!
    @IBOutlet var goal2ndName: UILabel!
    
    
    @IBOutlet var goal3rd: UIImageView!
    @IBOutlet var goal3rdName: UILabel!
    @IBOutlet var goal3rdScore: UILabel!
    
    
    @IBOutlet var goal4th: UIImageView!
    @IBOutlet var goal4thName: UILabel!
    @IBOutlet var goal4thScore: UILabel!
    
    
    @IBOutlet var assist1st: UIImageView!
    @IBOutlet var assist1stName: UILabel!
    @IBOutlet var assist1stast: UILabel!
    
    
    @IBOutlet var assist2nd: UIImageView!
    @IBOutlet var assist2ndName: UILabel!
    @IBOutlet var assist2ndasst: UILabel!
    
    
    
    @IBOutlet var assisst3rd: UIImageView!
    @IBOutlet var assist3rdName: UILabel!
    @IBOutlet var assist3rdast: UILabel!
    
    
    @IBOutlet var assist4th: UIImageView!
    @IBOutlet var assist4thNAme: UILabel!
    @IBOutlet var assist4thast: UILabel!
    
    var scoreList : [DataMembersScore] = [DataMembersScore]()
    var assistList : [DataMembersAssist] = [DataMembersAssist]()
    let ad = UIApplication.shared.delegate as? AppDelegate
    func networkResult(resultData: Any, code: String){
        if code == "팀기록득점"{
            scoreList = resultData as! [DataMembersScore]
            goal1st.imageFromUrl(getImgUrl(base: gsno(scoreList[0].profile_pic_url)), defaultImgPath: "symbol")
            goal1stName.text = gsno(scoreList[0].username)
            goal1stScore.text = gino(scoreList[0].score).description
            
            goal2nd.imageFromUrl(getImgUrl(base: gsno(scoreList[1].profile_pic_url)), defaultImgPath: "symbol")
            goal2ndName.text = gsno(scoreList[1].username)
            goal2ndScore.text = gino(scoreList[1].score).description
            
            goal3rd.imageFromUrl(getImgUrl(base: gsno(scoreList[2].profile_pic_url)), defaultImgPath: "symbol")
            goal3rdName.text = gsno(scoreList[2].username)
            goal3rdScore.text = gino(scoreList[2].score).description
            
            goal4th.imageFromUrl(getImgUrl(base: gsno(scoreList[3].profile_pic_url)), defaultImgPath: "symbol")
            goal4thName.text = gsno(scoreList[3].username)
            goal4thScore.text = gino(scoreList[3].score).description
        
        }
        
        if code == "팀기록도움"{
            assistList = resultData as! [DataMembersAssist]
            
            assist1st.imageFromUrl(getImgUrl(base : gsno(assistList[0].profile_pic_url)), defaultImgPath: "symbol")
            assist1stName.text = gsno(assistList[0].username)
            assist1stast.text = gino(assistList[0].assist).description
            
            assist2nd.imageFromUrl(getImgUrl(base : gsno(assistList[1].profile_pic_url)), defaultImgPath: "symbol")
            assist2ndName.text = gsno(assistList[1].username)
            assist2ndasst.text = gino(assistList[1].assist).description
        
            assisst3rd.imageFromUrl(getImgUrl(base : gsno(assistList[2].profile_pic_url)), defaultImgPath: "symbol")
            assist3rdName.text = gsno(assistList[2].username)
            assist3rdast.text = gino(assistList[2].assist).description
            
            assist4th.imageFromUrl(getImgUrl(base : gsno(assistList[3].profile_pic_url)), defaultImgPath: "symbol")
            assist4thNAme.text = gsno(assistList[3].username)
            assist4thast.text = gino(assistList[3].assist).description
            
        }
    }
    
    
//    1. 클라이언트에서 팀의 프로필 사진을 로드하는 url
//    public IP/static/images/profileImg/team/[profile_pic_url]
//    
//    2, 클라이언트에서 선수의 프로필사진을 로드하는 url public public IP/public/images/profileImg/player/[profile_pic_url]
    
    override func viewDidLoad(){
        goal1st.layer.cornerRadius = goal1st.frame.height/2
        goal1st.layer.mask?.masksToBounds = true
        
        goal2nd.layer.cornerRadius = goal2nd.frame.height/2
        goal2nd.layer.mask?.masksToBounds = true
        
        goal3rd.layer.cornerRadius = goal3rd.frame.height/2
        goal3rd.layer.mask?.masksToBounds = true
        
        goal4th.layer.cornerRadius = goal4th.frame.height/2
        goal4th.layer.mask?.masksToBounds = true
        
        assist1st.layer.cornerRadius = assist1st.frame.height/2
        assist1st.layer.mask?.masksToBounds = true
        
        assist2nd.layer.cornerRadius = assist2nd.frame.height/2
        assist2nd.layer.mask?.masksToBounds = true
        
        assisst3rd.layer.cornerRadius = assisst3rd.frame.height/2
        assisst3rd.layer.mask?.masksToBounds = true
        
        assist4th.layer.cornerRadius = assist4th.frame.height/2
        assist4th.layer.mask?.masksToBounds = true
        
        let model = DataModel(self)
        model.getTeamSort(team_id: gino(ad?.myTeamId))
    
    }
    func getImgUrl(base : String) -> String{
        let imgURL = "http://13.124.136.174:3000/static/images/profileImg/player/\(base)"
        return imgURL
    }
}
