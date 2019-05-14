//
//  OrderListViewModel.swift
//  ShopifyOrders
//
//  Created by PM on 13/05/19.
//  Copyright © 2019 Hanumant Shegade. All rights reserved.
//

import UIKit

class OrderListViewModel: NSObject {
    
    var orderHistory: OrderHistory?
    
    func invokeOrderList(completionHandler: @escaping () -> Void) {
        guard let basePathURL = URL(string: APIConstants.basePath) else {
            fatalError("Invalid Base URL")
        }
        let request = URLRequest(url: basePathURL)
        NetworkManager.decodingTask(with: request, decodingType: OrderHistory.self) { [unowned self] (orderlist, error) in
            // debugPrint(error?.localizedDescription)
            self.orderHistory = orderlist as? OrderHistory
            completionHandler()
        }
    }
    
    func getRowsCount() -> Int {
        return orderHistory?.orders?.count ?? 0
    }
    
    func updateOrderStatus(referenceNumber: String) {
        // self.orderHistory?.orders?.filter { $0.orderRef == referenceNumber }.first?.status = OrderStatus.completed.rawValue
        guard var orderArray = orderHistory?.orders  else { return }
        for (index, obj) in orderArray.enumerated() {
            if obj.orderRef == referenceNumber {
                orderArray[index].status = OrderStatus.completed.rawValue
            }
        }
        orderHistory?.orders = orderArray
    }
}
