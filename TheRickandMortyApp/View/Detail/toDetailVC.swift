//
//  toDetailVc.swift
//  TheRickandMortyApp
//
//  Created by Emin Hayal on 25.07.2021.
//

import UIKit



class toDetailVC: UIViewController, ToDetailViewOutput {
    @IBOutlet weak var deneme: UILabel!
    weak var delegate : ToDetailProtocol?
    var toDetailVM = ToDetailViewModel()
    var navVC = UINavigationController()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navVC.view.frame.origin.x = 0
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(named:  "back"),  style: .done, target: self, action: #selector(didTapMenuButton))
        toDetailVM.delegate = self
        deneme.text = toDetailVM.items?.name
    }
    
    @objc func didTapMenuButton() {
        delegate?.didTapMenuButton()
    }
    func getItem(item: Result) {
        toDetailVM.items = item
    }

}
