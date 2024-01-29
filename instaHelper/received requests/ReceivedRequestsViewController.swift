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

           // Fetch the received bookings for the resident
           let receivedBookings = resident.receivedBooking
           
           // Ensure that the indexPath.row is within the bounds of receivedBookings array
           guard indexPath.row < receivedBookings.count else {
               return UITableViewCell()
           }
           
           let cell = tableView.dequeueReusableCell(withIdentifier: "RequestReceivedCell", for: indexPath) as! NewReceivedRequestTableViewCell
           let receivedBooking = receivedBookings[indexPath.row]
        // Add a condition to check if the houseOwner is "Sharan Sandhu" and status is "Not responded"
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
    

    override func viewDidLoad() {
        super.viewDidLoad()
        noPendingRequestLabel.isHidden = true
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
    private func reloadTableView() {
            DispatchQueue.main.async {
                self.displayRequestReceivedTable.reloadData()
            }
        }

}
