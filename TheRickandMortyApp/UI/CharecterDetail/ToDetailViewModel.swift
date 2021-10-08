//
//  ToDetailViewModel.swift
//  TheRickandMortyApp
//
//  Created by Emin Hayal on 25.07.2021.
//

import Foundation

protocol ToDetailViewOutput : AnyObject {
    func  getItem( item : Result )
}
protocol ToDetailProtocol : AnyObject {
    func didTapMenuButton()
}

class ToDetailViewModel  {
    var items : Result?
    weak var delegate:ToDetailViewOutput?
    
}


extension ToDetailViewModel : ToDetailViewOutput{
    func getItem(item: Result) {
        self.items = item
    }
    
    
}
