//
//  DataRecordVO.swift
//  Assist
//
//  Created by 이영규 on 2017. 7. 3..
//  Copyright © 2017년 YG. All rights reserved.
//

class DataRecordVO{
    var goal : String?
    var assist : String?
    var lost : String?
    var goalMark : Bool?
    var assistMark : Bool?
    var lostMark : Bool?
    //선수 이름
    //선수 등번호 받아서 이름 넣음
    
    init(goal : String?, assist : String?, lost : String?, goalMark : Bool?, assistMark : Bool?, lostMark : Bool?){
        self.goal = goal
        self.assist = assist
        self.lost = lost
        self.goalMark = goalMark
        self.assistMark = assistMark
        self.lostMark = lostMark
    }
    
}
