//
//  SearchResult.swift
//  Assist
//
//  Created by 이영규 on 2017. 7. 3..
//  Copyright © 2017년 YG. All rights reserved.
//

import Foundation
import ObjectMapper


//팀 목록 조회
class SearchResult : Mappable{
    var status : Int?
    var response : [SearchVO]?
    
    
    required init?(map: Map){
        
    }
    //Mappable 프로토콜을 구현할 때 반드시 구현되어야 하는 함수
    func mapping(map: Map) {
        status <- map["status"]
        response <- map["response"]
    }
    
    
    
}
