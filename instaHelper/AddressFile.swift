//
//  AddressFile.swift
//  instaHelper
//
//  Created by sharanjit Kaur on 27/01/24.
//

import Foundation
import UIKit

struct Addresses: Codable {
    var Name: String
    var flatNumber: Int
    var towerNumebr: String
    var color: String
    var icon: String

    static var archiveURL: URL {
        let documentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
        return documentsDirectory.appendingPathComponent("Addresses").appendingPathExtension("plist")
    }

    // Save addresses to a file
    static func saveToFile(addresses: [Addresses]) {
        let pListEncoder = PropertyListEncoder()

        if let data = try? pListEncoder.encode(addresses) {
            try? data.write(to: archiveURL, options: .noFileProtection)
        }
    }

    // Load addresses from a file
    static func loadFromFile() -> [Addresses]? {
        let pListDecoder = PropertyListDecoder()

        if let dataFromFile = try? Data(contentsOf: archiveURL),
           let decodeData = try? pListDecoder.decode([Addresses].self, from: dataFromFile) {
            return decodeData
        } else {
            return nil
        }
    }

    // Provide a sample address
    static func sampleAddress() -> [Addresses] {
        return [
            Addresses(Name: "Home", flatNumber: 23, towerNumebr: "2", color: "Indigo", icon: "🏡")
        ]
    }
}
var recentAddress: [Addresses] = []
