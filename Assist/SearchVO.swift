//
//  SearchVO.swift
//  Assist
//
//  Created by 이영규 on 2017. 6. 28..
//  Copyright © 2017년 YG. All rights reserved.
//

import ObjectMapper


class SearchVO : Mappable{
    var id : Int?
    var teamName : String?
    var plcaeName : String?
    var coachName : String?
    
    required init?(map: Map) {}
    
    
    
//    init(teamName:String?, plcaeName:String?, coachName:String?){
//        self.teamName = teamName
//        self.plcaeName = plcaeName
//        self.coachName = coachName
//    }
//    
    func mapping(map: Map) {
        id<-map["id"]
        teamName <- map["teamname"]
        plcaeName <- map["region"]
        coachName<-map["manager"]
        
    }
    
}
