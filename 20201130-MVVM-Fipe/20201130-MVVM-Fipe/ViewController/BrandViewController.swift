//
//  ViewController.swift
//  20201130-MVVM-Fipe
//
//  Created by Daniel Nascimento on 30/11/20.
//

import UIKit

class BrandViewController: UIViewController {

    var viewModel = BrandViewModel()
    var brandDelegateDataSource: BrandTableViewDelegateDataSource?

    @IBOutlet var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
       getBrand()
    }
    func configureTableView() {
        self.brandDelegateDataSource = BrandTableViewDelegateDataSource(brandViewModel: self.viewModel)
        self.tableView.delegate = brandDelegateDataSource
        self.tableView.dataSource = brandDelegateDataSource
        self.tableView.reloadData()
    }
    
    func getBrand() {
        viewModel.getBrand(completion: { (success) in
            print(success)
            self.configureTableView()
        })
    }
}
