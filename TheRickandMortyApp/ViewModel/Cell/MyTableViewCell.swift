//
//  MyTableViewCell.swift
//  TheRickandMortyApp
//
//  Created by Emin Hayal on 24.07.2021.
//

import UIKit

class MyTableViewCell: UITableViewCell {
    
    @IBOutlet weak var characterImage: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    override func awakeFromNib() {
            super.awakeFromNib()
            // Initialization code
        }
        
    func configure(data: Result){
        nameLabel.text = data.name
        characterImage.load(url: URL(string: data.image ?? "")!)
        }
    }

    extension MyTableViewCell {
        static var identifier: String {
            return String(describing: self)
        }
        
        static var nibName: UINib {
            return UINib(nibName: identifier, bundle: nil)
        }
    }


