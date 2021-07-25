//
//  MainViewController.swift
//  TheRickandMortyApp
//
//  Created by Emin Hayal on 24.07.2021.
//

import Alamofire

protocol JsonViewModelProtocol  {
    func fetchAllCharacter(onSucces: ([Result]) -> Void , onFail: (String?) -> Void )
    func success()
}

class JsonViewModel {
    
    var result : [Result]?
    var response: Character?
    var reloadTableView: (() -> ())?
    
    func fetchAllCharacter() {
        AF.request(ServiceConstants.locationUrl)
          .validate()
          .responseDecodable(of: Character.self) { (response) in
            guard let character = response.value else  {return }
            //character.results[0].
            //character.results.forEach { result in
            //    result.
            //}
            
            self.response = character
            self.reloadTableView?()
        
        }
    }
}
