//
//  SearchVO.swift
//  Assist
//
//  Created by 이영규 on 2017. 6. 28..
//  Copyright © 2017년 YG. All rights reserved.
//

import Foundation

class SearchVO{
    var teamName : String?
    var plcaeName : String?
    var coachName : String?
    
    init(teamName:String?, plcaeName:String?, coachName:String?){
        self.teamName = teamName
        self.plcaeName = plcaeName
        self.coachName = coachName
    }
    
}
