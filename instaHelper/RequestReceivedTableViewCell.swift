//
//  RequestReceivedTableViewCell.swift
//  instaHelper
//
//  Created by sharanjit Kaur on 19/01/24.
//

import UIKit

class RequestReceivedTableViewCell: UITableViewCell {

    @IBOutlet weak var nameOfServantLabel: UILabel!
    
    @IBOutlet weak var dateandTimeLabel: UILabel!
    
    
    @IBOutlet weak var requesterNameLabel: UILabel!
    
   
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

       
    }
    func update(with servant: Int) {
        
        nameOfServantLabel.text = receivedRequestBooking.first{ $0.id == servant}?.name
        requesterNameLabel.text = receivedRequestBooking.first{ $0.id == servant}?.RequesterName
        dateandTimeLabel.text = receivedRequestBooking.first{ $0.id == servant}?.dateandTime
     //   statusofBookingLabel.text = requestedServant.first{ $0.id == servant}?.status
       

   }
    
    @IBAction func acceptButtonTapped(_ sender: Any) {
    }
    
    @IBAction func requestButtonTapped(_ sender: Any) {
    }
    
}
