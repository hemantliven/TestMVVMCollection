//
//  ListViewModel.swift
//  TestMVVMCollection
//
//  Created by liven on 6/22/18.
//  Copyright © 2018 liven. All rights reserved.
//

import Foundation
import MVVM

class ListViewModel: MVVM.ViewModel {
    weak var delegate: ViewModelDelegate?
    
    func numberOfSections() -> Int {
        return 3
    }
    
    func numberOfItems(inSection section: Int) -> Int {
        return 1
    }
    
    func viewModelForItem(at indexPath: IndexPath) -> CollectionTableCellViewModel {
        let collectionTableCellViewModel = CollectionTableCellViewModel()
        collectionTableCellViewModel.indexPath = indexPath
        return collectionTableCellViewModel
    }
}
