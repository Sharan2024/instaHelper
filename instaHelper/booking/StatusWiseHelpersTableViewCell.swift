//
//  StatusWiseHelpersTableViewCell.swift
//  instaHelper
//
//  Created by sharanjit Kaur on 22/01/24.
//

import UIKit

class StatusWiseHelpersTableViewCell: UITableViewCell {
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

    }
    private var bookingID: Int?
    func update(with booking: RequestedBookings) {
        bookingID = booking.id
        if let servant = servantDataModel.getAllServants().first(where: { $0.id == bookingID }) {
            NameOfServant.text = servant.name
            ExperienceOfServant.text = "Experience: \(servant.experience) years"
                if booking.status == "Approved" {
                           RequestStatus.text = "Approved"
                       } else if booking.status == "Not responded" {
                           RequestStatus.text = "Not responded"
                           confirmButton.isEnabled = true
                       } else {
                           RequestStatus.text = "Approval Pending"
                           confirmButton.isEnabled = false
                       }
                        let imageName = servant.image
                           helperImage.image = UIImage(named: imageName)
        }
    }
    @IBAction func confirmButtonTapped(_ sender: Any) {
        guard let servantID = bookingID  else {
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
        guard let resident = residentDataModel.getAllResidents().first(where: { $0.houseOwner == "Sharan Sandhu" }) else {
            print("Resident not found for Sharan Sandhu")
            return
        }
        if let requestedBooking = resident.sentRequests.first(where: { $0.id == servantID }) {
            let confirmedBooking = ConfirmedBookings(id: requestedBooking.id,
                                                     dateandTime: requestedBooking.dateandTime,
                                                     price: requestedBooking.price,
                                                     address: requestedBooking.address)
            residentDataModel.addConfirmedBooking(resident: resident, confirmed: confirmedBooking)
            residentDataModel.updateRequestedBookingStatus(residentID: resident.membershipID, bookingID: servantID, newRequestedStatus: "Confirmed")
            print(residentDataModel.getAllResidents())
        }
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
