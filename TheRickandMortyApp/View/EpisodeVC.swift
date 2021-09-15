//
//  EpisodeVC.swift
//  TheRickandMortyApp
//
//  Created by Emin Hayal on 14.09.2021.
//

import UIKit

class EpisodeVC: BaseVC  {
    
    @IBOutlet weak var episodeTV: UITableView!
    
    let episodeTView = EpisodeTableView()
    var viewModel: EpisodeJsonViewModelProtocol = EpisodeJsonViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
                
        episodeTV.delegate = episodeTView
        episodeTV.dataSource = episodeTView
        
        episodeTView.delegate = self
        
        viewModel.delegate = self
        
        episodeTV.register(EpisodeTableViewCell.nibName, forCellReuseIdentifier: EpisodeTableViewCell.identifier)
        viewModel.fetchAllEpisode()
        
        navigationController?.navigationBar.isHidden = true
        
    }
        
}

extension EpisodeVC : EpisodeJsonTableViewOutput{
    func onSelect(item: ResultEpisode) {
        print(item.episode)
        // TODO:on select detail vc
        
    }
    
    func getNewDatas(scrollView: UIScrollView) {
        
    }
}

extension EpisodeVC: EpisodeJsonViewModelOutput{
    func succes(items: [ResultEpisode]) {
        episodeTView.update(items: items)
        episodeTV.reloadData()
        
    }
    
    
    
    
}
