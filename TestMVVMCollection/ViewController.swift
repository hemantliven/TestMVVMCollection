//
//  ViewController.swift
//  TestMVVMCollection
//
//  Created by liven on 6/22/18.
//  Copyright © 2018 liven. All rights reserved.
//

import UIKit

//class ViewController: UIViewController {
//    let tableView = UITableView()
//    let viewModel = TableViewModel()
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        tableView.reloadData()
//        // register cells and set data source
//        // do layout stuff to show the table view
//    }
//}
//
//extension ViewController: UITableViewDataSource {
//    func numberOfSections(in tableView: UITableView) -> Int {
//        return viewModel.numberOfSections
//    }
//    // etc.
//}

class ViewController: UITableViewController {

    var viewModel = ListViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configTable()
        //viewModel.delegate = self
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
        cell.viewModel = viewModel.viewModelForItem(at: indexPath)
        return cell
    }
}

// MARK: - Private
extension ViewController {
    fileprivate func configTable() {
        tableView.register(CollectionTableCell.self, forCellReuseIdentifier: "CollectionTableCell")
        tableView.dataSource = self
    }
}


