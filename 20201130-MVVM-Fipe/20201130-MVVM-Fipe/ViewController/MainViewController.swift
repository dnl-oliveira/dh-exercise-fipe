//
//  ViewController.swift
//  20201130-MVVM-Fipe
//
//  Created by Daniel Nascimento on 30/11/20.
//

import UIKit

class MainViewController: UIViewController {

    var viewModel = MainViewModel()
    var mainDelegateDataSource: MainTableViewDelegateDataSource?

    @IBOutlet var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
       getBrand()
    }
    func configureTableView() {
        self.mainDelegateDataSource = MainTableViewDelegateDataSource(mainViewModel: self.viewModel)
        self.tableView.delegate = mainDelegateDataSource
        self.tableView.dataSource = mainDelegateDataSource        
        self.tableView.reloadData()
    }
    
    func getBrand() {
        viewModel.getBrand(completion: { (success) in
            print(success)
            self.configureTableView()
        })
    }
}
