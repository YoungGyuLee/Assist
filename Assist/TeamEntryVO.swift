//
//  TeamEntryVO.swift
//  Assist
//
//  Created by 이영규 on 2017. 7. 1..
//  Copyright © 2017년 YG. All rights reserved.
//

import ObjectMapper

class TeamEntryVO : Mappable{
    //var entryName : String?
    //{'id':1, 'username': 'Jahyun Kim', 'positino':'ATK', 'backnumber': 1}
//    init(entryName : String?) {
//        self.entryName = entryName
//    }
    
    var id : Int?
    var username : String?
    var position : String?
    var backnumber : Int?
    
    required init?(map: Map) {
        
        
    }
    
    func mapping(map: Map) {
        id <- map["id"]
        username <- map["username"]
        position <- map["position"]
        backnumber <- map["backnumber"]
        
    }
    
}
