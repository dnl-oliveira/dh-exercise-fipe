//
//  CarViewModel.swift
//  MVVM_FIPE
//
//  Created by Daniel Nascimento on 07/12/20.
//

import Foundation
import Alamofire

class CarViewModel: ViewModelProtocol {
    var selectedBrand: BaseClass
    var selectedModel: BaseClass
    var selectedYear: BaseClass
    let fipeAPI = FipeAPI()

    var car: Car?
    var arrayTexts = [String]()

    init(brand: BaseClass, model: BaseClass, year: BaseClass) {
        selectedBrand = brand
        selectedModel = model
        selectedYear = year
    }

    func getTitleForCell(at index: Int) -> String {
        return arrayTexts[index]
    }

    func getViewTitle() -> String {
        return "\(selectedYear.name!)"
    }
    
    func loadData(onComplete: @escaping (Bool) -> Void) {
        fipeAPI.getCar(brandId: selectedBrand.code, modelId: selectedModel.code, yearId: selectedYear.code) { (car, success) in
            self.car = car!
            self.arrayTexts = car!.arrayTexts
            onComplete(success)
        }
    }

//    func loadData(onComplete: @escaping (Bool) -> Void) {
//        AF.request("\(Enviroment.apiBaseUrl)/carros/marcas/\(selectedBrand.code!)/modelos/\(selectedModel.code!)/anos/\(selectedYear.code!)").responseJSON { response in
//            if let json = response.value as? [String: Any] {
//                let car = Car(fromDictionary: json)
//                var texts = [String]()
//                texts.append(car.marca)
//                texts.append(car.modelo)
//                texts.append(car.valor)
//
//                self.car = car
//                self.arrayTexts = texts
//
//                onComplete(true)
//                return
//            }
//            onComplete(false)
//        }
//    }

    func getNumberOfRows() -> Int {
        return arrayTexts.count
    }

    func getNextViewModel(index: Int) -> UIViewController {
        let nextViewModel = ModelViewModel(brand: selectedBrand)
        return DefaultListViewController.getView(viewModel: nextViewModel)
    }
}

