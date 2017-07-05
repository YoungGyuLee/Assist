//
//  DataDSGk.swift
//  Assist
//
//  Created by 이영규 on 2017. 7. 5..
//  Copyright © 2017년 YG. All rights reserved.
//

import Foundation
import ObjectMapper

class DataDSGk : Mappable{
    var id : Int?
    var username : String?
    var backnumber : Int?
    
    required init?(map: Map) {
        
        
    }
    
    func mapping(map: Map) {
        id <- map["id"]
        username <- map["username"]
        backnumber <- map["backnumber"]
        
    }
    
    
}
