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
    func getNewDatas(scrollView: UIScrollView)
}

final class JsonTableView: NSObject , UITableViewDelegate , UITableViewDataSource  {
    private lazy var items : [Result] = []
   
    weak var delegate:JsonTableViewOutput?
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: MyTableViewCell.identifier, for: indexPath) as! MyTableViewCell
        cell.configure(data: items[indexPath.row])
        return cell //MyTableViewCell()
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        delegate?.onSelect(item: items[indexPath.row])
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 202
    }
    
    
}
extension JsonTableView : JsonTableViewProtocol{
    
    func update(items: [Result]) {
        self.items = items
    }
    
    
}
