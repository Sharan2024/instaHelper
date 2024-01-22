//
//  StatusWiseHelpersTableViewCell.swift
//  instaHelper
//
//  Created by sharanjit Kaur on 22/01/24.
//

import UIKit

class StatusWiseHelpersTableViewCell: UITableViewCell {

   // @IBOutlet weak var helperImage: UIImageView!
    
    
    @IBOutlet weak var NameOfServant: UILabel!
    
    @IBOutlet weak var ExperienceOfServant: UILabel!
    
    @IBOutlet weak var RequestStatus: UILabel!
    
    
    @IBOutlet weak var helperImage: UIImageView!
    
    
    @IBOutlet weak var confirmButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func update(with servant: Int) {
        
        NameOfServant.text = requestedServant.first{ $0.id == servant}?.name
        let experience: Int? = requestedServant.first{ $0.id == servant}?.experience
        if let experience {
           ExperienceOfServant.text = String(experience) + " years of experience"
            print(experience)
        }
        let requestStatus = requestedServant.first{ $0.id == servant}?.status
        let houseOwner = requestedServant.first{ $0.id == servant}?.house
        if requestStatus == "Approved" {
            let mergedString = "\(requestStatus ?? "") by \(houseOwner ?? "")"
            RequestStatus.text = mergedString
        }
        if requestStatus == "Pending" {
           // let mergedString = "\(requestStatus ?? "") by \(houseOwner ?? "")"
            confirmButton.isEnabled = false
            RequestStatus.text = "Approval Pending"
        }
        let imageName: String? = requestedServant.first{ $0.id == servant }?.image
        if let imageName {
            helperImage.image = UIImage(named: imageName)
        }
        
//        dateandTimeLabel.text = receivedRequestBooking.first{ $0.id == servant}?.dateandTime
//     //   statusofBookingLabel.text = requestedServant.first{ $0.id == servant}?.status
       

   }
    
    @IBAction func confirmButtonTapped(_ sender: Any) {
    }
    
    
    @IBAction func declineButtonTapped(_ sender: Any) {
        
    }
    
}
