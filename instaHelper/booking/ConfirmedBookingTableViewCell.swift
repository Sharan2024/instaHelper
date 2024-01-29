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

        // Configure the view for the selected state
    }
    func update(booking: confirmedBookings) {
        
        nameofServantLabel.text = booking.name
               serviceLabel.text = "Cook"  // Example value, update accordingly
               locationLabel.text = "📍" + booking.address
               priceOfServiceLabel.text = booking.price
               dateandTimeLabel.text = booking.dateandTime

   }

}
