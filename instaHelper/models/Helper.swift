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
// Enum for food types
enum FoodType: String {
    case veg = "Vegetarian"
    case nonVeg = "Non-Vegetarian"
}
// Enum for cleaning
enum CleaningService: String {
    case washrooms = "Washrooms"
    case basicCleaning = "Basic Cleaning"
    case kitchenCleaning = "Kitchen Cleaning"
 //   case gardenCleaning = "Garden Cleaning"
}

// Enum for driviers
enum DrivingCapability: String {
    case city = "City"
    case outsideCity = "Outside City"
    case both = "both City and Outside City"
}

// Structure to represent time slots
struct TimeSlot : Equatable{
    var startTime: String
    var endTime: String
    var membershipID: String
    static func == (lhs: TimeSlot, rhs: TimeSlot) -> Bool {
            return lhs.startTime == rhs.startTime && lhs.endTime == rhs.endTime && lhs.membershipID == rhs.membershipID
        }
}

// Structure to represent data of a servant
struct Servant {
    var id : Int
    var type: ServantType
    var name: String
    var gender : String
    var image: String
    var experience: Int
    var rating: Double
    var numberOfReviews: Int
    var workingTimeSlots: [TimeSlot]

  
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
        TimeSlot(startTime: "9:00", endTime: "10:00", membershipID: "M12345"),
        TimeSlot(startTime: "10:00", endTime: "11:00", membershipID: "NA") ,
        TimeSlot(startTime: "11:00", endTime: "12:30", membershipID: "M67834"),
        TimeSlot(startTime: "16:30", endTime: "18:00", membershipID: "NA") ,
        TimeSlot(startTime: "18:15", endTime: "20:30", membershipID: "M67890"),
       
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
        TimeSlot(startTime: "9:00", endTime: "10:30", membershipID: "NA"),
        TimeSlot(startTime: "10:30", endTime: "13:00", membershipID: "M67834"),
        TimeSlot(startTime: "14:00", endTime: "16:30", membershipID: "M12345"),
        TimeSlot(startTime: "18:00", endTime: "19:30", membershipID: "M67890"),
        
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
        TimeSlot(startTime: "8:00", endTime: "10:00", membershipID: "M67964"),
        TimeSlot(startTime: "10:00", endTime: "12:00", membershipID: "NA"),
        TimeSlot(startTime: "13:00", endTime: "15:30", membershipID: "M12345"),
       
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
        TimeSlot(startTime: "9:00", endTime: "11:00", membershipID: "M67789"),
        TimeSlot(startTime: "11:00", endTime: "12:30", membershipID: "NA"),
        TimeSlot(startTime: "13:00", endTime: "15:30", membershipID: "M61464"),
       
    ],
    driverDetails: (.both, "Sedan")
)
let servantE = Servant(
    id: 5, type: .cook,
    name: "Shabham", gender: "Female",
    image: "rajni1.jpg",
    experience: 12,
    rating: 4.5,
    numberOfReviews: 20,
    workingTimeSlots: [
        TimeSlot(startTime: "8:00", endTime: "9:00", membershipID: "M64632"),
        TimeSlot(startTime: "9:00", endTime: "10:00", membershipID: "M53136"),
        TimeSlot(startTime: "10:00", endTime: "12:00", membershipID: "NA"),
        TimeSlot(startTime: "12:15", endTime: "12:30", membershipID: "M61464"),
        TimeSlot(startTime: "16:00", endTime: "17:00", membershipID: "NA"),
        TimeSlot(startTime: "17:15", endTime: "19:30", membershipID: "M68965"),
       
    ],
    cookDetails: (.veg, ["Italian", "Indian", "South Indian"])
)
let servants : [Servant] = [servantA , servantB , servantC , servantD , servantE]


