//
//  ReceivedRequestsViewController.swift
//  instaHelper
//
//  Created by sharanjit Kaur on 25/01/24.
//

import UIKit

class ReceivedRequestsViewController: UIViewController , UITableViewDelegate , UITableViewDataSource {
    
    
    @IBOutlet weak var displayRequestReceivedTable: UITableView!
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let resident = residentDataModel.getAllResidents().first(where: { $0.houseOwner == "Sharan Sandhu" }) else {
                   print("Resident not found.")
                   return 0
               }
               
               // Return the number of received bookings for the resident
               return resident.receivedBooking.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let resident = residentDataModel.getAllResidents().first(where: { $0.houseOwner == "Sharan Sandhu" }) else {
               print("Resident not found.")
               return UITableViewCell()
           }

           // Fetch the received bookings for the resident
           let receivedBookings = resident.receivedBooking
           
           // Ensure that the indexPath.row is within the bounds of receivedBookings array
           guard indexPath.row < receivedBookings.count else {
               return UITableViewCell()
           }
           
           let cell = tableView.dequeueReusableCell(withIdentifier: "RequestReceivedCell", for: indexPath) as! NewReceivedRequestTableViewCell
           let receivedBooking = receivedBookings[indexPath.row]
           cell.update(with: receivedBooking.id)
           cell.showsReorderControl = true
           return cell
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        displayRequestReceivedTable.dataSource =  self
        displayRequestReceivedTable.delegate = self
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
