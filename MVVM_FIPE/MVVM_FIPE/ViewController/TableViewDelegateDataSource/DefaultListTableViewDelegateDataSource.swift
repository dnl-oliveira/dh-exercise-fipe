//
//  TableViewDelegateDataSource.swift
//  MVVM_FIPE
//
//  Created by Daniel Nascimento on 07/12/20.
//

import Foundation
import UIKit

extension DefaultListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let nextViewModel = viewModel.getNextViewModel(index: indexPath.row)
        
        navigationController?.pushViewController(nextViewModel, animated: true)
    }
}

extension DefaultListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.getNumberOfRows()
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = viewModel.getTitleForCell(at: indexPath.row)
        cell.textLabel?.accessibilityIdentifier = "cell_\(indexPath.row)"
        return cell
    }
}

//class TableViewDelegateDataSource: NSObject, UITableViewDelegate, UITableViewDataSource {
//
//    var viewModel: ViewModelProtocol!
//
//    init(viewModel: ViewModelProtocol){
//        self.viewModel = viewModel
//    }
//
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return viewModel.getNumberOfRows()
//    }
//
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = UITableViewCell()
//
//        cell.textLabel?.text = viewModel.getTitleForCell(at: indexPath.row)
//        return cell
//    }
//
//
//}
