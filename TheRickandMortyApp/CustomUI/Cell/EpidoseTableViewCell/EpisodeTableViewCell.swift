//
//  EpidoseTableViewCell.swift
//  TheRickandMortyApp
//
//  Created by Emin Hayal on 12.09.2021.
//

import UIKit

class EpisodeTableViewCell: UITableViewCell {

    @IBOutlet weak var airDateLabel: UILabel!
    @IBOutlet weak var seasonLabel: UILabel!
    @IBOutlet weak var episodeLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }


    func configure(data : ResultEpisode){
        episodeLabel.text = data.name
        seasonLabel.text = data.episode
        airDateLabel.text = data.airDate
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
