//
//  Address.swift
//  instaHelper
//
//  Created by sharanjit Kaur on 23/01/24.
//

import Foundation
import UIKit

struct Address {
    var Name : String
    var flatNumber : Int
    var towerNumebr : String
    var color : UIColor
    var icon : String
}

var addresses = [Address(Name: "Home", flatNumber: 23, towerNumebr: "2", color: .systemIndigo, icon: "🏡") ]

class AddressDataModel {
    private var address: [Address] = []
    init() {
        address.append(Address(Name: "Home", flatNumber: 23, towerNumebr: "2", color: .systemIndigo, icon: "🏡"))
        
    }
    func getAllAddresses() -> [Address] { return self.address }
    func addAddress(address: Address) { self.address.append(address)}

}
var addressDataModel = AddressDataModel()

