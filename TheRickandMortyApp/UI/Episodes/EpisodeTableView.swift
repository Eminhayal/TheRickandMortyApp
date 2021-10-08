//
//  File.swift
//  TheRickandMortyApp
//
//  Created by Emin Hayal on 12.09.2021.
//

import UIKit


protocol EpisodeJsonTableViewProtocol {
    func update( items : [ResultEpisode] )
}
protocol EpisodeJsonTableViewOutput : AnyObject {
    func  onSelect( item : ResultEpisode )
    func getNewDatas()
}

final class EpisodeTableView : NSObject , UITableViewDelegate , UITableViewDataSource{
    
    private lazy var items : [ResultEpisode] = []
    weak var delegate:EpisodeJsonTableViewOutput?
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       let cell = tableView.dequeueReusableCell(withIdentifier: EpisodeTableViewCell.identifier, for: indexPath) as! EpisodeTableViewCell
        cell.configure(data: items[indexPath.row])
        if  (Double(indexPath.row) * 100) / (100 * Double(items.count)) > 0.8 {
            delegate?.getNewDatas()
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        delegate?.onSelect(item: items[indexPath.row])
        
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 140
    }
}

extension EpisodeTableView : EpisodeJsonTableViewProtocol {
    func update(items: [ResultEpisode]) {
        self.items = items
    }
    
    
}
