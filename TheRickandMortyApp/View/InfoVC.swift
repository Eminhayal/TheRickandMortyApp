//
//  InfoVC.swift
//  TheRickandMortyApp
//
//  Created by Emin Hayal on 24.07.2021.
//

import UIKit

class InfoVC: BaseVC {

   
    @IBOutlet weak var linkedin: UIImageView!
    @IBOutlet weak var github: UIImageView!
    @IBOutlet weak var image: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()

    let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(imageTapped(tapGestureRecognizer:)))
    github.isUserInteractionEnabled = true
    github.addGestureRecognizer(tapGestureRecognizer)
    linkedin.isUserInteractionEnabled = true
    linkedin.addGestureRecognizer(tapGestureRecognizer)
        
    }
    
    
    @objc func imageTapped(tapGestureRecognizer: UITapGestureRecognizer)
    {
        let tappedImage = tapGestureRecognizer.view as! UIImageView

        if let url = URL(string: "https://github.com/Eminhayal") {
            UIApplication.shared.open(url)
        }
        if let url = URL(string: "https://www.linkedin.com/in/emin-hayal-779573151/") {
            UIApplication.shared.open(url)
        }
    }
    
    func imageUrl(imageView : UIImageView){
        
    }
}
