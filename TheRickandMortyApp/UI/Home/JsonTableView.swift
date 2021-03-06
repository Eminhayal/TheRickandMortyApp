//
//  JsonTableView.swift
//  TheRickandMortyApp
//
//  Created by Emin Hayal on 25.07.2021.
//

import UIKit


protocol JsonTableViewProtocol {
    func update( items : [Result] )
}
protocol JsonTableViewOutput : AnyObject {
    func  onSelect( item : Result )
    
    func getNewDatas()
}

final class JsonTableView: NSObject , UITableViewDelegate , UITableViewDataSource  {
    private lazy var items : [Result] = []
    private lazy var firstLocation : [ResultEpisode] = []
    weak var delegate:JsonTableViewOutput?
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: MyTableViewCell.identifier, for: indexPath) as! MyTableViewCell
        cell.configure(data: items[indexPath.row] )
        if  (Double(indexPath.row) * 100) / (100 * Double(items.count)) > 0.8 {
            delegate?.getNewDatas()
        }
        return cell //MyTableViewCell()
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        delegate?.onSelect(item: items[indexPath.row])
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 180
    }
    
    
}
extension JsonTableView : JsonTableViewProtocol{
    
  
    func update(items: [Result]) {
        self.items = items
    }
    
    
}
