//
//  PendingBookingsViewController.swift
//  instaHelper
//
//  Created by sharanjit Kaur on 19/01/24.
//

import UIKit
class PendingBookingsViewController: UIViewController , UITableViewDelegate , UITableViewDataSource , YourCellDelegate{
    var finaldata = ""
    func didSelectCell(with data: String) {
          finaldata = data
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destinationViewController = segue.destination as? RequestStatusViewController {
            destinationViewController.status = finaldata
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
                return bookedServant.count
        case 1:
                return requestedServant.count
        case 2:
            return receivedRequestBooking.count
        default:
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch bookingStatusSegmentedControl.selectedSegmentIndex {
        case 0:
           
                let cell = tableView.dequeueReusableCell(withIdentifier: "confirmedBookingCell", for: indexPath) as! ConfirmedBookingTableViewCell
            let servant = bookedServant[indexPath.row]
            servantId = servant.id
            cell.update(with: servantId)
            cell.showsReorderControl = true
                return cell
        case 1:
          
        let cell = tableView.dequeueReusableCell(withIdentifier: "pendingBookingCell", for: indexPath) as! PendingBookTableViewCell
            cell.delegate = self
            let servant = requestedServant[indexPath.row]
            servantId = servant.id
            cell.update(with: servantId)
            cell.showsReorderControl = true
                return cell
        case 2:
            let cell = tableView.dequeueReusableCell(withIdentifier: "RequestReceivedBookingCell", for: indexPath) as! RequestReceivedTableViewCell
                let servant = receivedRequestBooking[indexPath.row]
            servantId = servant.id
                cell.update(with: servantId)
                cell.showsReorderControl = true
                    return cell
        default:
            return UITableViewCell()
        }
        
    }
    
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        guard let cell = tableView.cellForRow(at: indexPath) as? PendingBookTableViewCell else {
//              return
//          }
//          
//          let selectedData = // Get the data for the selected cell
//          
//          cell.delegate?.didSelectCell(with: selectedData)
//        }
    
    @IBAction func segmentedControlValueChanged(_ sender: UISegmentedControl) {
        displayRequestSentTable.reloadData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateView()
        displayRequestSentTable.dataSource =  self
        displayRequestSentTable.delegate = self
    }
    override func viewWillAppear(_ animated: Bool) {
        bookingStatusSegmentedControl.selectedSegmentIndex = 0
        displayRequestSentTable.reloadData()
    }

}
