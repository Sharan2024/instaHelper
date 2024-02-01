//
//  PendingBookingsViewController.swift
//  instaHelper
//
//  Created by sharanjit Kaur on 19/01/24.
//

import UIKit
class PendingBookingsViewController: UIViewController , UITableViewDelegate, UITableViewDataSource , YourCellDelegate{


    var finaldata = ""
    var finalId = 0
    func didSelectCell(with data: String, and id: Int) {
        finaldata = data
        finalId = id
    }
    
   
    @IBOutlet weak var noMoreRequestsLabel: UILabel!
    
    
    @IBOutlet weak var bookingLabel: UILabel!
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destinationViewController = segue.destination as? RequestStatusViewController {
            destinationViewController.status = finaldata
            destinationViewController.helperId = finalId
        }
    }
    var servantId : Int = 1;
    
    @IBOutlet weak var bookingStatusSegmentedControl: UISegmentedControl!
    
    @IBOutlet weak var displayRequestSentTable: UITableView!
    
    func updateView() {
        bookingStatusSegmentedControl.selectedSegmentIndex = 0
        let fontNormal = UIFont.systemFont(ofSize: 18)
        let fontSelected = UIFont.boldSystemFont(ofSize: 20)
        let attributesNormal = [NSAttributedString.Key.font: fontNormal]
        let attributesSelected = [NSAttributedString.Key.font: fontSelected]
       bookingStatusSegmentedControl.setTitleTextAttributes(attributesNormal, for: .normal)
        bookingStatusSegmentedControl.setTitleTextAttributes(attributesSelected, for: .selected)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       
        switch bookingStatusSegmentedControl.selectedSegmentIndex {
        case 0:
            let confirmedRequests = residentDataModel.getAllResidents()
                .first { $0.houseOwner == "Sharan Sandhu" }?.confirmed ?? []
                       return confirmedRequests.count
        case 1:
            let pendingRequests = residentDataModel.getAllResidents()
                           .first { $0.houseOwner == "Sharan Sandhu" }?.sentRequests ?? []
                       return pendingRequests.count
        default:
            return 0
        }
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch bookingStatusSegmentedControl.selectedSegmentIndex {
        case 0:
            noMoreRequestsLabel.isHidden = false
            let cell = tableView.dequeueReusableCell(withIdentifier: "confirmedBookingCell", for: indexPath) as! ConfirmedBookingTableViewCell
            if let chosenResident = residentDataModel.getAllResidents().first(where: { $0.houseOwner == "Sharan Sandhu" }) {
                     let allConfirmedRequests = chosenResident.confirmed
                     if indexPath.row < allConfirmedRequests.count {
                         let request = allConfirmedRequests[indexPath.row]
                         cell.update(with: request)
                         noMoreRequestsLabel.isHidden = true
                         cell.showsReorderControl = true
                         return cell
                     } else {
                         noMoreRequestsLabel.isHidden = false
                     }
            }
                 return UITableViewCell()
            
        case 1:
            noMoreRequestsLabel.isHidden = true
            let cell = tableView.dequeueReusableCell(withIdentifier: "pendingBookingCell", for: indexPath) as! PendingBookTableViewCell
               cell.delegate = self
                // cell.statusDelegate = self
               if let chosenResident = residentDataModel.getAllResidents().first(where: { $0.houseOwner == "Sharan Sandhu" }) {
                   let allChosenRequests = chosenResident.sentRequests
                   
                   // Filter requests with status "Pending" or "Approved"
                   let filteredRequests = allChosenRequests.filter { $0.status == "Pending" || $0.status == "Approved" }
                   if indexPath.row < filteredRequests.count {
                       let request = filteredRequests[indexPath.row]
                       cell.update(with: request)
                       cell.showsReorderControl = true
                       return cell
                   } else {
                       noMoreRequestsLabel.isHidden = false
                   }
               }
               return UITableViewCell()

        default:
                 return UITableViewCell()
        }
    }
    @IBAction func segmentedControlValueChanged(_ sender: UISegmentedControl) {
        displayRequestSentTable.reloadData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateView()
        noMoreRequestsLabel.isHidden = true
        displayRequestSentTable.dataSource =  self
        displayRequestSentTable.delegate = self
    }

    override func viewWillAppear(_ animated: Bool) {
        displayRequestSentTable.reloadData()
    }

}
