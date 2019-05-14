//
//  OrderTableViewCell.swift
//  ShopifyOrders
//
//  Created by PM on 13/05/19.
//  Copyright © 2019 Hanumant Shegade. All rights reserved.
//

import UIKit

class OrderTableViewCell: UITableViewCell {

    
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var lblReferenceNumber: UILabel!
    @IBOutlet weak var lblRequestType: UILabel!
    @IBOutlet weak var lblJobIndicator: UILabel!
    @IBOutlet weak var lblStartDate: UILabel!
    @IBOutlet weak var lblCity: UILabel!
    @IBOutlet weak var viewStatus: UIView! {
        didSet {
            viewStatus.clipsToBounds = true
            viewStatus.layer.cornerRadius = viewStatus.bounds.width / 2
            viewStatus.backgroundColor = .white
        }
    }
    
    
    var order: Order? {
        didSet {
            let firstName = (order?.customer?.firstName ?? "")
            let lastName = (order?.customer?.lastName ?? "")
            lblName.text = firstName + " " + lastName
            lblCity.text = order?.customer?.city
            lblReferenceNumber.text = order?.orderRef
            lblStartDate.text = order?.scheduleDate
            lblRequestType.text = order?.serviceRequested
            lblJobIndicator.text = order?.jobIndicator
            setOrderStatus()
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    func setOrderStatus() {
        let bgColor = order?.status == OrderStatus.active.rawValue ? UIColor.green : UIColor.red
        viewStatus.backgroundColor = bgColor
    }
}
