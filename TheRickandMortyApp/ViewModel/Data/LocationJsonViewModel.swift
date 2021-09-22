//
//  LocationJsonViewModel.swift
//  TheRickandMortyApp
//
//  Created by Emin Hayal on 18.09.2021.
//

import Alamofire

protocol LocationJsonViewModelProtocol  {
    func fetchAllLocation()
    var delegate: LocationJsonViewModelOutput? { get set }
    var url: String { get set }
}
protocol LocationJsonViewModelOutput : AnyObject {
    func succes(items : [LocationResult])
}

class LocationJsonViewModel: LocationJsonViewModelProtocol {
    var delegate: LocationJsonViewModelOutput?
    var url: String = ServiceConstants.locationUrl
    var result : [LocationResult]?
    var response: Locations?
    //var reloadTableView: (() -> ())?
    
    func fetchAllLocation() {
        AF.request(url)
          .validate()
          .responseDecodable(of: Locations.self) { (response) in
            guard let location = response.value else  {return }
            //character.results[0].
            //character.results.forEach { result in
            //    result.
            //}
            self.response = location
            self.delegate?.succes(items: location.results)
            //self.reloadTableView?()
        
        }
    }
}
