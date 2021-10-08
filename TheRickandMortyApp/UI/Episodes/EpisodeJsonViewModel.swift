//
//  EpisodeJsonViewModel.swift
//  TheRickandMortyApp
//
//  Created by Emin Hayal on 12.09.2021.
//

import Alamofire

protocol EpisodeJsonViewModelProtocol  {
    func fetchAllEpisode()
    func getAnotherEpisode()
    var delegate: EpisodeJsonViewModelOutput? { get set }
    var url: String { get set }
}
protocol EpisodeJsonViewModelOutput : AnyObject {
    func succes(items : [ResultEpisode])
}

class EpisodeJsonViewModel: EpisodeJsonViewModelProtocol {
    func getAnotherEpisode() {
        if isStarted {
            return
        }
        isStarted = true
        AF.request(response?.info.next ?? "")
              .validate()
              .responseDecodable(of: Episode.self) { (response) in
                  guard let episode = response.value else  { return }
                    episode.results.forEach { oneEpisode in
                        self.response?.results.append(oneEpisode)
                    }
                    self.isStarted = false
                    self.response?.info.next = episode.info.next
                    self.delegate?.succes(items: self.response?.results ?? [])
            }
    }
    
   
    var isStarted = false
    var url: String = ServiceConstants.episodeUrl
    var result : [ResultEpisode]?
    var response: Episode?
    //var reloadTableView: (() -> ())?
    
    var delegate : EpisodeJsonViewModelOutput?
    
    func fetchAllEpisode() {
        AF.request(url)
          .validate()
          .responseDecodable(of: Episode.self) { (response) in
            guard let episode = response.value else  {return }
            //character.results[0].
            //character.results.forEach { result in
            //    result.
            //}
            
            self.response = episode
            self.delegate?.succes(items: episode.results)
            //self.reloadTableView?()
        
        }
    }
}
