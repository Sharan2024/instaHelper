//
//  PendingBookTableViewCell.swift
//  instaHelper
//
//  Created by sharanjit Kaur on 19/01/24.
//

import UIKit
protocol YourCellDelegate: AnyObject {
    func didSelectCell(with data: String , and id : Int)
}
class PendingBookTableViewCell: UITableViewCell {
    weak var delegate: YourCellDelegate?

    
    @IBOutlet weak var nameofServantLabel: UILabel!
   
    @IBOutlet weak var serviceLabel: UILabel!
  
    @IBOutlet weak var locationLabel: UILabel!
    
    @IBOutlet weak var priceOfServiceLabel: UILabel!
    
    @IBOutlet weak var dateandTimeLabel: UILabel!
    
    @IBOutlet weak var statusofBookingLabel: UILabel!
    var service : String = "Cook"
    var address : String = "Home"
    var finalId : Int = 0;
    //var finalStatus = ""
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)


        // Get the status or any other data you want to pass
               let status = statusofBookingLabel.text ?? ""
               
               // Notify the delegate (which is the view controller)
        delegate?.didSelectCell(with: status, and: finalId)
           }
    
    func update(with request: RequestedBookings) {

  if let servant = servants.first(where: { $0.id == request.id }) {
      finalId = servant.id
        nameofServantLabel.text = servant.name
        serviceLabel.text = servant.type.rawValue
        locationLabel.text = "📍" + request.address
        priceOfServiceLabel.text = "Rs. " + request.price
        dateandTimeLabel.text = request.dateandTime

        statusofBookingLabel.text = request.status
        if statusofBookingLabel.text == "Approved" {
            statusofBookingLabel.textColor = .green
        } else {
            statusofBookingLabel.textColor = .red
        }
    } else {
        // Handle the case where servant data is not found
        // You can set default values or display an error message
        print("Servant not found for id: \(request.id)")
    }
           statusofBookingLabel.text = request.status
           if statusofBookingLabel.text == "Approved" {
               statusofBookingLabel.textColor = .green
           } else {
               statusofBookingLabel.textColor = .red
           }
       }
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//       let nextVC = segue.destination as! AvailableHelperViewController
//    guard let sender = sender as? UIButton else {return}
//        nextVC.avaiableServant = availableServants
//        
//    }

    
      

}
