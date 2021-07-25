//
//  CharacterVC.swift
//  TheRickandMortyApp
//
//  Created by Emin Hayal on 24.07.2021.
//

import UIKit

class CharacterVC: BaseVC {
    
    @IBOutlet weak var characterTableView: UITableView!
    
    let jsonTableView = JsonTableView()
    var viewModel = JsonViewModel()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        characterTableView.delegate = jsonTableView
        characterTableView.dataSource = jsonTableView
        jsonTableView.delegate = self
        characterTableView.register(MyTableViewCell.nibName, forCellReuseIdentifier: MyTableViewCell.identifier)
        viewModel.fetchAllCharacter()
        viewModel.reloadTableView = { [weak self] in
            guard let self = self else { return }
            self.jsonTableView.update(items: self.viewModel.response?.results ?? [])
            self.characterTableView.reloadData()
        }
    }
}

extension CharacterVC : JsonTableViewOutput {
    func onSelect(item: Result) {
        print(item.name ?? "")
    }
}
