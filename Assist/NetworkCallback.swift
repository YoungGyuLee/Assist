//
//  NetworkCallback.swift
//  Assist
//
//  Created by 이영규 on 2017. 7. 3..
//  Copyright © 2017년 YG. All rights reserved.
//

protocol NetworkCallback {
    
    func networkResult(resultData:Any, code:String)
    func networkFailed()
    
}
