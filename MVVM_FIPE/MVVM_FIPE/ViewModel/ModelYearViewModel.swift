//
//  ModelYearViewModel.swift
//  MVVM_FIPE
//
//  Created by Daniel Nascimento on 07/12/20.
//

import Foundation
import Alamofire

class ModelYearViewModel: ViewModelProtocol {
    var selectedBrand: BaseClass
    var selectedModel: BaseClass
    let fipeAPI = FipeAPI()

    init(brand: BaseClass, model: BaseClass) {
        selectedBrand = brand
        selectedModel = model
    }

    var arrayYears = [BaseClass]()

    func getTitleForCell(at index: Int) -> String {
        return arrayYears[index].name
    }

    func getViewTitle() -> String {
        return "Ano - \(selectedModel.name!)"
    }
    
    func loadData(onComplete: @escaping (Bool) -> Void) {
        fipeAPI.getModelYear(brandId: selectedBrand.code, modelId: selectedModel.code) { (arrayYears, success) in
            self.arrayYears = arrayYears!
            onComplete(success)
        }
    }

    func getNumberOfRows() -> Int {
        return arrayYears.count
    }

    func getNextViewModel(index: Int) -> UIViewController {
        let nextViewModel =  CarViewModel(brand: selectedBrand, model: selectedModel, year: arrayYears[index])
        return DefaultListViewController.getView(viewModel: nextViewModel)
    }

}

