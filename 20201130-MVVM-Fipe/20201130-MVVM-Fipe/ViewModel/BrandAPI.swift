//
//  API.swift
//  20201130-MVVM-Fipe
//
//  Created by Daniel Nascimento on 30/11/20.
//

import UIKit
import Alamofire

class BrandAPI: NSObject {
    
    let apiManager = APIManager()
    var arrayBrands = [Brand]()
    
//    func getBrand(completionHandler: @escaping (_ result: Bool, _ error: Error?) -> Void) {
//        do {
//            apiManager.request(url: "\(Enviroment.apiBaseUrl)/carros/marcas") {(json, jsonarray, errorStr) in
//                if json != nil {
//                    print("json dicionario")
//                }
//                if let jsonObjct = jsonarray {
//                    for item in jsonObjct {
//                        let object = Brand(fromDictionary: item)
//                        self.arrayBrand.append(object)
//                    }
//                }
//                completionHandler(true, nil)
//            }
//        }
//        catch {
//            completionHandler(false, nil)
//        }
//    }
    
    func getBrand(onComplete: @escaping (Bool) -> Void) {
        AF.request("\(Enviroment.apiBaseUrl)/carros/marcas").responseJSON { response in
            if let json = response.value as? [[String: Any]] {
                var brands = [Brand]()
                for item in json {
                    brands.append(Brand(fromDictionary: item))
                }
                self.arrayBrands = brands
                onComplete(true)
                return
            }
            onComplete(false)
        }
    }
    
    func getModel(brand: Brand, completion: () -> Void ) {
        apiManager.request(url: "\(Enviroment.apiBaseUrl)/carros/marcas/\(brand.id!)/modelos") { (json, jsonarray, errorStr) in
            
            if json != nil {
                print("json dicionario")
            }
            
            if jsonarray != nil {
                print("json com array de dicionario ")
            }
        }
    }
    
    func getModelYear(brand: Brand, model: Model, completion: () -> Void ) {
        apiManager.request(url: "\(Enviroment.apiBaseUrl)/carros/marcas/\(brand.id!)/modelos/\(model.id!)/anos") { (json, jsonarray, errorStr) in
            
            if json != nil {
                print("json dicionario")
            }
            
            if jsonarray != nil {
                print("json com array de dicionario ")
            }
        }
    }
    
//    func getModelYear(brand: Brand, model: Model, completion: () -> Void ) {
//        apiManager.request(url: "\(Enviroment.apiBaseUrl)/carros/marcas/\(brand.id!)/modelos/\(model.id!)/anos") { (json, jsonarray, errorStr) in
//
//            if json != nil {
//                print("json dicionario")
//            }
//
//            if jsonarray != nil {
//                print("json com array de dicionario ")
//            }
//        }
//    }
    
}
