//
//  ViewController.swift
//  MVVM_FIPE
//
//  Created by Daniel Nascimento on 07/12/20.
//

import UIKit

class DefaultListViewController: UIViewController {
    var viewModel: ViewModelProtocol!

    @IBOutlet var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.delegate = self
        tableView.dataSource = self

        title = viewModel.getViewTitle()

        loadData()
    }

    func loadData() {
        viewModel.loadData { success in
            self.tableView.reloadData()
        }
    }

    static func getView(viewModel: ViewModelProtocol) -> DefaultListViewController {
        let viewDefault = UIStoryboard(name: "DefaultList", bundle: nil).instantiateInitialViewController() as! DefaultListViewController
        viewDefault.viewModel = viewModel
        return viewDefault
    }
}
