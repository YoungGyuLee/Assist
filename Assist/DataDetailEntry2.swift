//
//  DataDetailEntry2.swift
//  Assist
//
//  Created by 이영규 on 2017. 7. 1..
//  Copyright © 2017년 YG. All rights reserved.
//

import UIKit

class DataDetailEntry2 : UIViewController,UICollectionViewDataSource, UICollectionViewDelegate, UITableViewDelegate, UITableViewDataSource{
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
    
    let ad = UIApplication.shared.delegate as? AppDelegate
    
    @IBOutlet var scrollVIew: UIScrollView!
    override func viewDidLoad(){
        scrollVIew.isScrollEnabled = false
        
        recordData.delegate = self
        recordData.dataSource = self
        
        sumCollection.delegate = self
        sumCollection.dataSource = self
        
        self.setRecord = true
        
        subList.append(DetailEntrySubVO(sub : 1))
        subList.append(DetailEntrySubVO(sub : 3))
        subList.append(DetailEntrySubVO(sub : 5))
        subList.append(DetailEntrySubVO(sub : 7))
        subList.append(DetailEntrySubVO(sub : 9))
        subList.append(DetailEntrySubVO(sub : 1))
        subList.append(DetailEntrySubVO(sub : 13))
        subList.append(DetailEntrySubVO(sub : 15))
        subList.append(DetailEntrySubVO(sub : 17))
        subList.append(DetailEntrySubVO(sub : 19))
        subList.append(DetailEntrySubVO(sub : 21))
        subList.append(DetailEntrySubVO(sub : 23))
        subList.append(DetailEntrySubVO(sub : 25))
        subList.append(DetailEntrySubVO(sub : 27))
        
        setGround()
        
        ad?.setRecord = self.setRecord
    
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
        
        let goal = DataRecordVO(goal: ad?.nowSelect?.description, assist: "", lost: "", goalMark : false, assistMark : true, lostMark : true)
        recordList.append(goal)
        scrollVIew.isScrollEnabled = true
        recordData.reloadData()
        self.clickType = 1
        previousGoal = true
    }
    @IBAction func clickAssist(_ sender: Any) {
        
        if previousGoal == true{
        let assist = DataRecordVO(goal: ad?.previousSelect?.description, assist: ad?.nowSelect?.description, lost: "", goalMark : false, assistMark : false, lostMark : true)

        recordList.removeLast()
        recordList.append(assist)
        scrollVIew.isScrollEnabled = true
        recordData.reloadData()
        self.clickType = 2
        previousGoal = false
        }
        else{
            simpleAlert(title: "득점 먼저 누르셈", message: "알간?")
            
        }
        
    }
    @IBAction func clickLost(_ sender: Any) {
        
        let lost = DataRecordVO(goal: "", assist: "", lost: "실점", goalMark : true, assistMark : true, lostMark : false)

        recordList.append(lost)
        scrollVIew.isScrollEnabled = true
        recordData.reloadData()
        self.clickType = 3
        previousGoal = false
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
        cell.goal.text = dataRecordVO.goal
        cell.assist.text = dataRecordVO.assist
        cell.lost.text = dataRecordVO.lost
        cell.goalMark.isHidden = dataRecordVO.goalMark!
        cell.assisMark.isHidden = dataRecordVO.assistMark!
        cell.lostMark.isHidden = dataRecordVO.lostMark!
//
//        switch clickType {
//        case 1:
//            cell.goalMark.isHidden = false
//            cell.assisMark.isHidden = true
//            cell.lostMark.isHidden = true
//        case 2:
//            cell.goalMark.isHidden = false
//            cell.assisMark.isHidden = false
//            cell.lostMark.isHidden = true
//        case 3:
//            cell.goalMark.isHidden = true
//            cell.assisMark.isHidden = true
//            cell.lostMark.isHidden = false
//        default:
//            cell.goalMark.isHidden = true
//            cell.assisMark.isHidden = true
//            cell.lostMark.isHidden = true
//            
//        }
        
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
