//
//  MainTableViewDelegateDataSource.swift
//  20201130-MVVM-Fipe
//
//  Created by Daniel Nascimento on 03/12/20.
//

import Foundation
import UIKit

class MainTableViewDelegateDataSource: NSObject, UITableViewDelegate, UITableViewDataSource {
    
    var mainViewModel =  MainViewModel()
    
    init(mainViewModel: MainViewModel){
        self.mainViewModel = mainViewModel
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return mainViewModel.numberOfRows()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "MainTableViewCell") as? MainTableViewCell {
            let brand = mainViewModel.getCurrentBrand(currentObject: indexPath.row)
            cell.setup(brand: brand)
            return cell
        }
        return UITableViewCell()
    }

    
}
