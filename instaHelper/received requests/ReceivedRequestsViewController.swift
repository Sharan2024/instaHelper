//
//  ReceivedRequestsViewController.swift
//  instaHelper
//
//  Created by sharanjit Kaur on 25/01/24.
//

import UIKit

class ReceivedRequestsViewController: UIViewController , UITableViewDelegate , UITableViewDataSource {
    @IBOutlet weak var noPendingRequestLabel: UILabel!
    @IBOutlet weak var displayRequestReceivedTable: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        noPendingRequestLabel.isHidden = true
        displayRequestReceivedTable.dataSource =  self
        displayRequestReceivedTable.delegate = self
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let resident = residentDataModel.getAllResidents().first(where: { $0.houseOwner == "Sharan Sandhu" }) else {
                   print("Resident not found.")
                   return 0
               }
        let count = resident.receivedBooking.count
       
               return count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let resident = residentDataModel.getAllResidents().first(where: { $0.houseOwner == "Sharan Sandhu" }) else {
               print("Resident not found.")
               return UITableViewCell()
           }
           let receivedBookings = resident.receivedBooking
           guard indexPath.row < receivedBookings.count else {
               return UITableViewCell()
           }
           let cell = tableView.dequeueReusableCell(withIdentifier: "RequestReceivedCell", for: indexPath) as! NewReceivedRequestTableViewCell
           let receivedBooking = receivedBookings[indexPath.row]
               if resident.houseOwner == "Sharan Sandhu" && receivedBooking.status == "Not responded" {
                   cell.isHidden = false
                   cell.update(with: receivedBooking.id)
                   cell.showsReorderControl = true
               } else {
                   cell.isHidden = true
                   noPendingRequestLabel.isHidden = false
               }
                   return cell
    }
}
