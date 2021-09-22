//
//  LocationTableViewCell.swift
//  TheRickandMortyApp
//
//  Created by Emin Hayal on 18.09.2021.
//

import UIKit

class LocationTableViewCell: UITableViewCell {
    @IBOutlet weak var deneme: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func configureLocationData(data : LocationResult){
        print(data)
        deneme.text = data.name
        //TODO: Configure data
    }
}

extension LocationTableViewCell {
    static var identifier: String {
        return String(describing: self)
    }
    
    static var nibName: UINib {
        return UINib(nibName: identifier, bundle: nil)
    }
}
