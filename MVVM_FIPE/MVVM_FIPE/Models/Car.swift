//
//  Car.swift
//  MVVM_FIPE
//
//  Created by Daniel Nascimento on 07/12/20.
//

import Foundation

class Car: NSObject {
    var anoModelo: Int!
    var codigoFipe: String!
    var combustivel: String!
    var marca: String!
    var mesReferencia: String!
    var modelo: String!
    var siglaCombustivel: String!
    var tipoVeiculo: Int!
    var valor: String!
    var arrayTexts = [String]()

    /**
     * Instantiate the instance using the passed dictionary values to set the properties values
     */
    init(fromDictionary dictionary: [String: Any]) {
        anoModelo = dictionary["AnoModelo"] as? Int
        codigoFipe = dictionary["CodigoFipe"] as? String
        combustivel = dictionary["Combustivel"] as? String
        marca = dictionary["Marca"] as? String
        mesReferencia = dictionary["MesReferencia"] as? String
        modelo = dictionary["Modelo"] as? String
        siglaCombustivel = dictionary["SiglaCombustivel"] as? String
        tipoVeiculo = dictionary["TipoVeiculo"] as? Int
        valor = dictionary["Valor"] as? String
    }

}
