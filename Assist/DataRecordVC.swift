//
//  DataRecordVC.swift
//  Assist
//
//  Created by 이영규 on 2017. 6. 29..
//  Copyright © 2017년 YG. All rights reserved.
//

import Foundation

import UIKit

class DataRecordVC : UIViewController{
    
    @IBAction func temp(_ sender: Any) {
        guard let entry = storyboard?.instantiateViewController(withIdentifier: "DataDetailEntry") as? DataDetailEntry else {return}
        
        
        
        //  place = searchVO.plcaeName
        //
        
        //        dvc.name = infoVO.name//dvc는 DetailVC
        //        dvc.campus = infoVO.campus
        //        dvc.image = UIImage(named: infoVO.partImg!)//이미지를 통으로 넘김(String형식으로)
        
        navigationController?.present(entry, animated:false, completion:{})
        //navigationController?.pushViewController(entry, animated: true)
    }
    
    
}
