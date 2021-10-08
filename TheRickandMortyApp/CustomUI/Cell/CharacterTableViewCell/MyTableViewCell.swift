//
//  MyTableViewCell.swift
//  TheRickandMortyApp
//
//  Created by Emin Hayal on 24.07.2021.
//

import UIKit

class MyTableViewCell: UITableViewCell {
    
    @IBOutlet weak var statusCircleImage: UIImageView!
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var epidoseLocationLabel: UILabel!
    @IBOutlet weak var statusLabel: UILabel!
    @IBOutlet weak var characterImage: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    override func awakeFromNib() {
            super.awakeFromNib()
            // Initialization code
        }
        
    func configure(data: Result){
        nameLabel.text = data.name
        statusLabel.text = data.status + "-" + data.species
        locationLabel.text = data.location.name
        //epidoseLocationLabel.text = data.episode?.first
        characterImage.load(url: URL(string: data.image ?? "")!)
        
        if data.status == "Alive" {
            statusCircleImage.image = UIImage(named: "alive")
        }else if data.status == "Dead"{
            statusCircleImage.image = UIImage(named: "death")
        }else{
            statusCircleImage.image = UIImage(named: "Unknow")
        }
        
        
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


