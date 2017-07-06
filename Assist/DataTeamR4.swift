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
    
    

    
    override func viewDidLoad(){
        let model = DataModel(self)
        model.getTeamSort(team_id: gino(ad?.myTeamId))
    
    }
    func getImgUrl(base : String) -> String{
        let imgURL = ""
        return imgURL
    }
}
