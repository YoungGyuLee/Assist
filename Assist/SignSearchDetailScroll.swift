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
    
    
    func networkResult(resultData: Any, code: String) {
        print("들어옴 3")
        if code == "팀프로필"{
            //progress1 = KDCircularProgress(frame: progressbase.frame)
            profileList = resultData as! TeamProfileResponse

            
            place.text = gsno(profileList!.region)
            coach.text = gsno(profileList!.manager)
            foundDate.text = gsno(profileList!.found_dt)
            teamMsg.text = gsno(profileList!.message)
            //progressbase
            progress1 = KDCircularProgress(frame: CGRect(x: progressbase.frame.minX, y: progressbase.frame.minY, width: progressbase.frame.size.width, height: progressbase.frame.size.height))
            

            progress1.angle = (Double(gino(profileList!.win_game!)))/(Double(gino(profileList!.total_game!)))*360

            progress1.startAngle = -90
            progress1.clockwise = true
            progress1.glowMode = .forward
            progress1.roundedCorners = false
            progress1.set(colors: UIColor.yellow)
            
            print(gsno(profileList?.profile_pic_url))
            
            let imgURL = "http://13.124.136.174:3000/static/images/profileImg/team/\(gsno(profileList?.profile_pic_url))"
            
            print(imgURL)
            
            KingfisherManager.shared.cache.clearMemoryCache()
            teamImg.imageFromUrl(gsno(imgURL), defaultImgPath: "symbol")
            
            KingfisherManager.shared.cache.clearMemoryCache()
        

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
            //progress1.
            
            //boardListTable.reloadData()
        }
        
        if code == "회원가입" {
            print(resultData)
            //signResponse = resultData as! SignResponse
            signResponse = resultData as! SignVO
            ad?.userId = signResponse?.id
            //창단 아닌 회원가입의 경우 팀 아이디를 저장 해 놓음. 그래서 굳이 여기서도 저장할 필요는 없음.
            
            print("회원 아이디 \(ad?.userId)")
            print("팀 아이디 \(ad?.myTeamId)")
            
            
            let main_storyboard = UIStoryboard(name : "Main", bundle : nil)
            print("들어왔졍1")
            guard let main = main_storyboard.instantiateViewController(withIdentifier: "MainVC") as? MainVC else{return}
            print("들어왔졍2")
            self.present(main, animated: true)
            
            
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
       //테이블뷰 자체 크기보다 누적되어있는 셀들의 높이들의 합이 더 작을경우( 테이블뷰에 셀이 한두개만있고 나머지 셀은 비어있는 상태)
        //해당 코드로 보기싫은 밑줄들을 지워줍니다
        //쉽게생각해서 비어있는 셀들을 뷰로 덮어버리는거라고 생각하시면됩니다
        //detailTable.tableFooterView = UIView.init(frame: CGRect.zero)
    }
    
    @IBAction func sign(_ sender: Any) {
        
        let model = SignSplashModel(self)
        
        print(gsno(ad?.username))
        print(gsno(ad?.email))
        print(gsno(ad?.password))
        print(gino(ad?.age))
        print(gfno(ad?.height))
        print(gsno(ad?.foot))
        print(gsno("MF"))
        print(gsno("RM"))
        print(gino(ad?.backnumber))
        print(gino(ad?.myTeamId))
        
        
        if let profile = ad?.profile_pic{
            print(profile)
         model.signUp(username:gsno(ad?.username), email:gsno(ad?.email), password:gsno(ad?.password),age:gino(ad?.age), height : gfno(ad?.height), weight : gfno(ad?.weight), foot : gsno(ad?.foot) ,position : gsno("MF"),position_detail : gsno("RM"),backnumber : gino(ad?.backnumber), team_id : gino(ad?.myTeamId), profile_pic:profile as! Data)
        }
        

    }
    
    override func viewDidLoad() {
        print("들어옴 설마 여기")

        
    }
    
    
}
