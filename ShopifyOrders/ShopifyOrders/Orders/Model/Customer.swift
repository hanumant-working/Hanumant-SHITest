//
//  Customer.swift
//  Model Generated using http://www.jsoncafe.com/ 
//  Created on May 13, 2019

import Foundation

struct Customer : Codable {

        let address : String?
        let city : String?
        let firstName : String?
        let lastName : String?
        let phoneNumber : String?
        let state : String?
        let zip : String?
        let zipSuffix : String?

        enum CodingKeys: String, CodingKey {
                case address = "address"
                case city = "city"
                case firstName = "firstName"
                case lastName = "lastName"
                case phoneNumber = "phoneNumber"
                case state = "state"
                case zip = "zip"
                case zipSuffix = "zipSuffix"
        }
    
}
