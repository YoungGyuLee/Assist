//
//  TeamEntryMemVO.swift
//  Assist
//
//  Created by 이영규 on 2017. 7. 2..
//  Copyright © 2017년 YG. All rights reserved.
//



class TeamEntryMemVO{
    var backNum : String?
    var name : String?
    var age : String?
    var position : String?
    var gameDay : String?
    var goal : String?
    var assist : String?
    
    init(backNum : String?, name : String?, age : String?, position : String?, gameDay : String?, goal : String?, assist : String?) {
        self.backNum = backNum
        self.name = name
        self.age = age
        self.position = position
        self.gameDay = gameDay
        self.goal = goal
        self.assist = assist
    }
    
}
