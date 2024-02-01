//
//  FinalHomeViewController.swift
//  instaHelper
//
//  Created by sharanjit Kaur on 27/01/24.
//

import UIKit

class FinalHomeViewController: UIViewController {
    
    var addButton: UIButton!
    var addLabel: UILabel!
    
    @IBOutlet weak var myView1: UIView!
    
    @IBOutlet weak var myView2: UIView!
    @IBOutlet weak var myView3: UIView!
    
    @IBOutlet weak var myView4: UIView!
    
    @IBOutlet weak var myView5: UIView!
    
    @IBOutlet weak var parentStackView: UIStackView!
    
    var selectedButtonText: String?
    override func viewDidLoad() {
        super.viewDidLoad()
        recentAddress = [Addresses(Name: "my", flatNumber: 123, towerNumebr: "B", color: "Red", icon: "s") ]

        Addresses.saveToFile(addresses: recentAddress)

        // Ensure that the save operation is successful
        if let loadedAddresses = Addresses.loadFromFile() {
            print("Saved addresses: \(recentAddress)")
            print("Loaded addresses: \(loadedAddresses)")
        } else {
            print("Failed to load addresses from file after saving.")
        }

        if let loadedAddresses = Addresses.loadFromFile() {
            print("Loaded addresses from file: \(loadedAddresses)")
            switch loadedAddresses.count{
            case 0:
                let addNewButton = UIButton()
                addNewButton.setTitle("+", for: .normal)
                addNewButton.backgroundColor = .gray
                addNewButton.layer.cornerRadius = 8
                // addNewButton.addTarget(self, action: #selector(buttonTapped1), for: .touchUpInside)
                myView1.addSubview(addNewButton)
                //
                  case 1:
                       if let address = Addresses.loadFromFile()?.first {
                           let button = UIButton()
                           button.setTitle(address.icon, for: .normal)
                           button.backgroundColor =  UIColor(named: address.color)
                           button.layer.cornerRadius = 8
                         //  button.addTarget(self, action: #selector(addressButtonTapped(_:)), for: .touchUpInside)
                           myView1.addSubview(button)
                
                           button.translatesAutoresizingMaskIntoConstraints = false
                           NSLayoutConstraint.activate([
                            button.centerXAnchor.constraint(equalTo: myView1.centerXAnchor),
                            button.centerYAnchor.constraint(equalTo: myView1.centerYAnchor),
                           ])
                
                           let label = UILabel()
                           label.text = "\(address.Name)"
                           label.textColor = .black
                           myView1.addSubview(label)
                           print(label)
                           label.translatesAutoresizingMaskIntoConstraints = false
                           NSLayoutConstraint.activate([
                            label.centerXAnchor.constraint(equalTo: myView1.centerXAnchor),
                            label.centerYAnchor.constraint(equalTo: myView1.centerYAnchor),
                           ])
                
                           let addNewButton = UIButton()
                           addNewButton.setTitle("+", for: .normal)
                           addNewButton.backgroundColor = .gray
                           addNewButton.layer.cornerRadius = 8
                        //   addNewButton.addTarget(self, action: #selector(buttonTapped1), for: .touchUpInside)
                           myView2.addSubview(addNewButton)
                           addNewButton.translatesAutoresizingMaskIntoConstraints = false
                           NSLayoutConstraint.activate([
                            addNewButton.centerXAnchor.constraint(equalTo: myView2.centerXAnchor),
                            addNewButton.centerYAnchor.constraint(equalTo: myView2.centerYAnchor),
                           ])
                           let addlabel = UILabel()
                           addlabel.text = "Add New"
                           addlabel.textColor = .black
                           myView2.addSubview(addlabel)
                
                           addlabel.translatesAutoresizingMaskIntoConstraints = false
                           NSLayoutConstraint.activate([
                            addlabel.centerXAnchor.constraint(equalTo: myView2.centerXAnchor),
                            addlabel.centerYAnchor.constraint(equalTo: myView2.centerYAnchor),
                           ])
                       }
              
                //        // case 2:
                //        // case 3:
            default : print("Default!")
            }
            
        }
    }
    @IBAction func unwindToHomeScreen(unwindSegue: UIStoryboardSegue) {
        guard unwindSegue.identifier == "saveButton",
              let sourceVC = unwindSegue.source as? AddNewAddressViewController,
              let newAddress = sourceVC.newLoction else {
            return
        }

       // recentAddress = [newAddress]  // Update the recentAddress array with the new address

        Addresses.saveToFile(addresses: recentAddress)
        if let loadedAddresses = Addresses.loadFromFile() {
            print("Saved addresses: \(recentAddress)")
            print("Loaded addresses: \(loadedAddresses)")
        } else {
            print("Failed to load addresses from file after saving.")
        }
    }
        
        //    @objc func buttonTapped1() {
        //
        //               print("Button tapped!")
        //               performSegue(withIdentifier: "addAddress", sender: nil)
        //           }
        //
        //    @objc func addressButtonTapped(_ sender: UIButton) {
        //
        //           print("Address Button Tapped")
//        //       }
//        @IBAction func unwindToHomeScreen(unwindSegue: UIStoryboardSegue) {
//            guard unwindSegue.identifier == "saveButton", let sourceVC = unwindSegue.source as? AddNewAddressViewController, let newAddress = sourceVC.newLoction else {
//                return
//            }
//            
//            if var savedAddresses = Addresses.loadFromFile() {
//                savedAddresses.append(newAddress)
//                Addresses.saveToFile(addresses: savedAddresses)
//            } else {
//                Addresses.saveToFile(addresses: [newAddress])
//            }
//        }
//        
//        //    @IBAction func buttonTapped(_ sender: UIButton) {
//        //
//        //            sender.isEnabled = false
//        ////
//        ////            if sender == homeButton {
//        ////                familyButton.isEnabled = true
//        ////                selectedButtonText = homeLabel.text
//        ////            } else if sender == familyButton {
//        ////                homeButton.isEnabled = true
//        ////                selectedButtonText = familyLabel.text
//        ////            }
//        //
//        //            // Use selectedButtonText as needed
//        //            if let selectedText = selectedButtonText {
//        //                print("Selected Button Text: \(selectedText)")
//        //            }
//        //        }
//        
  }

