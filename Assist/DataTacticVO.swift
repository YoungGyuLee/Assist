//
//  DataTacticVO.swift
//  Assist
//
//  Created by 이영규 on 2017. 7. 6..
//  Copyright © 2017년 YG. All rights reserved.
//

import Foundation

class DataTacticVO{

    var tactic : String?
    var total_game : Int?
    var win_game : Int?
    var draw_game : Int?
    var lose_game : Int?
    init(tactic : String?, total_game : Int?, win_game : Int?, draw_game : Int?, lose_game : Int?) {
        self.tactic = tactic
        self.total_game = total_game
        self.win_game = win_game
        self.draw_game = draw_game
        self.lose_game = lose_game
    }
}
