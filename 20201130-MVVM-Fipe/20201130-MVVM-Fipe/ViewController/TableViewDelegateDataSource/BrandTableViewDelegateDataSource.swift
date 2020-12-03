//
//  MainTableViewDelegateDataSource.swift
//  20201130-MVVM-Fipe
//
//  Created by Daniel Nascimento on 03/12/20.
//

import Foundation
import UIKit

class BrandTableViewDelegateDataSource: NSObject, UITableViewDelegate, UITableViewDataSource {
    
    var brandViewModel = BrandViewModel()
    
    init(brandViewModel: BrandViewModel){
        self.brandViewModel = brandViewModel
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return brandViewModel.numberOfRows()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "BrandTableViewCell") as? BrandTableViewCell {
            let brand = brandViewModel.getCurrentBrand(currentObject: indexPath.row)
            cell.setup(brand: brand)
            return cell
        }
        return UITableViewCell()
    }

    
}
