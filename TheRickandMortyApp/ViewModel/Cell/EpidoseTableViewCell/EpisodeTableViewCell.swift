//
//  EpidoseTableViewCell.swift
//  TheRickandMortyApp
//
//  Created by Emin Hayal on 12.09.2021.
//

import UIKit

class EpisodeTableViewCell: UITableViewCell {

    @IBOutlet weak var deneme: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }


    func configure(data : ResultEpisode){
        deneme.text = data.episode
        print(data)
    }
    
    
}

extension EpisodeTableViewCell {
    static var identifier: String {
        return String(describing: self)
    }
    
    static var nibName: UINib {
        return UINib(nibName: identifier, bundle: nil)
    }
}
