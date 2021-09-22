//
//  MainViewController.swift
//  TheRickandMortyApp
//
//  Created by Emin Hayal on 24.07.2021.
//

import Alamofire

protocol JsonViewModelProtocol  {
    func fetchAllCharacter()
    func getAnotherCharacters()
    var delegate: JsonViewModelOutput? { get set }
    var url: String { get set }
}

protocol JsonViewModelOutput : AnyObject {
    func succes(items : [Result])
}
class JsonViewModel: JsonViewModelProtocol {
    func getAnotherCharacters() {
        if isStarted {
            return
        }
        isStarted = true
        AF.request(response?.info?.next ?? "")
              .validate()
              .responseDecodable(of: Character.self) { (response) in
                guard let character = response.value else  { return }
                  character.results.forEach { oneCharacter in
                      self.response?.results.append(oneCharacter)
                  }
                  self.isStarted = false
                  self.response?.info?.next = character.info?.next ?? ""
                  self.delegate?.succes(items: self.response?.results ?? [])
            }
    }
    
    var url: String = ServiceConstants.characterUrl
    var isStarted = false
    
    var result : [Result]?
    var response: Character?
    //var reloadTableView: (() -> ())?
    
    var delegate : JsonViewModelOutput?
    
    func fetchAllCharacter() {
        AF.request(url)
          .validate()
          .responseDecodable(of: Character.self) { (response) in
            guard let character = response.value else  {return }
            //character.results[0].
            //character.results.forEach { result in
            //    result.
            //}
            
            self.response = character
            self.delegate?.succes(items: character.results)
            //self.reloadTableView?()
        
        }
    }
}
