//
//  LocationTableView.swift
//  TheRickandMortyApp
//
//  Created by Emin Hayal on 18.09.2021.
//

import UIKit


protocol LocationTableViewProtocol {
    func update( items : [LocationResult] )
}
protocol LocationTableViewOutput : AnyObject {
    func  onSelect( item : LocationResult )
    func getNewDatas(scrollView: UIScrollView)
}

final class LocationTableView: NSObject , UITableViewDelegate , UITableViewDataSource  {
    
    private lazy var items : [LocationResult] = []
    weak var delegate: LocationTableViewOutput?
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: LocationTableViewCell.identifier, for: indexPath) as! LocationTableViewCell
        cell.configureLocationData(data: items[indexPath.row])
        return cell //MyTableViewCell()
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        delegate?.onSelect(item: items[indexPath.row])
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 202
    }
    
    
}
extension LocationTableView : LocationTableViewProtocol{
    
    func update(items: [LocationResult]) {
        self.items = items
    }
    
    
}
