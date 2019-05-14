//
//  OrderListViewController.swift
//  ShopifyOrders
//
//  Created by PM on 13/05/19.
//  Copyright © 2019 Hanumant Shegade. All rights reserved.
//

import UIKit

class OrderListViewController: UITableViewController {

    
    @IBOutlet var orderListViewModel: OrderListViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupUI()
        fetchOrderList()
    }

    func setupUI() {
        self.title = "Orders"
        tableView.tableFooterView = UIView()
    }
    
    func fetchOrderList() {
        orderListViewModel.invokeOrderList { [unowned self] in
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
    
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return orderListViewModel.getRowsCount()
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: OrderTableViewCell.self), for: indexPath) as? OrderTableViewCell else {
            return UITableViewCell()
        }
        cell.order = orderListViewModel.orderHistory?.orders?[indexPath.row]
        return cell
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let orderDetailsVC = storyboard?.instantiateViewController(withIdentifier: String(describing: OrderDetailsViewController.self)) as? OrderDetailsViewController else { return }
        orderDetailsVC.orderDetails = orderListViewModel.orderHistory?.orders?[indexPath.row]
        orderDetailsVC.orderDelegate = self
        self.navigationController?.pushViewController(orderDetailsVC, animated: true)
    }
}


extension OrderListViewController: OrderDelegate {
    func updateOrderStatus(referenceNo: String?) {
        guard let refNo = referenceNo else { return }
        orderListViewModel.updateOrderStatus(referenceNumber: refNo)
        tableView.reloadData()
    }
}
