//
//  DataResult.swift
//  Assist
//
//  Created by 이영규 on 2017. 7. 6..
//  Copyright © 2017년 YG. All rights reserved.
//

import Foundation
import UIKit


class DataResult : UIViewController,UICollectionViewDataSource, UICollectionViewDelegate, UITableViewDelegate, UITableViewDataSource, NetworkCallback{
    
    @IBOutlet var data433: UIView!
    
    @IBOutlet var data442: UIView!
    
    @IBOutlet var data352: UIView!
    
    
    @IBOutlet var data451: UIView!
    
    @IBOutlet var data343: UIView!
    
    @IBOutlet var recordData: UITableView!
    @IBOutlet var sumCollection: UICollectionView!
    var recordList : [DataRecordVO] = [DataRecordVO]()
    
    let ad = UIApplication.shared.delegate as? AppDelegate
    
    var event : [DataRecordEvent] = [DataRecordEvent]()
    
    var atkList : [DataReportATK] = [DataReportATK]()
    var defList : [DataReportDEF] = [DataReportDEF]()
    var midList : [DataReportMID] = [DataReportMID]()
    var gkList : [DataReportGK] = [DataReportGK]()
    var subList : [DataReportSUB] = [DataReportSUB]()
    
    var numberForName : [Int:String] = [:]
    
    
    
    @IBOutlet var scrollVIew: UIScrollView!
    override func viewDidLoad(){
        recordData.delegate = self
        recordData.dataSource = self
        
        sumCollection.delegate = self
        sumCollection.dataSource = self

        
        let model = DataModel(self)
        model.getReport(schedule_id: gino(ad?.scheduleIdForStg))
        print(gino(ad?.scheduleIdForStg))
        

        
    }
    
    func networkResult(resultData: Any, code: String) {
        if code == "전술"{
            print("전술 조회")
            setGround(stg: resultData as! String)
            print( resultData as! String)
            
        }
        if code == "리포트플레이어공격"{
            atkList = resultData as! [DataReportATK]
            makeBakcNumberListATK()
            //            makeBakcNumberList()
        }
        if code == "리포트플레이어수비"{
            defList = resultData as! [DataReportDEF]
            makeBakcNumberListDEF()
            //            makeBakcNumberList()
        }
        
        if code == "리포트플레이어미드"{
            midList = resultData as! [DataReportMID]
            makeBakcNumberListMD()
            //            makeBakcNumberList()
        }
        
        if code == "리포트플레이어골키"{
            gkList = resultData as! [DataReportGK]
            makeBakcNumberListGK()
            //            makeBakcNumberList()
        }

        if code == "리포트이벤트"{
            event = resultData as! [DataRecordEvent]
            makeEvent()
        }
        if code == "리포트플레이어서브"{
            subList = resultData as! [DataReportSUB]
            makeBakcNumberListSUB()
            //            makeBakcNumberList()
        }
        
    }
    
    func makeBakcNumberListATK(){
        for i in 0...(atkList.count-1){
            print("인덱스1")
            numberForName[atkList[i].backnumber!] = atkList[i].username
        }
    }
    func makeBakcNumberListDEF(){
        
        for i in 0...(defList.count-1){
            print("인덱스2")
            numberForName[defList[i].backnumber!] = defList[i].username
        }
        
    }
    func makeBakcNumberListMD(){
        for i in 0...(midList.count-1){
            print("인덱스3")
            numberForName[midList[i].backnumber!] = midList[i].username
        }
        
    }
    func makeBakcNumberListGK(){
        for i in 0...(gkList.count-1){
            print("인덱스4")
            numberForName[gkList[i].backnumber!] = gkList[i].username
        }
        
    }
    func makeBakcNumberListSUB(){
        for i in 0...(subList.count-1){
            print("인덱스5")
            numberForName[subList[i].backnumber!] = subList[i].username
        }
    }
    func makeEvent(){
             //goal, assistm lost
        for i in 0...(event.count-1){
            //switch event[i]
            //해당 사항이 true이면 마크를 false
            print(event[i].type)

            switch gsno(event[i].type){
             case "score":
                let goal = DataRecordVO(goal: numberForName[gino(event[i].player_id)], assist: "", lost: "", goalMark : false, assistMark : true, lostMark : true)
                    recordList.append(goal)
            case "assist":
                    let goal = DataRecordVO(goal: numberForName[gino(event[i].player_id)], assist: numberForName[gino(event[i].player_id2)], lost: "", goalMark : false, assistMark : false, lostMark : true)
                    recordList.append(goal)
            default:
                        let goal = DataRecordVO(goal: "", assist: "", lost: "", goalMark : true, assistMark : true, lostMark : false)
                        recordList.append(goal)
       
            }
        }
        recordData.reloadData()
    }
    
    
    
