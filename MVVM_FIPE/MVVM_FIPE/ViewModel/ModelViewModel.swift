//
//  ModelViewModel.swift
//  MVVM_FIPE
//
//  Created by Daniel Nascimento on 07/12/20.
//

import Alamofire
import Foundation

class ModelViewModel: ViewModelProtocol {
    var selectedBrand: BaseClass?
    let fipeAPI = FipeAPI()

    init(brand: BaseClass) {
        selectedBrand = brand
    }

    var arrayModels = [BaseClass]()

    func getTitleForCell(at index: Int) -> String {
        return arrayModels[index].name
    }

    func getViewTitle() -> String {
        return "Modelos \(selectedBrand!.name!)"
    }
    
    func loadData(onComplete: @escaping (Bool) -> Void) {
        fipeAPI.getModels(brandId: selectedBrand!.code) { (arrayModels, success) in
            self.arrayModels = arrayModels!
            onComplete(success)
        }
    }

    func getNumberOfRows() -> Int {
        return arrayModels.count
    }

    func getNextViewModel(index: Int) -> UIViewController {
        let nextViewModel =  ModelYearViewModel(brand: selectedBrand!, model: arrayModels[index])
        return DefaultListViewController.getView(viewModel: nextViewModel)
    }
}
