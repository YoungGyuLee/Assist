//
//  SignTemp.swift
//  Assist
//
//  Created by 이영규 on 2017. 6. 27..
//  Copyright © 2017년 YG. All rights reserved.
//

import Foundation
import UIKit

class SignTemp : UIViewController{
    override func viewDidLoad() {
        self.navigationController?.isNavigationBarHidden = true
    }
    override func viewWillAppear(_ animated: Bool) {
//        print("comeTOHere")
//        guard let signDetail = storyboard?.instantiateViewController(withIdentifier: "SignDetailVC") as? SignDetailVC else {return}
//        //navigationController?.present(signSearch, animated: true, completion: {})
//        self.present(signDetail, animated: true, completion: {})
        //navigationController?.popViewController(animated: true)
        
         dismiss(animated: true, completion: {})
        
    }
    
    
    
}
