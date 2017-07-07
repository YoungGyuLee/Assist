//
//  TeamScheduleInsert.swift
//  Assist
//
//  Created by 이영규 on 2017. 6. 30..
//  Copyright © 2017년 YG. All rights reserved.
//

import UIKit


class TeamScheduleInsert : UIViewController, UIGestureRecognizerDelegate, NetworkCallback, UITextFieldDelegate{
    
    
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
            guard let dataInsert = storyboard?.instantiateViewController(withIdentifier: "TeamScheduleVC") as? TeamScheduleVC else {return}
            navigationController?.present(dataInsert, animated: true, completion: {})
        }
        else{
            print("등록실패")
        }
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        var tap = UITapGestureRecognizer(target: self, action: #selector(handleTap_mainview(_:)))
        tap.delegate = self
        
        matchHour.delegate = self
        matchHour.tag = 0
        
        matchMin.delegate = self
        matchMin.tag = 1
        
        place.delegate = self
        place.tag = 2
        
        againstTeam.delegate = self
        againstTeam.tag = 3
        
        message.delegate = self
        message.tag = 4
        
        
        
        
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
        
        if gino(Int(matchH)) > 23 || gino(Int(matchM)) > 59{
            simpleAlert(title: "시간 입력 오류", message: "시간은 24 \n 분은 60보다 작은 수를 입력해주세요")
        }
        else{
        model.addTeamSchedule(team_id: gino(ad?.myTeamId), game_dt: gsno(matchDay5), place: gsno(place.text), against_team: gsno(againstTeam.text), message: gsno(message.text))
        }
    }
    
    func simpleAlert(title:String, message msg:String){
        let alert = UIAlertController(title: title, message: msg, preferredStyle: .alert)
        //let okAction = UIAlertAction(title:"확인", style:.default)

        let okAction = UIAlertAction(title:"확인",  style:.cancel)
    
        alert.addAction(okAction)
        
        present(alert, animated:true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        // Try to find next responder
        if let nextField = textField.superview?.viewWithTag(textField.tag + 1) as? UITextField {
            nextField.becomeFirstResponder()
        } else {
            // Not found, so remove keyboard.
            textField.resignFirstResponder()
        }
        // Do not add a line break
        return false
    }
    

    
    
}
