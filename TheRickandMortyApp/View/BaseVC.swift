//
//  BaseVC.swift
//  TheRickandMortyApp
//
//  Created by Emin Hayal on 24.07.2021.
//

import UIKit

class BaseVC: UIViewController {
    
    let titleName = "Konumlar"
    let myAttribute = [ NSAttributedString.Key.font: UIFont(name: "Chalkduster", size: 16.0)! ]
   
    override func viewDidLoad() {
        super.viewDidLoad()
        tabBarItem.selectedImage = tabBarItem.selectedImage?.withRenderingMode(.alwaysOriginal)
        tabBarItem.image = tabBarItem.image?.withRenderingMode(.automatic)
        
        let myAttrString = NSAttributedString(string: titleName , attributes: myAttribute)
        tabBarItem.setTitleTextAttributes(myAttribute , for: .normal)
    }
    
    
}
// attribute string
//
