//
//  ConfirmedBookingTableViewCell.swift
//  instaHelper
//
//  Created by sharanjit Kaur on 19/01/24.
//

import UIKit

class ConfirmedBookingTableViewCell: UITableViewCell {

    var service : String = "Cook"
    var address : String = "Home"
    
    @IBOutlet weak var nameofServantLabel: UILabel!
    
    @IBOutlet weak var serviceLabel: UILabel!
    
    
      @IBOutlet weak var locationLabel: UILabel!
      
      @IBOutlet weak var priceOfServiceLabel: UILabel!
      
      @IBOutlet weak var dateandTimeLabel: UILabel!
      
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    func update(with request: ConfirmedBookings) {
        if let servant = servants.first(where: { $0.id == request.id }) {
            nameofServantLabel.text = servant.name
            serviceLabel.text = servant.type.rawValue
            locationLabel.text = request.address
            priceOfServiceLabel.text = "Rs. " + request.price
            dateandTimeLabel.text = request.dateandTime
        }    else {
                print("Servant not found for id: \(request.id)")
            }
   }
}
