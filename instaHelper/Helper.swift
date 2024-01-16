//
//  Helper.swift
//  instaHelper
//
//  Created by sharanjit Kaur on 12/01/24.
//

import Foundation

// Enum for servant types
enum ServantType: String {
    case cook = "Cook"
    case cleaner = "Cleaner"
    case driver = "Driver"
}
// Enum for food types (for cooks)
enum FoodType: String {
    case veg = "Vegetarian"
    case nonVeg = "Non-Vegetarian"
}
// Enum for cleaning services (for cleaners)
enum CleaningService: String {
    case washrooms = "Washrooms"
    case basicCleaning = "Basic Cleaning"
    case kitchenCleaning = "Kitchen Cleaning"
    case gardenCleaning = "Garden Cleaning"
}

// Enum for driving capabilities (for drivers)
enum DrivingCapability: String {
    case city = "City"
    case outsideCity = "Outside City"
    case both = "both City and Outside City"
}

// Structure to represent time slots
struct TimeSlot {
    var startTime: String
    var endTime: String
    var house: String
}

// Structure to represent information about a servant
struct Servant {
    var type: ServantType
    var name: String
    var image: String // You may use a URL or UIImage, depending on your needs
    var experience: Int
    var rating: Double
    var numberOfReviews: Int
    var workingTimeSlots: [TimeSlot]

    // Additional data based on servant type
    var cookDetails: (foodType: FoodType, specialties: [String])?
    var cleanerDetails: [CleaningService]?
    var driverDetails: (capability: DrivingCapability, vehicleType: String)?
}


let servantA = Servant(
    type: .cook,
    name: "Rajni",
    image: "rajni.jpg",
    experience: 5,
    rating: 4.5,
    numberOfReviews: 20,
    workingTimeSlots: [
        TimeSlot(startTime: "9:00 AM", endTime: "11:00 AM", house: "House 1"),
        TimeSlot(startTime: "11:15 AM", endTime: "12:30 PM", house: "House 2"),
        TimeSlot(startTime: "6:15 PM", endTime: "8:30 PM", house: "House 13"),
       
    ],
    cookDetails: (.veg, ["Italian", "Indian"])
)

let servantB = Servant(
    type: .cleaner,
    name: "Mandeep",
    image: "mandeep.jpg",
    experience: 3,
    rating: 4.0,
    numberOfReviews: 15,
    workingTimeSlots: [
        TimeSlot(startTime: "10:30 AM", endTime: "1:00 PM", house: "House 3"),
        TimeSlot(startTime: "2:00 PM", endTime: "4:30 PM", house: "House 1"),
        TimeSlot(startTime: "6:00 PM", endTime: "7:30 PM", house: "House 13"),
        
    ],
    cleanerDetails: [.washrooms, .basicCleaning, .kitchenCleaning]
)

let servantC = Servant(
    type: .driver,
    name: "Ankush",
    image: "ankush.jpg",
    experience: 7,
    rating: 4.8,
    numberOfReviews: 30,
    workingTimeSlots: [
        TimeSlot(startTime: "8:00 AM", endTime: "10:00 AM", house: "House 4"),
        TimeSlot(startTime: "1:00 PM", endTime: "3:30 PM", house: "House 5"),
        // Add more time slots as needed
    ],
    driverDetails: (.outsideCity, "Sedan")
)
let servantD = Servant(
    type: .driver,
    name: "Ramu",
    image: "Ramu.jpg",
    experience: 7,
    rating: 4.8,
    numberOfReviews: 30,
    workingTimeSlots: [
        TimeSlot(startTime: "9:00 AM", endTime: "11:00 AM", house: "House 6"),
        TimeSlot(startTime: "1:00 PM", endTime: "3:30 PM", house: "House 8"),
       
    ],
    driverDetails: (.both, "Sedan")
)
let servantE = Servant(
    type: .cook,
    name: "Shabham",
    image: "shabham.jpg",
    experience: 5,
    rating: 4.5,
    numberOfReviews: 20,
    workingTimeSlots: [
        TimeSlot(startTime: "9:00 AM", endTime: "11:00 AM", house: "House 9"),
        TimeSlot(startTime: "11:15 AM", endTime: "12:30 PM", house: "House 10"),
        TimeSlot(startTime: "5:15 PM", endTime: "7:30 PM", house: "House 11"),
       
    ],
    cookDetails: (.veg, ["Italian", "Indian", "South Indian"])
)
