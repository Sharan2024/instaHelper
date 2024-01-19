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
    var id : Int
    var type: ServantType
    var name: String
    var gender : String
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
    id: 1, type: .cook,
    name: "Rajni", gender: "Female",
    image: "rajni.jpg",
    experience: 5,
    rating: 4.5,
    numberOfReviews: 20,
    workingTimeSlots: [
        TimeSlot(startTime: "9:00", endTime: "10:00", house: "Anish Gupta"),
        TimeSlot(startTime: "10:00", endTime: "11:00", house: "NA") ,
        TimeSlot(startTime: "11:15", endTime: "12:30", house: "Anita Singla"),
        TimeSlot(startTime: "16:30", endTime: "18:00", house: "NA") ,
        TimeSlot(startTime: "18:15", endTime: "20:30", house: "Vikas Goyal"),
       
    ],
    cookDetails: (.veg, ["Italian", "Indian"])
)

let servantB = Servant(
    id: 2, type: .cleaner,
    name: "Mandeep", gender: "Female",
    image: "mandeep.jpg",
    experience: 3,
    rating: 4.0,
    numberOfReviews: 15,
    workingTimeSlots: [
        TimeSlot(startTime: "9:00", endTime: "10:30", house: "NA"),
        TimeSlot(startTime: "10:30", endTime: "13:00", house: "Anita Singla"),
        TimeSlot(startTime: "14:00", endTime: "16:30", house: "Anish Gupta"),
        TimeSlot(startTime: "18:00", endTime: "19:30", house: "Vikas Goyal"),
        
    ],
    cleanerDetails: [.washrooms, .basicCleaning, .kitchenCleaning]
)

let servantC = Servant(
    id: 3, type: .driver,
    name: "Ankush", gender: "Male",
    image: "ankush.jpg",
    experience: 7,
    rating: 4.8,
    numberOfReviews: 30,
    workingTimeSlots: [
        TimeSlot(startTime: "8:00", endTime: "10:00", house: "Shikha"),
        TimeSlot(startTime: "10:00", endTime: "12:00", house: "NA"),
        TimeSlot(startTime: "13:00", endTime: "15:30", house: "Anish Gupta"),
       
    ],
    driverDetails: (.outsideCity, "Sedan")
)
let servantD = Servant(
    id: 4, type: .driver,
    name: "Ramu", gender: "Male",
    image: "Ramu.jpg",
    experience: 7,
    rating: 4.8,
    numberOfReviews: 30,
    workingTimeSlots: [
        TimeSlot(startTime: "9:00", endTime: "11:00", house: "Amanpreet Singh"),
        TimeSlot(startTime: "11:00", endTime: "12:30", house: "NA"),
        TimeSlot(startTime: "13:00", endTime: "15:30", house: "Manmeet Kaur"),
       
    ],
    driverDetails: (.both, "Sedan")
)
let servantE = Servant(
    id: 5, type: .cook,
    name: "Shabham", gender: "Female",
    image: "shabham.jpg",
    experience: 5,
    rating: 4.5,
    numberOfReviews: 20,
    workingTimeSlots: [
        TimeSlot(startTime: "8:00", endTime: "10:00", house: "Shanky Goya"),
        TimeSlot(startTime: "10:00", endTime: "11:00", house: "NA"),
        TimeSlot(startTime: "11:15", endTime: "12:30", house: "Manmeet Kaur"),
        TimeSlot(startTime: "16:00", endTime: "17:00", house: "NA"),
        TimeSlot(startTime: "17:15", endTime: "19:30", house: "Anupinder Singh"),
       
    ],
    cookDetails: (.veg, ["Italian", "Indian", "South Indian"])
)
let servants : [Servant] = [servantA , servantB , servantC , servantD , servantE]
