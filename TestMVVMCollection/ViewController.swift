//
//  ViewController.swift
//  TestMVVMCollection
//
//  Created by liven on 6/22/18.
//  Copyright © 2018 liven. All rights reserved.
//

import UIKit
import MVVM

class ViewController: UITableViewController, MVVM.View {
    
    var storedOffsets = [Int: CGFloat]()
    
    var viewModel = ListViewModel() {
        didSet {
            updateView()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configTable()
        viewModel.delegate = self
        // Do any additional setup after loading the view, typically from a nib.
        
    }
    
    func updateView() {
        guard isViewLoaded else { return }
        tableView.reloadData()
        viewDidUpdated()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

extension ViewController: ViewModelDelegate {
    func viewModel(_ viewModel: ViewModel, didChangeItemsAt indexPaths: [IndexPath], for changeType: ChangeType) {
        updateView()
    }
}

extension ViewController {
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return viewModel.numberOfSections()
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfItems(inSection: section)
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "CollectionTableCell") as? CollectionTableCell
            else { fatalError() }
        let collectionTableCellViewModel: CollectionTableCellViewModel = viewModel.viewModelForItem(at: indexPath)
        cell.viewModel = collectionTableCellViewModel
        return cell
    }
    
    override func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        guard let cell = cell as? CollectionTableCell else { return }
        
        cell.collectionView.contentOffset.x = storedOffsets[indexPath.row] ?? 0
    }
    
    override func tableView(_ tableView: UITableView, didEndDisplaying cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        guard let cell = cell as? CollectionTableCell else { return }
        
        storedOffsets[indexPath.row] = cell.collectionView.contentOffset.x
    }
}

// MARK: - Private
extension ViewController {
    fileprivate func configTable() {
        tableView.dataSource = self
        tableView.delegate = self
        tableView.estimatedRowHeight = 120
        tableView.tableFooterView = UIView()
    }
}


