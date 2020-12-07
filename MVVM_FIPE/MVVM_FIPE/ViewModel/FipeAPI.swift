//
//  FipeAPI.swift
//  MVVM_FIPE
//
//  Created by Daniel Nascimento on 07/12/20.
//

import UIKit
import Alamofire

class FipeAPI: NSObject {
    let apiManager = APIManager()
    
    private func parseData(response: Any?) -> [BaseClass]?  {
        if let arrayDictionary = response as? [[String: Any]] {
            var arrayBrands = [BaseClass]()
            for dictionary in arrayDictionary {
                let loadedData = BaseClass(fromDictionary: dictionary)
                arrayBrands.append(loadedData)
            }
            return arrayBrands
        }
        return nil
    }
    
    func getBrands(completion: @escaping ([BaseClass]?, Bool) -> Void) {
        apiManager.request(url: "\(Enviroment.apiBaseUrl)/carros/marcas") { (response) in
            if let arrayBrands = self.parseData(response: response) {
                completion(arrayBrands, true)
                return
            }
            completion(nil, false)
        }
    }
    
    
    func getModels(brandId: String, completion: @escaping ([BaseClass]?, Bool) -> Void) {
        apiManager.request(url: "\(Enviroment.apiBaseUrl)/carros/marcas/\(brandId)/modelos") { (response) in
            if let json = response as? [String: Any], let jsonModels = json["modelos"] as? [[String: Any]] {
                if let arrayModels = self.parseData(response: jsonModels) {
                    completion(arrayModels, true)
                    return
                }
            }
            completion(nil, false)
        }
    }
    
    func getModelYear(brandId: String, modelId: String, completion: @escaping ([BaseClass]?, Bool) -> Void) {
        apiManager.request(url: "\(Enviroment.apiBaseUrl)/carros/marcas/\(brandId)/modelos/\(modelId)/anos") { (response) in
            if let arrayYears = self.parseData(response: response) {
                completion(arrayYears, true)
                return
            }
            completion(nil, false)
        }
    }
    
    func getCar(brandId: String, modelId: String, yearId: String, completion: @escaping (Car?, Bool) -> Void) {
        apiManager.request(url: "\(Enviroment.apiBaseUrl)/carros/marcas/\(brandId)/modelos/\(modelId)/anos/\(yearId)") { (response) in
            if let json = response as? [String: Any] {
                let car = Car(fromDictionary: json)
                var texts = [String]()
                texts.append(car.marca)
                texts.append(car.modelo)
                texts.append(car.valor)
                car.arrayTexts = texts
                completion(car, false)
                return
            }
            completion(nil, false)
        }
    }
    
}
