//
//  RootClass.swift
//  Model Generated using http://www.jsoncafe.com/ 
//  Created on May 13, 2019

import Foundation

struct OrderHistory : Codable {

        let firstName : String?
        let lastName : String?
        var orders : [Order]?
        let phoneNumber : String?

        enum CodingKeys: String, CodingKey {
                case firstName = "firstName"
                case lastName = "lastName"
                case orders = "customers"
                case phoneNumber = "phoneNumber"
        }
    
        init(from decoder: Decoder) throws {
                let values = try decoder.container(keyedBy: CodingKeys.self)
                firstName = try values.decodeIfPresent(String.self, forKey: .firstName)
                lastName = try values.decodeIfPresent(String.self, forKey: .lastName)
                orders = try values.decodeIfPresent([Order].self, forKey: .orders)
                phoneNumber = try values.decodeIfPresent(String.self, forKey: .phoneNumber)
        }

}
