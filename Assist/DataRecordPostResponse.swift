//
//  DataRecordPostResponse.swift
//  Assist
//
//  Created by 이영규 on 2017. 7. 6..
//  Copyright © 2017년 YG. All rights reserved.
//

import Foundation
import ObjectMapper

class DataRecordPostResponse : Mappable{
    var status : Int?
    var message : String?
    
    func mapping(map: Map) {
        status <- map["status"]
        message <- map["message"]
        
    }
    
    required init?(map: Map) {
        
        
    }
    
    
}
