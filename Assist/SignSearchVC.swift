//
//  SignSearchVC.swift
//  Assist
//
//  Created by 이영규 on 2017. 6. 26..
//  Copyright © 2017년 YG. All rights reserved.
//

import Foundation
import UIKit

class SignSearchVC : UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet var back: UINavigationItem!
    //var navBar: UINavigationBar = UINavigationBar()

    @IBOutlet var searchTable: UITableView!
    var searchList : [SearchVO] = [SearchVO]()
    
    
    func goback(){
        
        navigationController?.popViewController(animated: true)
    }
    @IBAction func searchBtn(_ sender: Any) {
        initData()
    }
    
    func initData(){
//        let infoVO = CellVO(name: name, campus: campus, part: part, partImg: "develop")
        let string1 = "아아"
        let string2 = "성남시"
        let string3 = "이영규"
        
        
        let data1 = SearchVO(teamName: string1, plcaeName: string2, coachName: string3)
        
//        let data2 = SearchVO(teamName: "아아1", plcaeName: "서울시", coachName: "이영규1")
//        
//        let data3 = SearchVO(teamName: "아아2", plcaeName: "부산시", coachName: "이영규2")
        searchList.append(data1)
        //searchList.append(data2)
        //searchList.append(data3)
        print("테이블 다 들어감")
        searchTable.isHidden = false
        searchTable.reloadData()
        
    }

    
    override func viewDidLoad() {
        
        
        //initData()
        searchTable.isHidden = true
        searchTable.delegate = self
        searchTable.dataSource = self
        print("테이블 이제 시작")
       // initData()
        
        
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return searchList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = searchTable.dequeueReusableCell(withIdentifier: "SearchCell") as! SearchCell
        //해당 셀 이름과 클래스 명시
        let searchVO = searchList[indexPath.row]
        
        
        cell.teamName.text = searchVO.teamName
        cell.placeName.text = searchVO.plcaeName
        cell.coachName.text = searchVO.coachName
        
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let searchVO = searchList[indexPath.row]
        //infoVO는 테이블(infoList)에서 row번 째 인덱스
        
        guard let dvc = storyboard?.instantiateViewController(withIdentifier: "SignSearchDetail") as? SignSearchDetail else {return}
        
        
        
        dvc.place = searchVO.plcaeName
        dvc.coach = searchVO.coachName
        dvc.team = searchVO.teamName
        
      //  place = searchVO.plcaeName
//        
        
//        dvc.name = infoVO.name//dvc는 DetailVC
//        dvc.campus = infoVO.campus
//        dvc.image = UIImage(named: infoVO.partImg!)//이미지를 통으로 넘김(String형식으로)
        
        navigationController?.present(dvc, animated:false, completion:{})
        searchTable.deselectRow(at: indexPath, animated: false)
        //navigationController?.pushViewController(dvc, animated: false)

        //UImage(named : `)
        
        
    }
    
    
}
