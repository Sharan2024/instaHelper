//
//  NewReceivedRequestTableViewCell.swift
//  instaHelper
//
//  Created by sharanjit Kaur on 25/01/24.
//

import UIKit

class NewReceivedRequestTableViewCell: UITableViewCell {

    @IBOutlet weak var nameOfServantLabel: UILabel!
    
    @IBOutlet weak var dateandTimeLabel: UILabel!
    
    
    @IBOutlet weak var requesterNameLabel: UILabel!
    
    var bookingID : Int?
   
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

       
    }
    func update(with servant: Int) {
        guard let resident = residentDataModel.getAllResidents().first(where: { $0.houseOwner == "Sharan Sandhu"}) else {
                print("Resident not found.")
                return
            }
            let booking = resident.receivedBooking.first { $0.id == servant }
            bookingID = booking?.id
            nameOfServantLabel.text = booking?.name
            requesterNameLabel.text = "Requested By :" + (booking!.RequesterName)
    
        dateandTimeLabel.text = booking!.dateandTime + " AM" + " (Rs."+booking!.cost + " )"

     //   statusofBookingLabel.text = requestedServant.first{ $0.id == servant}?.status
       

   }
    
    @IBAction func acceptButtonTapped(_ sender: Any) {
        let alertController = UIAlertController(title: "Accept Request", message: "Are you sure you want to accept this request?", preferredStyle: .alert)

          let acceptAction = UIAlertAction(title: "Accept", style: .default) { _ in
              // Update the booking status to "Accepted"
             residentDataModel.updateBookingStatus(residentID: "M53136", bookingID: self.bookingID!, newStatus: "Accepted")
              print(residentDataModel.getAllResidents())
              if let tableView = self.superview as? UITableView {
                          tableView.reloadData()
                      }
           
          }

          let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)

          alertController.addAction(acceptAction)
          alertController.addAction(cancelAction)
          if let viewController = UIApplication.shared.keyWindow?.rootViewController {
              viewController.present(alertController, animated: true, completion: nil)
          }
    
    }
    
    @IBAction func requestButtonTapped(_ sender: Any) {
        residentDataModel.updateBookingStatus(residentID: "M53136", bookingID: bookingID!, newStatus: "Cancelled")
        print(residentDataModel.getAllResidents())
        if let tableView = self.superview as? UITableView {
                    tableView.reloadData()
                }
    }

    
}
