//
//  TeamScheduleInsert.swift
//  Assist
//
//  Created by 이영규 on 2017. 6. 30..
//  Copyright © 2017년 YG. All rights reserved.
//

import UIKit


class TeamScheduleInsert : UIViewController, UIGestureRecognizerDelegate, NetworkCallback{
    
    
    @IBOutlet var registerSchedule: UIButton!
    @IBOutlet var gameDate: UILabel!
    var gameDateString : String?
    let ad = UIApplication.shared.delegate as? AppDelegate
    let dateForamtterGet = DateFormatter()
    
    @IBOutlet var matchHour: UITextField!
    @IBOutlet var matchMin: UITextField!
    
    @IBOutlet var place: UITextField!
    
    @IBOutlet var againstTeam: UITextField!
    
    @IBOutlet var message: UITextField!
    
    func networkResult(resultData: Any, code: String)
    {
        if code == "일정등록"{
            //let _ = navigationController?.popViewController(animated: true)
            print("등록 완료")
        }
        else{
            print("등록실패")
        }
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        var tap = UITapGestureRecognizer(target: self, action: #selector(handleTap_mainview(_:)))
        tap.delegate = self
        
        gameDate.text = gameDateString
        registerSchedule.layer.cornerRadius = 4
        
        //dateForamtterGet.dateFormat = "yyyy-MM-dd hh:mm:ss"
        self.view.addGestureRecognizer(tap)
        
    }
    
    func handleTap_mainview(_ sender: UITapGestureRecognizer?){
        print("탭탭")
        // self.idTxt.becomeFirstResponder()
        //자동으로 텍뷰에 포커스
        //self.nameText.resignFirstResponder()
        //텍뷰에 포커스 아웃.
        self.matchHour.resignFirstResponder()
        self.matchMin.resignFirstResponder()
        
    }
    
    
    @IBAction func addSchedule(_ sender: Any) {
        //서버로 데이터
        //나중에 화면 돌아갈 때 일정 선택 창에서.  reload되도록
        //달력으로 되돌아감
        dateForamtterGet.dateFormat = "yyyy-MM-dd hh:mm:ss"
        dateForamtterGet.locale = Locale.init(identifier: "ko_KR")
        
        var matchdate = Date()
        
        
        let matchH  = matchHour.text!
        let matchM  = matchMin.text!
        let matchDay  = gameDateString! + " "
        let matchDay2 = matchDay + matchH
        let matchDay3 = matchDay2 + ":"
        let matchDay4 = matchDay3 + matchM
        let matchDay5 = matchDay4 + ":00"
        
        print(matchH)
        print(matchM)
        print(matchDay)
        print(gameDateString)
        print(matchDay2)
        print(matchDay3)
        print(matchDay4)
        print(matchDay5)

        
        
        let model = TeamModel(self)
        
        
        model.addTeamSchedule(team_id: gino(ad?.myTeamId), game_dt: gsno(matchDay5), place: "마리하우스", against_team: "돔돔", message: "밥먹자")
    }
}
