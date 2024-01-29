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
    var approvedRequests: [BookingRequested] = []

   // let approvedRequests = requestedServant.filter { $0.status.lowercased() == "approved" }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        approvedRequests.count
    
    }
    func updateApprovedRequests() {
       approvedRequests = requestedServant.filter { $0.status.lowercased() == finalStatus.lowercased() }
       }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "RequestStatusCell", for: indexPath) as! StatusWiseHelpersTableViewCell
        let ids = approvedRequests.map { $0.id }
     let servant = ids[indexPath.row]
        
       cell.update(with: servant)
        cell.showsReorderControl = true

        return cell

    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let status {
            finalStatus = status
        }
        updateApprovedRequests()
       displayStatusWiseServantTable.dataSource =  self
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
