//
//  Order.swift
//  Model Generated using http://www.jsoncafe.com/ 
//  Created on May 13, 2019

import Foundation

struct Order : Codable {

        let customer : Customer?
        let imageUrl : String?
        let jobIndicator : String?
        let lastUpdateDate : String?
        let orderRef : String?
        let scheduleDate : String?
        let scheduleEndTime : String?
        let scheduleStartTime : String?
        let serviceRequested : String?
        let serviceSpecialInstructions : String?
        var status : String?

        enum CodingKeys: String, CodingKey {
                case customer = "customer"
                case imageUrl = "imageUrl"
                case jobIndicator = "jobIndicator"
                case lastUpdateDate = "lastUpdateDate"
                case orderRef = "orderRef"
                case scheduleDate = "scheduleDate"
                case scheduleEndTime = "scheduleEndTime"
                case scheduleStartTime = "scheduleStartTime"
                case serviceRequested = "serviceRequested"
                case serviceSpecialInstructions = "serviceSpecialInstructions"
                case status = "status"
        }

}


enum OrderStatus: String {
    case active = "AT"
    case completed = "CO"
}
