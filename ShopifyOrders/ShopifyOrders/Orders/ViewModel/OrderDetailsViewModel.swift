//
//  OrderDetailsViewModel.swift
//  ShopifyOrders
//
//  Created by PM on 13/05/19.
//  Copyright © 2019 Hanumant Shegade. All rights reserved.
//

import UIKit

class OrderDetailsViewModel: NSObject {
    
    var orderDetials: Order?
    
    func getFullName() -> String {
        let firstName = (orderDetials?.customer?.firstName ?? "")
        let lastName = (orderDetials?.customer?.lastName ?? "")
        return firstName + " " + lastName
    }
    
    func getAddress() -> String {
        let address = (orderDetials?.customer?.address ?? "")
        let city =  (orderDetials?.customer?.city ?? "")
        let state = (orderDetials?.customer?.state ?? "")
        let zip = (orderDetials?.customer?.zip ?? "")
        return address + ", " + city + ", " + state + "- " + zip
    }
    
    func getTime() -> String {
        let startTime = (orderDetials?.scheduleStartTime ?? "")
        let endTime = (orderDetials?.scheduleEndTime ?? "")
        return startTime + " to " + endTime
    }
    
    func getOrderStatus() -> (UIColor, String) {
        let color = orderDetials?.status == OrderStatus.active.rawValue ? UIColor.green : UIColor.red
        let status = orderDetials?.status == OrderStatus.active.rawValue ? "Active" : "Completed"
        return(color, status)
    }
    
    func getSpecialInstruction() -> String {
        let instruction = (orderDetials?.serviceSpecialInstructions ?? "")
        if instruction.isEmpty {
            return "Special Instruction: NA"
        }
        return "Special Instruction: " + instruction
    }
    
}
