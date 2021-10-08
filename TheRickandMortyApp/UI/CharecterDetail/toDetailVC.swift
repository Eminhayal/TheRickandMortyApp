//
//  toDetailVc.swift
//  TheRickandMortyApp
//
//  Created by Emin Hayal on 25.07.2021.
//

import UIKit



class toDetailVC: UIViewController, ToDetailViewOutput {
    
    @IBOutlet weak var characterImage: UIImageView!
    @IBOutlet weak var aliveImage: UIImageView!
    @IBOutlet weak var statusLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var locationEpidoseLabel: UILabel!
    @IBOutlet weak var genderLabel: UILabel!
    
    
    @IBOutlet weak var tabView: UIView!
    @IBOutlet weak var nameLabel: UILabel!
    
    
    
    weak var delegate : ToDetailProtocol?
    var toDetailVM = ToDetailViewModel()
    let navVC = UINavigationController()
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.tabBarController?.tabBar.isHidden = true
        /*let vc = CharacterVC.instantiate(storyboard: .main, bundle: nil, identifier: nil)
        let vm = JsonViewModel()
        vm.url = toDetailVM.items?.location.url ?? ""
        vc.viewModel = vm
        self.navigationController?.pushViewController(vc, animated: true)
        */
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.tabBarController?.tabBar.isHidden = false
        navigationController?.navigationBar.isHidden = true

    }
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
        toDetailVM.delegate = self
        setScreenSize()
        navigationController?.navigationBar.isHidden = false

        //setNavigation()

        
    }
    
    
   
    func getItem(item: Result) {
        toDetailVM.items = item
    }
    
    func setScreenSize(){
        tabView.layer.cornerRadius = 25
     
    }
    
    
    
    func setNavigation(){
        //view.addSubview(navVC.view)
        //navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(named: "back"),  style: .done, target: self, action: #selector(didTapMenuButton))
        let screenSize: CGRect = UIScreen.main.bounds
        let navBar = UINavigationBar(frame: CGRect(x: 0, y: 0, width: screenSize.width, height: 44))
        let navItem = UINavigationItem(title: "")
        let doneItem = UIBarButtonItem(image: UIImage(named: "back"),  style: .done, target: self, action: #selector(didTapMenuButton))
            navItem.rightBarButtonItem = doneItem
            navBar.setItems([navItem], animated: false)
        self.view.addSubview(navBar)
    }
    @objc func didTapMenuButton() {
        delegate?.didTapMenuButton()
    }
}

extension toDetailVC {
    func configure(){
        characterImage.load(url: URL(string: toDetailVM.items?.image ?? "")!)
        nameLabel.text = toDetailVM.items?.name
        statusLabel.text = toDetailVM.items!.status + "-" + toDetailVM.items!.species
        genderLabel.text = "Cinsiyet : " + toDetailVM.items!.gender
            //toDetailVM.items!.gender + "-" + toDetailVM.items!.species
        locationLabel.text = toDetailVM.items?.location.name
        //tableview aç
        view.reloadInputViews()
        if toDetailVM.items?.status == "Alive" {
            aliveImage.image = UIImage(named: "alive")
        }else if toDetailVM.items?.status == "Dead"{
            aliveImage.image = UIImage(named: "death")
        }else{
            aliveImage.image = UIImage(named: "Unknow")
        }
        
        }
}
