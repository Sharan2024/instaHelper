//
//  StatusWiseHelpersTableViewCell.swift
//  instaHelper
//
//  Created by sharanjit Kaur on 22/01/24.
//

import UIKit

class StatusWiseHelpersTableViewCell: UITableViewCell {

   // @IBOutlet weak var helperImage: UIImageView!
    var id : Int? = 0;
    
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
         id =  servant
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
        guard let servantID = id  else {
                    return
                }
                let alertController = UIAlertController(title: "Confirm Booking", message: "Are you sure you want to confirm this booking?", preferredStyle: .alert)

                let confirmAction = UIAlertAction(title: "Confirm", style: .default) { [weak self] (action) in
                    self?.handleConfirmation(for: servantID)
                }
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
                alertController.addAction(confirmAction)
        alertController.addAction(cancelAction)
                if let viewController = findViewController() {
                    viewController.present(alertController, animated: true, completion: nil)
                }

        
    }
    private func handleConfirmation(for servantID: Int) {

           print("Booking confirmed for servant ID: \(servantID)")
       }

       private func findViewController() -> UIViewController? {
           var responder: UIResponder? = self
           while let nextResponder = responder?.next {
               if let viewController = nextResponder as? UIViewController {
                   return viewController
               }
               responder = nextResponder
           }
           return nil
       }
    @IBAction func declineButtonTapped(_ sender: Any) {
        
    }
    
}
