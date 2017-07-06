//
//  DataMembersResponse.swift
//  Assist
//
//  Created by 이영규 on 2017. 7. 6..
//  Copyright © 2017년 YG. All rights reserved.
//

import Foundation

import ObjectMapper

class DataMembersResponse : Mappable{
    var score : [DataMembersScore]?
    var assist : [DataMembersAssist]?
    
    required init?(map: Map) {
        
        
    }
    
    func mapping(map: Map) {
        score <- map["score"]
        assist <- map["assist"]
    }
}
