//
//  HomeScreenViewController.swift
//  instaHelper
//
//  Created by sharanjit Kaur on 16/01/24.
//

import UIKit

class HomeScreenViewController: UIViewController {

    @IBOutlet weak var cookButton: UIButton!
    @IBOutlet weak var cleanerButton: UIButton!
    @IBOutlet weak var driverButton: UIButton!
    
    @IBOutlet weak var homeButton: UIButton!
    
    @IBOutlet weak var familyButton: UIButton!
    
    @IBOutlet weak var homeLabel: UILabel!
    
    
    @IBOutlet weak var familyLabel: UILabel!
    
    var selectedButtonText: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func buttonTapped(_ sender: UIButton) {
           
            sender.isEnabled = false

            if sender == homeButton {
                familyButton.isEnabled = true
                selectedButtonText = homeLabel.text
            } else if sender == familyButton {
                homeButton.isEnabled = true
                selectedButtonText = familyLabel.text
            }

            // Use selectedButtonText as needed
            if let selectedText = selectedButtonText {
                print("Selected Button Text: \(selectedText)")
            }
        }
    
//    @IBAction func cookTapped(_ sender: UIButton) {
//        performSegue(withIdentifier: "cookService",
//           sender: sender)
//    }
//    @IBAction func cleanerTapped(_ sender: UIButton) {
//        performSegue(withIdentifier: "cleanerService",
//           sender: sender)
//    }
//    @IBAction func driverTapped(_ sender: UIButton) {
//        performSegue(withIdentifier: "driverService",
//           sender: sender)
//    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
       let secondVC = segue.destination as! CreateBookingViewController
    guard let sender = sender as? UIButton else {return}
        if sender == cookButton {
            secondVC.service = "Cook"
            secondVC.address = selectedButtonText
           
        }
        else if sender == cleanerButton {
            secondVC.service = "Cleaner"
            secondVC.address = selectedButtonText
          
        }
        else {
            secondVC.service = "Driver"
            secondVC.address = selectedButtonText
           
        }
    }

}
