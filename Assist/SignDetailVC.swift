//
//  SignDetailVC.swift
//  Assist
//
//  Created by 이영규 on 2017. 6. 26..
//  Copyright © 2017년 YG. All rights reserved.
//

import Foundation
import UIKit

class SignDetailVC : UIViewController{
    
    
    
    
    
    @IBAction func toSignSearch(_ sender: Any) {
        guard let signTab = storyboard?.instantiateViewController(withIdentifier: "SignTabVC") as? SignTab else {return}
        //navigationController?.present(signSearch, animated: true, completion: {})
        navigationController?.pushViewController(signTab, animated: true)
    }
    
    
}
