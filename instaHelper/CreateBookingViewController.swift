//
//  CreateBookingViewController.swift
//  instaHelper
//
//  Created by sharanjit Kaur on 16/01/24.
//

import UIKit

class CreateBookingViewController: UIViewController {
    var service : String?
    var address : String?
   var availableServants : [Servant] = []
    @IBOutlet weak var datePicker: UIDatePicker!
    
    @IBOutlet weak var timePicker: UIDatePicker!
    
    @IBOutlet weak var hoursLabel: UILabel!
    
    @IBOutlet weak var numberOfHoursStepper: UIStepper!
    
    @IBOutlet weak var offerPriceTextField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
     updateUI()
        // Do any additional setup after loading the view.
    }
    
func updateUI()
    {
        if let service  = service {
            print("Service is\(service)")
        }
        if let address  = address {
            print("Address is\(address)")
        }
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

    
    @IBAction func numberOfHoursChanged(_ sender: Any) {
        hoursLabel.text =   "\(Double(numberOfHoursStepper.value))"

    }
    
    @IBAction func findHelperButtonTapper(_ sender: Any) {
        let selectedDate = datePicker.date
      //  print(selectedDate)
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        let formattedDate = dateFormatter.string(from: selectedDate)
       // print(formattedDate)
        let selectedTime = timePicker.date

        // Use a DateFormatter to display only the time component
        let timeFormatter = DateFormatter()
        timeFormatter.dateFormat = "HH:mm"

        let formattedTime = timeFormatter.string(from: selectedTime)
        let offer = offerPriceTextField.text
      availableServants = findAvailableServants(selectedTime: formattedTime, selectedService: service!)
        if !availableServants.isEmpty {
            print("Available servants:")
            for servant in availableServants {
                
                print("Servant ID: \(servant.id), Name: \(servant.name)")
                
            }
        } else {
            print("No available servants for the selected time and service.")
        }
        
    
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
       let nextVC = segue.destination as! AvailableHelperViewController
    guard let sender = sender as? UIButton else {return}
        nextVC.avaiableServant = availableServants
        
    }
    func findAvailableServants(selectedTime: String, selectedService: String) -> [Servant] {
        var availableServants: [Servant] = []

        for servant in servants {
                // Check if the servant type matches and house is "NA"
            print(servant.type.rawValue)
                guard servant.type.rawValue.lowercased() == selectedService.lowercased() else {
                    continue
                }
                    for timeSlot in servant.workingTimeSlots {
                        if timeSlot.house.lowercased() == "na", selectedTime == timeSlot.startTime
                            {
                            availableServants.append(servant)
                            break
                        }
                    }
                }
        return availableServants
    }

    
    
}