class ServantDataModel {
    private var servants: [Servant] = []
    init() {
        servants.append(Servant(
                id: 1, type: .cook,
                name: "Rajni", gender: "Female",
                image: "rajni.jpg",
                experience: 5,
                rating: 4.5,
                numberOfReviews: 20,
                workingTimeSlots: [
                    TimeSlot(startTime: "9:00", endTime: "10:00", membershipID: "M12345"),
                    TimeSlot(startTime: "10:00", endTime: "11:00", membershipID: "NA") ,
                    TimeSlot(startTime: "12:00", endTime: "12:30", membershipID: "M67834"),
                    TimeSlot(startTime: "16:30", endTime: "18:00", membershipID: "NA") ,
                    TimeSlot(startTime: "18:15", endTime: "20:30", membershipID: "M67890"),
                ],
                cookDetails: (.veg, ["Italian", "Indian"])
            ))
            servants.append(Servant(
                id: 2, type: .cleaner,
                name: "Mandeep", gender: "Female",
                image: "mandeep.jpg",
                experience: 3,
                rating: 4.0,
                numberOfReviews: 15,
                workingTimeSlots: [
                    TimeSlot(startTime: "9:00", endTime: "10:30", membershipID: "NA"),
                    TimeSlot(startTime: "10:30", endTime: "13:00", membershipID: "M67834"),
                    TimeSlot(startTime: "14:00", endTime: "16:30", membershipID: "M12345"),
                    TimeSlot(startTime: "18:00", endTime: "19:30", membershipID: "M67890"),
                ],
                cleanerDetails: [.washrooms, .basicCleaning, .kitchenCleaning]
            ))
        servants.append(Servant(
            id: 3, type: .driver,
            name: "Ankush", gender: "Male",
            image: "ankush.jpg",
            experience: 7,
            rating: 4.8,
            numberOfReviews: 30,
            workingTimeSlots: [
                TimeSlot(startTime: "8:00", endTime: "10:00", membershipID: "M67964"),
                TimeSlot(startTime: "10:00", endTime: "12:00", membershipID: "NA"),
                TimeSlot(startTime: "13:00", endTime: "15:30", membershipID: "M12345"),
               
            ],
            driverDetails: (.outsideCity, "Sedan")))
        servants.append(Servant(
            id: 4, type: .driver,
            name: "Ramu", gender: "Male",
            image: "Ramu.jpg",
            experience: 7,
            rating: 4.8,
            numberOfReviews: 30,
            workingTimeSlots: [
                TimeSlot(startTime: "9:00", endTime: "11:00", membershipID: "M67789"),
                TimeSlot(startTime: "11:00", endTime: "12:30", membershipID: "NA"),
                TimeSlot(startTime: "13:00", endTime: "15:30", membershipID: "M61464"),
               
            ],
            driverDetails: (.both, "Sedan")
        ))
        servants.append(Servant(id: 5, type: .cook,
                        name: "Shabham", gender: "Female",
                        image: "rajni1.jpg",
                        experience: 12,
                        rating: 4.5,
                        numberOfReviews: 20,
                        workingTimeSlots: [
                            TimeSlot(startTime: "8:00", endTime: "9:00", membershipID: "M64632"),
                            TimeSlot(startTime: "9:00", endTime: "10:00", membershipID: "M53136"),
                            TimeSlot(startTime: "10:00", endTime: "11:00", membershipID: "NA"),
                            TimeSlot(startTime: "12:15", endTime: "1:30", membershipID: "M61464"),
                            TimeSlot(startTime: "16:00", endTime: "17:00", membershipID: "NA"),
                            TimeSlot(startTime: "17:15", endTime: "19:30", membershipID: "M68965"),
                        ],
                        cookDetails: (.veg, ["Italian", "Indian", "South Indian"])
                    ))
    }
    func getAllServants() -> [Servant] {
        return self.servants
    }
    func addServant(servant: Servant) {
        self.servants.append(servant)
    }
}
var servantDataModel = ServantDataModel()
