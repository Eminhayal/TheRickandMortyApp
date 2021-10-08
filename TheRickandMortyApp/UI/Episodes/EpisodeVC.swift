//
//  EpisodeVC.swift
//  TheRickandMortyApp
//
//  Created by Emin Hayal on 14.09.2021.
//

import UIKit

class EpisodeVC: BaseVC  {
    

    @IBOutlet weak var episodeShowTableView: UITableView!
    
    let episodeTView = EpisodeTableView()
    
    var viewModel: EpisodeJsonViewModelProtocol = EpisodeJsonViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
                
        episodeShowTableView.delegate = episodeTView
        episodeShowTableView.dataSource = episodeTView
        
        episodeTView.delegate = self
        
        viewModel.delegate = self
        
        episodeShowTableView.register(EpisodeTableViewCell.nibName, forCellReuseIdentifier: EpisodeTableViewCell.identifier)
        viewModel.fetchAllEpisode()
        self.tabBarItem.selectedImage = tabBarItem.selectedImage?.withRenderingMode(.alwaysOriginal)
        self.tabBarItem.image = tabBarItem.image?.withRenderingMode(.automatic)
        navigationController?.navigationBar.isHidden = true
        
        
    }
      
}

extension EpisodeVC : EpisodeJsonTableViewOutput{
    func onSelect(item: ResultEpisode) {
        print(item.episode)
        // TODO:on select detail vc
        
    }
    
    func getNewDatas() {
        viewModel.getAnotherEpisode()
    }
}

extension EpisodeVC: EpisodeJsonViewModelOutput{
    func succes(items: [ResultEpisode]) {
        SwiftSpinner.show("Yükleniyor")
        episodeTView.update(items: items)
        episodeShowTableView.reloadData()
        SwiftSpinner.hide()
        
    }
    
    
    
    
}
