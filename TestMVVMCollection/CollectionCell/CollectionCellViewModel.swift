//
//  CollectionCellViewModel.swift
//  TestMVVMCollection
//
//  Created by liven on 6/22/18.
//  Copyright © 2018 liven. All rights reserved.
//

import Foundation
import MVVM

final class CollectionCellViewModel: MVVM.ViewModel {
    
    var indexPath: IndexPath = IndexPath(row: 0, section: 0)
    var parentSection: Int = 0
    
}
