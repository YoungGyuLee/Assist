//
//  DataRecordPostVO.swift
//  Assist
//
//  Created by 이영규 on 2017. 7. 6..
//  Copyright © 2017년 YG. All rights reserved.
//

import Foundation

class DataRecordPostVO{
    var type : String?
    var player_id : Int?
    var player_id2 : Int?
    init(type : String?, player_id : Int?, player_id2 : Int?) {
        self.type = type
        self.player_id = player_id
        self.player_id2 = player_id2
    }
}
