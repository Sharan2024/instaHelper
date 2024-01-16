//
//  Residents.swift
//  instaHelper
//
//  Created by sharanjit Kaur on 15/01/24.
//

import Foundation
struct Resident {
    var houseOwner: String
    var flatNumber: String
    var towerNumber: String
    var membershipID: String
}

let residents = [
    Resident(houseOwner: "Anish Gupta", flatNumber: "101", towerNumber: "A", membershipID: "M12345"),
    Resident(houseOwner: "Vikas Goyal", flatNumber: "202", towerNumber: "B", membershipID: "M67890"),
    Resident(houseOwner: "Anita Singla", flatNumber: "203", towerNumber: "B", membershipID: "M67834")
]
