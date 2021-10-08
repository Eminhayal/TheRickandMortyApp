//
//  CharacterVC.swift
//  TheRickandMortyApp
//
//  Created by Emin Hayal on 24.07.2021.
//

import UIKit

class CharacterVC: BaseVC {
    
    @IBOutlet weak var characterTableView: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    
    let jsonTableView = JsonTableView()
    var viewModel = JsonViewModel()
    let toDetailVM = ToDetailViewModel()

    override func viewDidLoad() {
        
        super.viewDidLoad()
        SwiftSpinner.show("Yükleniyor")
        characterTableView.delegate = jsonTableView
        characterTableView.dataSource = jsonTableView
        searchBar.delegate = self
        jsonTableView.delegate = self
        viewModel.delegate = self
        characterTableView.register(MyTableViewCell.nibName, forCellReuseIdentifier: MyTableViewCell.identifier)
        viewModel.fetchAllCharacter()
        navigationController?.navigationBar.isHidden = true
    }
}

extension CharacterVC : JsonTableViewOutput {
    func getNewDatas() {
        viewModel.getAnotherCharacters()
    }
    
    func onSelect(item: Result) {
        print(item.id)
        let detailVC = toDetailVC.instantiate(storyboard: .detail, bundle: nil, identifier: nil)
        self.toDetailVM.getItem(item: item)
        detailVC.toDetailVM = toDetailVM
        self.navigationController?.pushViewController(detailVC, animated: true)
    }
}

extension CharacterVC : JsonViewModelOutput{
    func succes(items: [Result]) {
        jsonTableView.update(items: items)
        characterTableView.reloadData()
        SwiftSpinner.hide()
    }
}

extension CharacterVC : ToDetailProtocol{
    func didTapMenuButton() {
    }
}

extension CharacterVC : UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        viewModel.search(text: searchText)
    }
}
