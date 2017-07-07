//
//  Data433.swift
//  Assist
//
//  Created by 이영규 on 2017. 7. 1..
//  Copyright © 2017년 YG. All rights reserved.
//

import UIKit


class DataRecord433 : UIViewController, NetworkCallback{
    
    @IBOutlet var GKN: UILabel!
    
    @IBOutlet var def1N: UILabel!
    @IBOutlet var def2N: UILabel!
    @IBOutlet var def3N: UILabel!
    @IBOutlet var def4N: UILabel!
    
    @IBOutlet var mid1N: UILabel!
    @IBOutlet var mid2N: UILabel!
    @IBOutlet var mid3N: UILabel!
    
    @IBOutlet var atk1N: UILabel!
    @IBOutlet var atk2N: UILabel!
    @IBOutlet var atk3N: UILabel!
    
    
    
    var touched : Bool = false
    var changedNum : String = ""
    var willChangNum : String = ""
    var tempNum : String = ""
    var currentSelectedLabel = UILabel()

    let com = Company()
    let ad = UIApplication.shared.delegate as? AppDelegate
    
    var entryList : [TeamEntryVO] = [TeamEntryVO]()
    
    var tempPlayer : [DataReportTemp] = [DataReportTemp]()
    var event : [DataRecordEvent] = [DataRecordEvent]()
    
    var atkList : [DataReportATK] = [DataReportATK]()
    var defList : [DataReportDEF] = [DataReportDEF]()
    var midList : [DataReportMID] = [DataReportMID]()
    var gkList : [DataReportGK] = [DataReportGK]()
    var subList : [DataReportSUB] = [DataReportSUB]()
    
    var memberList : [Int] = [1,2,3,4,5,6,7,8,9,10,11]
    var memberListString : [String] = ["1","2","3","4","5","6","7","8","9","10","11"]
    var stg : String = "433"
    //int형 배열 선언
    //전술별로 얼마나 끊어야 하는 지 명세
    //번호 바뀔 때 마다 배열의 자리 바꿈
    //이 배열을 바꿀 때마다 부모로 보냄.
    
    //433이면 0//1~4//5~7//8~10 으로 끊어줘야 함.
    
    func networkResult(resultData: Any, code: String) {
        if code == "리포트플레이어공격"{
            print("리포트플레이어공격")
            atkList = resultData as! [DataReportATK]
            makeBakcNumberListATK()
//            makeBakcNumberList()
        }
        if code == "리포트플레이어수비"{
            print("리포트플레이어수비")
            defList = resultData as! [DataReportDEF]
            makeBakcNumberListDEF()
            //            makeBakcNumberList()
        }
        
        if code == "리포트플레이어미드"{
            print("리포트플레이어미드")
            midList = resultData as! [DataReportMID]
            makeBakcNumberListMD()
            //            makeBakcNumberList()
        }
        
        if code == "리포트플레이어골키"{
            print("리포트플레이어골키")
            gkList = resultData as! [DataReportGK]
            makeBakcNumberListGK()
            //            makeBakcNumberList()
        }
        
        if code == "리포트플레이어서브"{
            print("리포트플레이어서브")
            subList = resultData as! [DataReportSUB]
            makeBakcNumberListSUB()
            //            makeBakcNumberList()
        }
        
        if code == "리포트이벤트"{
            print("리포트")
            event = resultData as! [DataRecordEvent]
        }
    }
    
    func makeBakcNumberListATK(){
        atk1N.text = atkList[0].backnumber?.description
        atk2N.text = atkList[1].backnumber?.description
        atk3N.text = atkList[2].backnumber?.description
    }
    func makeBakcNumberListDEF(){

        def1N.text = defList[0].backnumber?.description
        def2N.text = defList[1].backnumber?.description
        def3N.text = defList[2].backnumber?.description
        def4N.text = defList[3].backnumber?.description
        
    }
    func makeBakcNumberListMD(){
        mid1N.text = midList[0].backnumber?.description
        mid2N.text = midList[1].backnumber?.description
        mid3N.text = midList[2].backnumber?.description
        
    }
    func makeBakcNumberListGK(){
        GKN.text = gkList[0].backnumber?.description
        
    }
    func makeBakcNumberListSUB(){
        
    }
    
    
    func makeBakcNumberList(){
        
        
    }
    
    override func viewDidDisappear(_ animated: Bool) {

        //여기서 등번호->이름 딕셔너리 하나 만들어야 함.
    }
    
    
    override func viewDidLoad() {
        //1. 목록을 다 불러온다.
        let model = DataModel(self)
        model.getReport(schedule_id: gino(ad?.scheduleIdForStg))
        print(gino(ad?.scheduleIdForStg))
        print("저어어어어언술")
    }
    
    
}
