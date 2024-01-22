//
//  PendingBookTableViewCell.swift
//  instaHelper
//
//  Created by sharanjit Kaur on 19/01/24.
//

import UIKit
protocol YourCellDelegate: AnyObject {
    func didSelectCell(with data: String)
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
               delegate?.didSelectCell(with: status)
           }
    
    func update(with servant: Int) {
        
        nameofServantLabel.text = requestedServant.first{ $0.id == servant}?.name
        serviceLabel.text = service
        locationLabel.text = "📍" + address
        priceOfServiceLabel.text = requestedServant.first{ $0.id == servant}?.price
        dateandTimeLabel.text = requestedServant.first{ $0.id == servant}?.dateandTime
        statusofBookingLabel.text = requestedServant.first{ $0.id == servant}?.status
       

   }
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//       let nextVC = segue.destination as! AvailableHelperViewController
//    guard let sender = sender as? UIButton else {return}
//        nextVC.avaiableServant = availableServants
//        
//    }

    
      

}
