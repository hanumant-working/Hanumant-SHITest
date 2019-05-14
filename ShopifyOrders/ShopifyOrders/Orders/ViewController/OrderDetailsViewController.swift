//
//  OrderDetailsViewController.swift
//  ShopifyOrders
//
//  Created by PM on 13/05/19.
//  Copyright © 2019 Hanumant Shegade. All rights reserved.
//

import UIKit


protocol OrderDelegate: class {
    func updateOrderStatus(referenceNo: String?)
}


class OrderDetailsViewController: UIViewController {

    @IBOutlet weak var imgViewOrder: UIImageView!
    @IBOutlet weak var lblServiceName: UILabel!
    @IBOutlet weak var viewStatus: UIView!
    @IBOutlet weak var lblJobIndicator: UILabel!
    @IBOutlet weak var lblTime: UILabel!
    @IBOutlet weak var lblSpecialRequest: UILabel!
    @IBOutlet weak var lblCustomerName: UILabel!
    @IBOutlet weak var lblAddress: UILabel!
    @IBOutlet weak var lblPhoneNumber: UILabel!
    @IBOutlet weak var btnSubmitOrder: UIButton!
    @IBOutlet weak var lblStartDate: UILabel!
    @IBOutlet weak var lblStatus: UILabel!
    @IBOutlet var orderDetailsViewModel: OrderDetailsViewModel!
    

    var orderDetails: Order!
    weak var orderDelegate: OrderDelegate?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupUI()
        setOrderDetails()
    }
    
    func setupUI() {
        self.title = "Order Details"
        guard orderDetails != nil else { return }
        orderDetailsViewModel.orderDetials = orderDetails
        
        guard let imgURL = orderDetails.imageUrl else { return }
        imgViewOrder.imageFromURL(urlString: imgURL)
        
        if orderDetails.status == OrderStatus.completed.rawValue {
            btnSubmitOrder.isUserInteractionEnabled = false
            btnSubmitOrder.alpha = 0.5
        }
        
        viewStatus.clipsToBounds = true
        viewStatus.layer.cornerRadius = viewStatus.bounds.width / 2
    }
    
    func setOrderDetails() {
        lblServiceName.text = orderDetails.serviceRequested
        lblJobIndicator.text = orderDetails.jobIndicator
        lblSpecialRequest.text = orderDetailsViewModel.getSpecialInstruction()
        lblTime.text = orderDetailsViewModel.getTime()
        lblStartDate.text = orderDetails.scheduleDate
        lblCustomerName.text = orderDetailsViewModel.getFullName()
        lblAddress.text = orderDetailsViewModel.getAddress()
        lblPhoneNumber.text = orderDetails.customer?.phoneNumber
        let status = orderDetailsViewModel.getOrderStatus()
        lblStatus.text = status.1
        viewStatus.backgroundColor = status.0
    }
    
    
    @IBAction func btnSubmitOrderTapped(_ sender: Any) {
        let yesAction = UIAlertAction(title: "Yes", style: .default) { [weak self] (action) in
            self?.redirectToHome()
            if self?.orderDetails.status == OrderStatus.active.rawValue { // Update Order Status if it is Active
                self?.orderDelegate?.updateOrderStatus(referenceNo: self?.orderDetails.orderRef)
            }
        }
        let noAction = UIAlertAction(title: "No", style: .destructive)
        let alertVC = UIAlertController(title: "Update Order", message: "Do you want to complete this order?", preferredStyle: .alert)
        alertVC.addAction(yesAction)
        alertVC.addAction(noAction)
        self.present(alertVC, animated: true, completion: nil)
    }
    
    func redirectToHome() {
        self.navigationController?.popViewController(animated: true)
    }
    
}
