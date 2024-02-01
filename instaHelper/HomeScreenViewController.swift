//
//  HomeScreenViewController.swift
//  instaHelper
//
//  Created by sharanjit Kaur on 16/01/24.
//

import UIKit

class HomeScreenViewController: UIViewController {
    @IBOutlet weak var HomeButton: UIButton!
    @IBOutlet weak var FamilyButton: UIButton!
    
   
    @IBOutlet weak var cookButton: UIButton!
    @IBOutlet weak var cleanerButton: UIButton!
    @IBOutlet weak var driverButton: UIButton!

    
    var selectedButtonText: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
     //   HomeButton.backgroundColor = UIColor.lightGray
           //    FamilyButton.backgroundColor = UIColor.lightGray
        cookButton.layer.borderColor = UIColor.gray.cgColor
        cookButton.layer.borderWidth = 2
        cookButton.layer.cornerRadius = 10
        cleanerButton.layer.borderColor = UIColor.gray.cgColor
        cleanerButton.layer.borderWidth = 2
        cleanerButton.layer.cornerRadius = 10
        driverButton.layer.borderColor = UIColor.gray.cgColor
        driverButton.layer.borderWidth = 2
        driverButton.layer.cornerRadius = 10
        HomeButton.layer.cornerRadius = HomeButton.frame.size.width/2
        HomeButton.clipsToBounds = true
        FamilyButton.layer.cornerRadius = FamilyButton.frame.size.width/2
        FamilyButton.clipsToBounds = true

    }
    @IBAction func homeButtonTapped(_ sender: UIButton) {
           // Set selected button text
           selectedButtonText = "Home"

           // Update background color for selected button
           HomeButton.backgroundColor = UIColor.systemBlue

        FamilyButton.backgroundColor = UIColor.lightGray

       }

       // Action when Family button is tapped
       @IBAction func familyButtonTapped(_ sender: UIButton) {
           // Set selected button text
           selectedButtonText = "Family"

           // Update background color for selected button
           HomeButton.backgroundColor = UIColor.lightGray
           FamilyButton.backgroundColor = UIColor.systemBlue
       }
    @IBAction func cookTapped(_ sender: UIButton) {
        //        performSegue(withIdentifier: "cookService",
        //           sender: sender)
    }
  @IBAction func cleanerTapped(_ sender: UIButton) {
    //        performSegue(withIdentifier: "cleanerService",
    //           sender: sender)
   }
    @IBAction func driverTapped(_ sender: UIButton) {
        //        performSegue(withIdentifier: "driverService",
        //           sender: sender)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let sender = sender as? UIButton else {return}
      
            let secondVC = segue.destination as! CreateBookingViewController
            
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
