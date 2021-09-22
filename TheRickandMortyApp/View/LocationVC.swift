//
//  LocationVC.swift
//  TheRickandMortyApp
//
//  Created by Emin Hayal on 24.07.2021.
//

import UIKit

class LocationVC: BaseVC, LocationJsonViewModelOutput {
    
    @IBOutlet weak var locationTableViewShow: UITableView!
    
    let locationTableView = LocationTableView()
    var viewModel : LocationJsonViewModelProtocol = LocationJsonViewModel()
    var viewModelx: EpisodeJsonViewModelProtocol = EpisodeJsonViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        locationTableViewShow.delegate =  locationTableView
        locationTableViewShow.dataSource = locationTableView
        
        locationTableView.delegate = self
        viewModel.delegate = self
        locationTableViewShow.register(LocationTableViewCell.nibName, forCellReuseIdentifier: LocationTableViewCell.identifier)
        viewModel.fetchAllLocation()
        navigationController?.navigationBar.isHidden = true
        
    }

}

extension LocationVC : LocationTableViewOutput{
    func onSelect(item: LocationResult) {
        //
    }
    
    
    func succes(items: [LocationResult]) {
        locationTableView.update(items: items)
        locationTableViewShow.reloadData()
    }
    
    func getNewDatas(scrollView: UIScrollView) {

    }
}
