//
//  RequestStatusViewController.swift
//  instaHelper
//
//  Created by sharanjit Kaur on 22/01/24.
//

import UIKit

class RequestStatusViewController: UIViewController , UITableViewDelegate , UITableViewDataSource {
    
    @IBOutlet weak var displayStatusWiseServantTable: UITableView!
    
    var status : String?
   var finalStatus = ""
    var helperId = 0;
    var receivedId : Int = 0;
    var id : Int?
    var approvedRequests: [RequestedBookings] = []

   // let approvedRequests = requestedServant.filter { $0.status.lowercased() == "approved" }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return approvedRequests.count
    
    }
    func updateApprovedRequests() {
        guard let resident = residentDataModel.getAllResidents().first(where: { $0.houseOwner == "Sharan Sandhu"}) else {
                print("Resident not found.")
                return
            }
        approvedRequests = resident.sentRequests.filter {$0.id == helperId }
       }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "RequestStatusCell", for: indexPath) as! StatusWiseHelpersTableViewCell
        let booking = approvedRequests[indexPath.row]
             cell.update(with: booking)
             cell.showsReorderControl = true
        return cell
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        if let status = status {
                  finalStatus = status
              }
        if let id = id {
            helperId = id;
        }
              updateApprovedRequests()
              displayStatusWiseServantTable.dataSource = self
              displayStatusWiseServantTable.delegate = self
              print(finalStatus)
    }
    @objc func showDialog() {
        let alertController = UIAlertController(title: "Confirmation", message: "Your booking has been confirmed", preferredStyle: .alert)
        let okAction = UIAlertAction(title: "Done", style: .default) { (action) in

        }
        alertController.addAction(okAction)
        present(alertController, animated: true, completion: nil)
    }
}
