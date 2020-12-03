//
//  MainViewModel.swift
//  20201130-MVVM-Fipe
//
//  Created by Daniel Nascimento on 30/11/20.
//

import Foundation

class MainViewModel {

    let apiManager = APIManager()
    let brandAPI = BrandAPI()
    var arrayBrands = [Brand]()
    
    var titlePage: String {
        return "Marcas"
    }
   
    func getBrand(completion: @escaping (Bool) -> Void) {
        brandAPI.getBrand { [self] (success) in
            if success {
                self.arrayBrands = brandAPI.arrayBrands
                completion(true)
            }
        }
    }
    
    func numberOfRows() -> Int {
        return arrayBrands.count
    }
    
    func getCurrentBrand(currentObject: Int) -> Brand {
        if arrayBrands.count > 0 {
            return arrayBrands[currentObject]
        }
        return Brand(id: "", name: "")
    }
}
