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
    
    let toDetailVM = ToDetailViewModel()
    override func viewDidLoad() {
        super.viewDidLoad()
        characterTableView.delegate = jsonTableView
        characterTableView.dataSource = jsonTableView
        jsonTableView.delegate = self
        viewModel.delegate = self
        characterTableView.register(MyTableViewCell.nibName, forCellReuseIdentifier: MyTableViewCell.identifier)
        viewModel.fetchAllCharacter()
        navigationController?.navigationBar.isHidden = true
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
        let detailVC = toDetailVC.instantiate(storyboard: .detail, bundle: nil, identifier: nil)

        self.toDetailVM.getItem(item: item)
        detailVC.toDetailVM = toDetailVM
        self.navigationController?.pushViewController(detailVC, animated: true)
        //self.tabBarController?.tabBar.isHidden = true
        //present(detailVC, animated: true, completion: nil)
        
        //navigationController?.pushViewController(detailVC, animated: true)
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
