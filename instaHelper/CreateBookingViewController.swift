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
    override func viewDidLoad() {
        super.viewDidLoad()
     updateUI()
        // Do any additional setup after loading the view.
    }
    
func updateUI()
    {
        if let service  = service {
            print("service is\(service)")
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

}
