//
//  BaseClass.swift
//  20201130-MVVM-Fipe
//
//  Created by Daniel Nascimento on 30/11/20.
//

import Foundation

class BaseClass: NSObject {
    var id: String!
    var name: String!

    /**
     * Instantiate the instance using the passed dictionary values to set the properties values
     */
    init(fromDictionary dictionary: [String: Any]) {
        id = dictionary["codigo"] as? String
        name = dictionary["nome"] as? String

        if id == nil {
            if let intId = dictionary["codigo"] as? Int {
                id = "\(intId)"
            }
        }
    }
    init(id: String, name: String) {
        self.id = id
        self.name = name
    }

    /**
     * Returns all the available property values in the form of [String:Any] object where the key is the approperiate json key and the value is the value of the corresponding property
     */
    func toDictionary() -> [String: Any] {
        var dictionary = [String: Any]()
        if id != nil {
            dictionary["codigo"] = id
        }
        if name != nil {
            dictionary["nome"] = name
        }
        return dictionary
    }
}
