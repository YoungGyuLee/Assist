//
//  DataDetailEntry2.swift
//  Assist
//
//  Created by 이영규 on 2017. 7. 1..
//  Copyright © 2017년 YG. All rights reserved.
//

import UIKit

class DataDetailEntry2 : UIViewController,UICollectionViewDataSource, UICollectionViewDelegate, UITableViewDelegate, UITableViewDataSource, NetworkCallback{
    @IBOutlet var data343: UIView!
    
    @IBOutlet var data433: UIView!

    @IBOutlet var data442: UIView!
    
    @IBOutlet var data451: UIView!
    
    @IBOutlet var data352: UIView!
    
    var setRecord : Bool = false
    
    var clickType : Int = 0
    
    var previousGoal : Bool = false
    
    @IBOutlet var recordData: UITableView!
    @IBOutlet var sumCollection: UICollectionView!
    var subList : [DetailEntrySubVO] = [DetailEntrySubVO]()
    var recordList : [DataRecordVO] = [DataRecordVO]()
    
    var recordPost : [DataRecordPostVO] = [DataRecordPostVO]()
    
    let ad = UIApplication.shared.delegate as? AppDelegate
    var sub : [Int] = []
    
    var allPlayerID : [Int] = []
    
    @IBOutlet var scrollVIew: UIScrollView!
    override func viewDidLoad(){
        scrollVIew.isScrollEnabled = false
        
        recordData.delegate = self
        recordData.dataSource = self
        
        sumCollection.delegate = self
        sumCollection.dataSource = self
        
        //self.setRecord = true
        if ad?.memberSubList?.count == 0{
            for i in 0...((ad?.memberSubList?.count)!-1){
                subList.append(DetailEntrySubVO(sub:ad?.memberSubList?[i]))
            }
        }
        //self.allPlayerID = (ad?.memberIdList)!
        //self.allPlayerID.append(contentsOf: (ad?.memberSubId)!)
        
        
        
        print(ad?.memList)
        setGround()
        
        //ad?.setRecord = self.setRecord
    
    }
    func setGround(){
        switch ad?.curStg{
            case "433"?:
                data433.isHidden = false
                data442.isHidden = true
                data343.isHidden = true
                data352.isHidden = true
                data451.isHidden = true
            case "442"?:
                data433.isHidden = true
                data442.isHidden = false
                data343.isHidden = true
                data352.isHidden = true
                data451.isHidden = true
            case "352"?:
                data433.isHidden = true
                data442.isHidden = true
                data343.isHidden = true
                data352.isHidden = false
                data451.isHidden = true
            case "451"?:
                data433.isHidden = true
                data442.isHidden = true
                data343.isHidden = true
                data352.isHidden = true
                data451.isHidden = false
            case "343"?:
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

        cell.backNum.text = subList[indexPath.row].sub?.description
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print(subList[indexPath.row].sub!)
        //후보 셀렉은 여기서
    }
    
    
    @IBAction func clickGoal(_ sender: Any) {
        
        //셀렉트에 넣어야 할 것이 플레이어 아이디.
        let goal = DataRecordVO(goal: gsno(ad?.memberListString?[gino(ad?.nowSelect)]), assist: "", lost: "", goalMark : false, assistMark : true, lostMark : true)
        recordList.append(goal)
        scrollVIew.isScrollEnabled = true
        recordData.reloadData()
        self.clickType = 1
        previousGoal = true
        //플레이어 아이디를 넣어야 함.
        recordPost.append(DataRecordPostVO(type: "score", player_id: gino(ad?.memberIdList?[gino(ad?.nowSelect)])))
        print("골-골 \(gino(ad?.memberIdList?[gino(ad?.nowSelect)]))")
        
    }
    @IBAction func clickAssist(_ sender: Any) {
        
        if previousGoal == true{
        let assist = DataRecordVO(goal: gsno(ad?.memberListString?[gino(ad?.previousSelect)]) , assist: gsno(ad?.memberListString?[gino(ad?.nowSelect)]), lost: "", goalMark : false, assistMark : false, lostMark : true)

            print("이름")
            print(gsno(ad?.previousName))
            
            
        recordList.removeLast()
        recordList.append(assist)
        scrollVIew.isScrollEnabled = true
        recordData.reloadData()
        self.clickType = 2
        previousGoal = false
        recordPost.append(DataRecordPostVO(type: "assist", player_id: gino(ad?.memberIdList?[gino(ad?.nowSelect)])))
        }
        else{
            simpleAlert1(title: "득점 먼저 누르셈", message: "알간?")
            
        }
        print("골-어시스트 \(gino(ad?.memberIdList?[gino(ad?.nowSelect)]))")
    }
    @IBAction func clickLost(_ sender: Any) {
        
        let lost = DataRecordVO(goal: "", assist: "", lost: "실점", goalMark : true, assistMark : true, lostMark : false)

        recordList.append(lost)
        scrollVIew.isScrollEnabled = true
        recordData.reloadData()
        self.clickType = 3
        previousGoal = false
        recordPost.append(DataRecordPostVO(type: "score_against",player_id: -1))
    }
    
    
    
    
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
//            
//        }
        
        return cell
        
    }
    @IBAction func clickComplete(_ sender: Any) {
        simpleAlert(title: "끝", message: "레알?")
        
    }
    
