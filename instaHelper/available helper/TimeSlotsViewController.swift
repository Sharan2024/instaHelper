//
//  TimeSlotsViewController.swift
//  instaHelper
//
//  Created by sharanjit Kaur on 12/01/24.
//

import UIKit

class TimeSlotsViewController: UIViewController {
    
    @IBOutlet weak var NotAvailableStack: UIStackView!
    
    
    @IBOutlet weak var askApprovalButton: UIButton!
    
    @IBOutlet weak var houseOwnerDetailedStack: UIStackView!
    
    @IBOutlet weak var houseOwnerLabel: UILabel!
    
    @IBOutlet weak var houseNumberLabel: UILabel!
    
    
    @IBOutlet weak var towerNumberLabel: UILabel!
    
    @IBOutlet weak var memberShipIdLabel: UILabel!
    var servantID : Int?
    @IBOutlet weak var buttonScrollView: UIScrollView!
    
  
    var date = ""
    var cost : String = ""
    @IBAction func askApprovalButtonTapped(_ sender: Any) {
        guard let servantID = servantID else {
            print("Invalid servantID")
            return
        }
        let selectedServant = servants.first { $0.id == servantID }
     //   print(selectedServant)
        if let selectedServant = selectedServant,
           let previousTimeSlot = getPreviousWorkingTimeSlot(servant: selectedServant) {
            print("previous time : \(previousTimeSlot.startTime)")
            var datetime = date + previousTimeSlot.startTime
            let booking = RecievedBookings(id: selectedServant.id, name: selectedServant.name, RequesterName: "Sharan Sandhu", dateandTime: datetime, cost: cost ,status: "Not Responded")
            // Send booking request to the resident of the previous working time slot
            if let residentData = getResidentData(forHouseOwner: previousTimeSlot.membershipID) {
               // var updateResidentData = residentData
                residentDataModel.addBooking(resident: residentData, receivedBooking: booking)
                print("Booking request sent to \(residentData.houseOwner)")
                //print(residentDataModel.getAllResidents())
               // print(updateResidentData)
            } else {
                print("Error sending booking request. Resident not found.")
            }
        } else {
            print("Error sending booking request. Previous time slot not found.")
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        print("date is \(date)")
        guard let servantID = servantID,
              let selectedServant = servants.first(where: { $0.id == servantID }) else {
            print("Invalid servantID")
            return
        }
        createButtons(for: selectedServant)
        houseOwnerDetailedStack.isHidden = true
        NotAvailableStack.isHidden = true
    }
    func createButtons(for servant: Servant) {
           let containerView = UIView()
           containerView.frame = CGRect(x: 0, y: 0, width: buttonScrollView.frame.width, height: buttonScrollView.frame.height)

           for (index, timeSlot) in servant.workingTimeSlots.enumerated() {
               let button = UIButton(type: .system)
               button.setTitle("\(timeSlot.startTime) - \(timeSlot.endTime)", for: .normal)
               button.tag = index
               button.addTarget(self, action: #selector(buttonTapped(_:)), for: .touchUpInside)

               // Set button frame and add it to the container view
               button.backgroundColor = UIColor.lightGray
               button.setTitleColor(UIColor.black, for: .normal)
               let buttonWidth: CGFloat = 150.0
               let buttonX = CGFloat(index) * (buttonWidth + 10.0)
               button.frame = CGRect(x: buttonX, y: 0, width: buttonWidth, height: containerView.frame.height)
               containerView.addSubview(button)
           }

           buttonScrollView.addSubview(containerView)
           buttonScrollView.contentSize = CGSize(width: CGFloat(servant.workingTimeSlots.count) * (150.0 + 10.0), height: buttonScrollView.frame.height)
       }
    
    @objc func buttonTapped(_ sender: UIButton) {
        let servantIndex = servantID ?? 0
             let timeSlotIndex = sender.tag

             guard let selectedServant = servants.first(where: { $0.id == servantIndex }),
                   timeSlotIndex < selectedServant.workingTimeSlots.count else {
                 return
             }

             let selectedTimeSlot = selectedServant.workingTimeSlots[timeSlotIndex]
             print("Button tapped for Servant \(servantIndex + 1), House: \(selectedTimeSlot.membershipID)")

        if let residentData = getResidentData(forHouseOwner: selectedTimeSlot.membershipID) {
            houseOwnerDetailedStack.isHidden = false
            NotAvailableStack.isHidden = true
            print("Resident Data:")
            houseOwnerLabel.text = residentData.houseOwner
            houseNumberLabel.text = "#" + residentData.flatNumber
            towerNumberLabel.text = "Tower " + residentData.towerNumber
            memberShipIdLabel.text = residentData.membershipID
            print("House: \(residentData.houseOwner)")
            print("Flat Number: \(residentData.flatNumber)")
            print("Tower Number: \(residentData.towerNumber)")
            print("Membership ID: \(residentData.membershipID)")
        } else {
            houseOwnerDetailedStack.isHidden = true
            NotAvailableStack.isHidden = false
            
            print("Resident not found.")
        }
    }
    func getPreviousWorkingTimeSlot(servant: Servant) -> TimeSlot? {

        for timeSlot in servant.workingTimeSlots {
            //               let startTime = formatter.date(from: timeSlot.startTime) ?? currentDate
            //               let endTime = formatter.date(from: timeSlot.endTime) ?? currentDate
            //
            //               if currentDate >= startTime && currentDate <= endTime {
            //                   // Current time falls within the time slot, return the previous time slot
            if let index = servant.workingTimeSlots.firstIndex(of: timeSlot), index > 0 {
                return servant.workingTimeSlots[index - 1]
            }
        }
        return nil
    }
  
    func getResidentData(forHouseOwner membershipID: String) -> Resident? {
        return residentDataModel.getAllResidents().first { $0.membershipID == membershipID }
    }
    

}
