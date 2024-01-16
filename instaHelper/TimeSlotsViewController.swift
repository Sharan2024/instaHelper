//
//  TimeSlotsViewController.swift
//  instaHelper
//
//  Created by sharanjit Kaur on 12/01/24.
//

import UIKit

class TimeSlotsViewController: UIViewController {

    @IBOutlet weak var buttonScrollView: UIScrollView!
    override func viewDidLoad() {
        super.viewDidLoad()
       // createButtonsFromData()
        // Do any additional setup after loading the view.
    }
//    func createButtonsFromData() {
//           for (index, timeSlot) in servantA.timeSlots.enumerated() {
//               let button = UIButton(type: .system)
//               button.setTitle("\( timeSlot.startTime) - \(timeSlot.endTime)", for: .normal)
//               button.addTarget(self, action: #selector(buttonTapped(_:)), for: .touchUpInside)
//               button.tag = index // You can use the tag to identify which button was tapped
//
//               // Customize button appearance if needed
//               button.backgroundColor = UIColor.lightGray
//               button.setTitleColor(UIColor.black, for: .normal)
//
//               // Calculate button frame and add the button to the scroll view
//               let buttonWidth: CGFloat = 150.0
//               let buttonX = CGFloat(index) * (buttonWidth + 10.0) // Adjust spacing as needed
//               button.frame = CGRect(x: buttonX, y: 0, width: buttonWidth, height: buttonScrollView.frame.height)
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
//    }
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

}