    func setGround(stg : String){
        print("들어옴")
        switch stg{
        case "4-3-3":
            data433.isHidden = false
            data442.isHidden = true
            data343.isHidden = true
            data352.isHidden = true
            data451.isHidden = true
        case "4-4-2":
            data433.isHidden = true
            data442.isHidden = false
            data343.isHidden = true
            data352.isHidden = true
            data451.isHidden = true
        case "3-5-2":
            data433.isHidden = true
            data442.isHidden = true
            data343.isHidden = true
            data352.isHidden = false
            data451.isHidden = true
        case "4-5-1":
            data433.isHidden = true
            data442.isHidden = true
            data343.isHidden = true
            data352.isHidden = true
            data451.isHidden = false
        case "3-4-3":
            data433.isHidden = true
            data442.isHidden = true
            data343.isHidden = false
            data352.isHidden = true
            data451.isHidden = true
        default:
            data433.isHidden = true
            data442.isHidden = true
            data343.isHidden = true
            data352.isHidden = true
            data451.isHidden = true
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return subList.count
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = sumCollection.dequeueReusableCell(withReuseIdentifier: "DataDetailEntryCell", for: indexPath) as! DataDetailEntryCell
        
        cell.backNum.text = subList[indexPath.row].backnumber?.description
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
            //print(subList[indexPath.row].sub!)
        //후보 셀렉은 여기서
    }
    
//    
//    @IBAction func clickGoal(_ sender: Any) {
//        
//        let goal = DataRecordVO(goal: ad?.nowSelect?.description, assist: "", lost: "", goalMark : false, assistMark : true, lostMark : true)
//        recordList.append(goal)
//        scrollVIew.isScrollEnabled = true
//        recordData.reloadData()
//        self.clickType = 1
//        previousGoal = true
//    }
//    @IBAction func clickAssist(_ sender: Any) {
//        
//        if previousGoal == true{
//            let assist = DataRecordVO(goal: ad?.previousSelect?.description, assist: ad?.nowSelect?.description, lost: "", goalMark : false, assistMark : false, lostMark : true)
//            
//            recordList.removeLast()
//            recordList.append(assist)
//            scrollVIew.isScrollEnabled = true
//            recordData.reloadData()
//            self.clickType = 2
//            previousGoal = false
//        }
//        else{
//            simpleAlert(title: "득점 먼저 누르셈", message: "알간?")
//            
//        }
//        
//    }
//    @IBAction func clickLost(_ sender: Any) {
//        
//        let lost = DataRecordVO(goal: "", assist: "", lost: "실점", goalMark : true, assistMark : true, lostMark : false)
//        
//        recordList.append(lost)
//        scrollVIew.isScrollEnabled = true
//        recordData.reloadData()
//        self.clickType = 3
//        previousGoal = false
//    }
//    
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //return searchList.count
        return recordList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = recordData.dequeueReusableCell(withIdentifier: "DataRecordCell") as! DataRecordCell
        //해당 셀 이름과 클래스 명시
        let dataRecordVO = recordList[indexPath.row]
        //
        //
   
        cell.goal.text = gsno(dataRecordVO.goal)
        cell.assist.text = gsno(dataRecordVO.assist)
        cell.lost.text = gsno(dataRecordVO.lost)
        cell.goalMark.isHidden = dataRecordVO.goalMark!
        cell.assisMark.isHidden = dataRecordVO.assistMark!
        cell.lostMark.isHidden = dataRecordVO.lostMark!

        
        return cell
        
    }
    func simpleAlert(title:String, message msg:String){
        let alert = UIAlertController(title: title, message: msg, preferredStyle: .alert)
        let okAction = UIAlertAction(title:"확인", style:.default)
        let noAction = UIAlertAction(title:"아니오", style:.cancel)
        
        //var action : UIAlertAction
        //        let okAction = UIAlertAction(title:"확인",  style:.default) { (_) in self.performSegue(withIdentifier: "DataDetailEntry2", sender: self)}
        //옆동네에 줘야 하는 것 : 포지션 타입, 포지션 별 등번호
        
        
        
        alert.addAction(okAction)
        alert.addAction(noAction)
        
        present(alert, animated:true)
    }
    


    
    
}