    func simpleAlert1(title:String, message msg:String){
        let alert = UIAlertController(title: title, message: msg, preferredStyle: .alert)
        let okAction = UIAlertAction(title:"확인", style:.default)
        
        let noAction = UIAlertAction(title:"아니오", style:.cancel)

        alert.addAction(okAction)
        alert.addAction(noAction)
        
        present(alert, animated:true)
    }
    
    
    func simpleAlert(title:String, message msg:String){
        let alert = UIAlertController(title: title, message: msg, preferredStyle: .alert)
        let okAction = UIAlertAction(title:"확인", style:.default){(_) in self.next()
        }
        let noAction = UIAlertAction(title:"아니오", style:.cancel)
        
        //var action : UIAlertAction
//        let okAction = UIAlertAction(title:"확인",  style:.default) { (_) in self.performSegue(withIdentifier: "DataDetailEntry2", sender: self)}
        //옆동네에 줘야 하는 것 : 포지션 타입, 포지션 별 등번호
        alert.addAction(okAction)
        alert.addAction(noAction)
        
        present(alert, animated:true)
    }
    
    func networkResult(resultData: Any, code: String) {
        if code == "경기등록"{
//            rankList = resultData as! [RankVO]
//            
//            //boardListTable.reloadData()
//            rankTable.reloadData()
            print("뭔가 되긴 됨")
            
            ad?.memList = []
            guard let entry = storyboard?.instantiateViewController(withIdentifier: "DataRecordVC") as? DataRecordVC else {return}
            navigationController?.present(entry, animated:true, completion:{})
            //여기서 모든 애들 초기화.
        }
        
    }
    
    func next(){
        print("다음 누름")
        let model = DataModel(self)
        //subList.
        //var sendMemLsit : [Int]
//        for i in 0...(subList.count-1){
//            print("등록1")
//            ad?.memList?.append(gino(subList[i].sub))
////                = gino(subList[i].sub)
////            //print(ad?.memList?[i])
////            sub.append(gino(subList[i].sub))
//        }
        //print(gino(ad?.scheduleIdForStg))
        //print(gsno("4-3-3"))
        //print((ad?.memList)!)
       // print(recordPost)
        model.addReport(schedule_id: gino(ad?.scheduleIdForStg), tactic: gsno("4-3-3"), player_id: (ad?.memberIdList)!, eventTemp: recordPost)
        print("등록2")
        
    }
    
    
    
}
