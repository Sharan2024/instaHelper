//
//  AddNewAddressViewController.swift
//  instaHelper
//
//  Created by sharanjit Kaur on 23/01/24.
//

import UIKit

class AddNewAddressViewController: UIViewController {

    @IBOutlet weak var FlatNumberTextField: UITextField!
    
    
    @IBOutlet weak var TowerNumberTextField: UITextField!
    
    @IBOutlet weak var nameTextField: UITextField!
    
    @IBOutlet weak var iconTextField: UITextField!
    
    
    @IBOutlet weak var colorWellSelector: UIColorWell!
    
    
    @IBOutlet weak var saveButton: UIBarButtonItem!
    
    var color : UIColor = .white
    override func viewDidLoad() {
        super.viewDidLoad()
        print("New VC")
        
        updateSaveButtonState()

       
    }
    func updateSaveButtonState() {
        let flatText = FlatNumberTextField.text ?? ""
        let TowerText = TowerNumberTextField.text ?? ""
        let nameText = nameTextField.text ?? ""
        let iconText = iconTextField.text ?? ""
//        saveButton.isEnabled = !flatText.isEmpty &&
//        !nameText.isEmpty && !TowerText.isEmpty &&
//        !iconText.isEmpty
        
    }
    @IBAction func cancelButtonTapped(_ sender: Any) {
        dismiss(animated: true)
    }
    
    @IBAction func savedButtontapped(_ sender: Any) {
        
    }
    func colorWellChanged() {
        self.colorWellSelector.addTarget (self, action: #selector (colorWellChanged(_:)), for: .valueChanged)
    }
    @objc func colorWellChanged(_ sender: Any) {
    color = colorWellSelector.selectedColor!
    }
    var newLoction : Address?
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard segue.identifier == "saveButton" else
        { return }
        let flatText = FlatNumberTextField.text ?? ""
        let TowerText = TowerNumberTextField.text ?? ""
        let nameText = nameTextField.text ?? ""
        let iconText = iconTextField.text ?? ""
   newLoction = Address(Name: nameText, flatNumber: Int(flatText) ?? 0, towerNumebr: TowerText, color: color, icon: iconText)
        addressDataModel.addAddress(address: newLoction!)
        print(color)
        //print(addressDataModel.getAllAddresses())
    }
}
