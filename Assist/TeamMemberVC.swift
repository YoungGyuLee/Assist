//
//  TeamMemberVC.swift
//  Assist
//
//  Created by 이영규 on 2017. 6. 28..
//  Copyright © 2017년 YG. All rights reserved.
//

import Foundation
import UIKit

class TeamMemeberVC : UIViewController, UITableViewDelegate, UITableViewDataSource{
    
    @IBOutlet var entryMemTable: UITableView!
    
    var entryList : [TeamEntryVO] = [TeamEntryVO]()
    
    @IBOutlet var listView: UIView!
    //var place_data = ["서울시", "성남시", "제네바", "오타와", "레이캬비크"]
    
    override func viewDidLoad() {
        entryMemTable.isHidden = true
        entryMemTable.delegate = self
        entryMemTable.dataSource = self
        //entryMemTable.datasource = self
    
    }
    
    @IBAction func addEntry(_ sender: Any) {
        let entry = "이영규"
        let data1 = TeamEntryVO(entryName: entry)
     
        entryList.append(data1)
        //searchList.append(data2)
        //searchList.append(data3)
        entryMemTable.isHidden = false
        entryMemTable.reloadData()

        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return entryList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = entryMemTable.dequeueReusableCell(withIdentifier: "TeamEntryCell") as! TeamEntryCell
        //해당 셀 이름과 클래스 명시
        let searchVO = entryList[indexPath.row]
        
        cell.entryName.text = searchVO.entryName
        
        //listView.frame.height = (listView.frame.height + entryMemTable.frame.height)
        //listView.frame.height.add(entryMemTable.frame.height)
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
       // let searchVO = searchList[indexPath.row]
//        //infoVO는 테이블(infoList)에서 row번 째 인덱스
//        
//        guard let dvc = storyboard?.instantiateViewController(withIdentifier: "SignSearchDetail") as? SignSearchDetail else {return}
//        
//        
//        
//        dvc.place = searchVO.plcaeName
//        dvc.coach = searchVO.coachName
//        dvc.team = searchVO.teamName
//        
//        
//        //  place = searchVO.plcaeName
//        //
//        
//        //        dvc.name = infoVO.name//dvc는 DetailVC
//        //        dvc.campus = infoVO.campus
//        //        dvc.image = UIImage(named: infoVO.partImg!)//이미지를 통으로 넘김(String형식으로)
//        
//        navigationController?.present(dvc, animated:false, completion:{})
//        searchTable.deselectRow(at: indexPath, animated: false)
//        //navigationController?.pushViewController(dvc, animated: false)
//        
//        //UImage(named : `)
//        
//        
    }
    
    
    
}
