//
//  TimeSlotsViewController.swift
//  instaHelper
//
//  Created by sharanjit Kaur on 12/01/24.
//

import UIKit

class TimeSlotsViewController: UIViewController {
    
    @IBOutlet weak var NotAvailableStack: UIStackView!
    
    
    @IBOutlet weak var workingSlotServantLabel: UILabel!
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
    var location : String = ""
    
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
            if let residentData = getResidentData(forHouseOwner: previousTimeSlot.membershipID) {
               // var updateResidentData = residentData
                var newSentRequest = RequestedBookings(id: selectedServant.id, dateandTime: date, price: cost, address: location, status: "Pending", house: residentData.houseOwner)
                residentDataModel.addBooking(resident: residentData, receivedBooking: booking)
                residentDataModel.addSentRequest(resident: residentDataModel.getAllResidents()[0], sentRequest: newSentRequest)
                let alertController = UIAlertController(title: "Booking Request Sent", message: "Your booking request has been sent to \(residentData.houseOwner).", preferredStyle: .alert)
                            let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
                            alertController.addAction(okAction)
                            present(alertController, animated: true, completion: nil)

                            print("Booking request sent to \(residentData.houseOwner)")
                            print(residentDataModel.getAllResidents())

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
        workingSlotServantLabel.text = "Working Slots For " + selectedServant.name
    }
    func createButtons(for servant: Servant) {
           let containerView = UIView()
           containerView.frame = CGRect(x: 0, y: 0, width: buttonScrollView.frame.width, height: buttonScrollView.frame.height)
        let totalSlots = servant.workingTimeSlots.count
        let morningColor = UIColor(red: 127/255.0, green: 179/255.0, blue: 221/255.0, alpha: 1.0)
          let eveningColor = UIColor.systemOrange
           for (index, timeSlot) in servant.workingTimeSlots.enumerated() {
               let button = UIButton(type: .system)
               button.setTitle("\(timeSlot.startTime) - \(timeSlot.endTime)", for: .normal)
//               let gradientColor = index <= totalSlots / 2 ? morningColor : eveningColor
//                     button.backgroundColor = gradientColor
               button.tag = index
               button.addTarget(self, action: #selector(buttonTapped(_:)), for: .touchUpInside)
               // Customize button appearance
               button.backgroundColor = UIColor.white
                    button.layer.borderColor = UIColor.black.cgColor
                    button.layer.borderWidth = 1.0
                    button.setTitleColor(UIColor.black, for: .normal)
                    button.setTitleColor(UIColor.blue, for: .selected) // Change to your desired selected color
                    let buttonWidth: CGFloat = 120.0
               let buttonHeight: CGFloat = 60.0 // Adjust the height based on your design
               button.layer.cornerRadius = 10
                    let buttonX = CGFloat(index) * (buttonWidth + 10.0)
                    let buttonY = (containerView.frame.height - buttonHeight) / 2.0

                    button.frame = CGRect(x: buttonX, y: buttonY, width: buttonWidth, height: buttonHeight)

                    containerView.addSubview(button)
                }

        let reducedScrollViewHeight = buttonScrollView.frame.height - 50.0
           buttonScrollView.frame = CGRect(x: buttonScrollView.frame.origin.x, y: buttonScrollView.frame.origin.y, width: buttonScrollView.frame.width, height: reducedScrollViewHeight)

           // Customize scroll view appearance
        let lighterCyanColor = UIColor(
            red: CGFloat(210) / 255.0,
            green: CGFloat(239) / 255.0,
            blue: CGFloat(253) / 255.0,
            alpha: 1.0
        )
        buttonScrollView.backgroundColor =  lighterCyanColor
           buttonScrollView.addSubview(containerView)
           buttonScrollView.contentSize = CGSize(width: CGFloat(servant.workingTimeSlots.count) * (150.0 + 10.0), height: reducedScrollViewHeight)

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
