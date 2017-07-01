//
//  TeamScheduleInsert.swift
//  Assist
//
//  Created by 이영규 on 2017. 6. 30..
//  Copyright © 2017년 YG. All rights reserved.
//

import UIKit

class TeamScheduleInsert : UIViewController{
    
    
    @IBOutlet var registerSchedule: UIButton!
    @IBOutlet var gameDate: UILabel!
    var gameDateString : String?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        gameDate.text = gameDateString
        registerSchedule.layer.cornerRadius = 4
        
    }
    
    
    
    @IBAction func addSchedule(_ sender: Any) {
        //서버로 데이터
        //나중에 화면 돌아갈 때 일정 선택 창에서.  reload되도록
        //달력으로 되돌아감
        
        
        
    }
    
    
}
