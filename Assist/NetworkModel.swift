//
//  NetworkModel.swift
//  Assist
//
//  Created by 이영규 on 2017. 7. 3..
//  Copyright © 2017년 YG. All rights reserved.
//

//
//  NetworkModel.swift
//  seminar_6
//
//  Created by 하태경 on 2017. 5. 14..
//  Copyright © 2017년 addcampus. All rights reserved.
//


import Foundation
class NetworkModel {
    
    //뷰컨트롤러로 데이터를 전달해줄 위임자를 나타내주는 변수
    
    //callbackDelegate
    var view : NetworkCallback
    
    
    init(_ vc : NetworkCallback){
        self.view = vc
    }
    
    let baseURL = "http://13.124.136.174:3000"
    
    //옵셔널 String을 해제하는데 값이 nil이면 ""을 반환
    func gsno(_ data: String?) -> String {
        guard let str = data else {
            return ""
        }
        return str
    }
    
    //옵셔널 Int를 해제하는데 값이 nil이면 0을 반환
    func gino(_ data: Int?) -> Int {
        guard let num = data else {
            return 0
        }
        return num
    }
    
    func gfno(_ data: Float?) -> Float {
        guard let floatinNum = data else {
            return 0
        }
        return floatinNum
    }
    
}
