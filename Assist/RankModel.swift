//
//  RankModel.swift
//  Assist
//
//  Created by 이영규 on 2017. 7. 5..
//  Copyright © 2017년 YG. All rights reserved.
//

import Alamofire
import ObjectMapper
import AlamofireObjectMapper
import SwiftyJSON


class RankModel : NetworkModel{
    
    func getRank(){
        let URL : String = "\(baseURL)/team/rank"
        
        print(URL)
        Alamofire.request(URL, method: .get, parameters: nil, encoding: JSONEncoding.default, headers: nil).responseObject{
            
            (response : DataResponse<RankResult>) in
            //DataResponse 괄호 안에 데이터를 받을 객체를 넣으면 됨.
            switch response.result{
            case .success:
                //response.result.value
                guard let rankStatus = response.result.value else{
                    self.view.networkFailed()
                    return//데이터를 받아올 때는 result를 통해서.
                }
                if let results = rankStatus.response {//받아 온 데이터를 통해서 쓸 값을 여기서 정함.
                    self.view.networkResult(resultData: results, code: "랭킹조회")
                }
                
            case .failure(let err):
                print(err)
                self.view.networkFailed()
            }
            
        }
        
    }

    
    
    
    
}
