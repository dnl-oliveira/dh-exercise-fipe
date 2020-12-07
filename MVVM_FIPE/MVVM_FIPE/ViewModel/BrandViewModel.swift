//
//  BrandViewModel.swift
//  MVVM_FIPE
//
//  Created by Daniel Nascimento on 07/12/20.
//

import Foundation
import Alamofire

class BrandViewModel: ViewModelProtocol {
    var arrayBrands = [BaseClass]()
    let fipeAPI = FipeAPI()
    
    func getTitleForCell(at index: Int) -> String {
        return arrayBrands[index].name
    }

    func getViewTitle() -> String {
        return "Marcas"
    }
    
    func loadData(onComplete: @escaping (Bool) -> Void) {
        fipeAPI.getBrands { (arrayBrands, success) in
            self.arrayBrands = arrayBrands!
            onComplete(success)
        }
    }

    func getNumberOfRows() -> Int {
        return arrayBrands.count
    }

    func getNextViewModel(index: Int) -> UIViewController {
        let viewModel =  ModelViewModel(brand: arrayBrands[index])        
        return DefaultListViewController.getView(viewModel: viewModel)
    }
}
