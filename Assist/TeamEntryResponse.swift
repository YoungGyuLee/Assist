//
//  TeamEntryResponse.swift
//  Assist
//
//  Created by 이영규 on 2017. 7. 4..
//  Copyright © 2017년 YG. All rights reserved.
//

import ObjectMapper

class TeamEntryResponse : Mappable{
    var noattend : [TeamNoEntryVO]?
    var attend : [TeamEntryVO]?
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        noattend <- map["noattend"]
        attend <- map["attend"]
        
    }
}
