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
    var viewModel: JsonViewModelProtocol = JsonViewModel()
    
    let detailVC = toDetailVC.instantiate(storyboard: .toDetailVC, bundle: nil, identifier: nil)
    let toDetailVM = ToDetailViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        characterTableView.delegate = jsonTableView
        characterTableView.dataSource = jsonTableView
        jsonTableView.delegate = self
        viewModel.delegate = self
        characterTableView.register(MyTableViewCell.nibName, forCellReuseIdentifier: MyTableViewCell.identifier)
        viewModel.fetchAllCharacter()
        /* viewModel.reloadTableView = { [weak self] in
            guard let self = self else { return }
            self.jsonTableView.update(items: self.viewModel.response?.results ?? [])
            self.characterTableView.reloadData()
        } */
    }
}

extension CharacterVC : JsonTableViewOutput {
    func onSelect(item: Result) {
        print(item.id)
        
        self.toDetailVM.getItem(item: item)
        self.detailVC.toDetailVM = toDetailVM
        navigationController?.pushViewController(detailVC, animated: true)
        /*let vc = UIViewController()
        let vm = asdds
        vm.item = item
        vc.viewModel = vm
        navigationController?.pushViewController(vc, animated: true)*/
    }
}

extension CharacterVC : JsonViewModelOutput{
    func succes(items: [Result]) {
        jsonTableView.update(items: items)
        characterTableView.reloadData()
    }
    
    
}


extension CharacterVC : ToDetailProtocol{
    func didTapMenuButton() {
        
        
    }
    
    
}
