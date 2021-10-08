//
//  LocationJsonViewModel.swift
//  TheRickandMortyApp
//
//  Created by Emin Hayal on 18.09.2021.
//

import Alamofire

protocol LocationJsonViewModelProtocol  {
    func fetchAllLocation()
    func getAnotherLocation()
    var delegate: LocationJsonViewModelOutput? { get set }
    var url: String { get set }
}
protocol LocationJsonViewModelOutput : AnyObject {
    func succes(items : [LocationResult])
}

class LocationJsonViewModel: LocationJsonViewModelProtocol {
    
    var isStarted = false
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
    func getAnotherLocation() {
        if isStarted {
            return
        }
        isStarted = true
        AF.request(response?.info.next ?? "")
              .validate()
              .responseDecodable(of: Locations.self) { (response) in
                  guard let location = response.value else  { return }
                    location.results.forEach { oneLocation in
                        self.response?.results.append(oneLocation)
                        
                    }
                    self.isStarted = false
                    self.response?.info.next = location.info.next
                    self.delegate?.succes(items: self.response?.results ?? [])
            }
    }
}
