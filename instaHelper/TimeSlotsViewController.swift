//
//  TimeSlotsViewController.swift
//  instaHelper
//
//  Created by sharanjit Kaur on 12/01/24.
//

import UIKit

class TimeSlotsViewController: UIViewController {

    var servant : Int = 1;
    @IBOutlet weak var buttonScrollView: UIScrollView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let selectedServant = servants.first { $0.id == servant }
        
        // Create buttons based on the selected servant's working time slots
        if let selectedServant = selectedServant {
            
            let containerView = UIView()
            containerView.frame = CGRect(x: 0, y: 0, width: buttonScrollView.frame.width, height: buttonScrollView.frame.height)
            
            // Create buttons for each working time slot
            for (index, timeSlot) in selectedServant.workingTimeSlots.enumerated() {
                let button = UIButton(type: .system)
                button.setTitle("\(timeSlot.startTime) - \(timeSlot.endTime)", for: .normal)
                button.tag = index // Set a tag to identify the button
                button.addTarget(self, action: #selector(buttonTapped(_:)), for: .touchUpInside)
                
                // Set button frame and add it to the container view
                button.backgroundColor = UIColor.lightGray
                button.setTitleColor(UIColor.black, for: .normal)
                let buttonWidth: CGFloat = 150.0
                let buttonX = CGFloat(index) * (buttonWidth + 10.0) // Adjust spacing as needed
                button.frame = CGRect(x: buttonX, y: 0, width: buttonWidth, height: containerView.frame.height)
                containerView.addSubview(button)
            }
            
            // Add the container view to the scroll view
            buttonScrollView.addSubview(containerView)
            
            
            // Set the content size of the scroll view based on the container views
            buttonScrollView.contentSize = CGSize(width: CGFloat(servants.count) * buttonScrollView.frame.width, height: buttonScrollView.frame.height)
        }
    }

            @objc func buttonTapped(_ sender: UIButton) {
                // Handle button tap using the tag or any other identifier
                let servantIndex = sender.superview?.tag ?? 0
                let timeSlotIndex = sender.tag

                let selectedTimeSlot = servants[servantIndex].workingTimeSlots[timeSlotIndex]
                print("Button tapped for Servant \(servantIndex + 1), House: \(selectedTimeSlot.house)")
            }
    }
         //  button.setTitle("\(timeSlot.startTime) - \(timeSlot.endTime)", for: .normal)
        //   button.addTarget(self, action: #selector(buttonTapped(_:)), for: .touchUpInside)
         // button.tag = index // You can use the tag to identify which button was tapped
//
//               // Customize button appearance if needed
//               button.backgroundColor = UIColor.lightGray
//               button.setTitleColor(UIColor.black, for: .normal)
//
//               // Calculate button frame and add the button to the scroll view
//               let buttonWidth: CGFloat = 150.0
//               let buttonX = CGFloat(index) * (buttonWidth + 10.0) // Adjust spacing as needed
//               button.frame = CGRect(x: buttonX, y: 0, width: buttonWidth, height:          buttonScrollView.frame.height)
//
//               buttonScrollView.addSubview(button)
//           }
//
//           // Set the content size of the scroll view based on the buttons
//           buttonScrollView.contentSize = CGSize(width: CGFloat(servantA.timeSlots.count) * (100.0 + 10.0), height: buttonScrollView.frame.height)
//       }
//    @objc func buttonTapped(_ sender: UIButton) {
//            // Handle button tap, you can use the sender.tag to identify the tapped button
//            print("Button tapped at index: \(sender.tag)")
//        }
//   func getResidentData(forHouseOwner houseOwner: String) -> Resident? {
//       return residents.first { $0.houseOwner == houseOwner }
       // }
//
////    if let residentData = getResidentData(forHouseOwner: "John Doe") {
////        print("Resident Data:")
////        print("House Owner: \(residentData.houseOwner)")
////        print("Flat Number: \(residentData.flatNumber)")
////        print("Tower Number: \(residentData.towerNumber)")
////        print("Membership ID: \(residentData.membershipID)")
////    } else {
////        print("Resident not found.")
////    }
//
//    /*
//    // MARK: - Navigation
//
//    // In a storyboard-based application, you will often want to do a little preparation before navigation
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        // Get the new view controller using segue.destination.
//        // Pass the selected object to the new view controller.
//    }
//    */


