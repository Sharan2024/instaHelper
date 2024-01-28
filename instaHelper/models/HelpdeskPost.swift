//
//  HelpdeskPost.swift
//  instaHelper
//
//  Created by sharanjit Kaur on 23/01/24.
//

import Foundation

struct PostData {
    var name: String
    var membershipId: String
    var postContent: String
    var totalComments: Int
}

var posts = [PostData(name: "Sharan Sandhu", membershipId: "H15043", postContent: "Hi , can anyone give reference of a cook for the evening time on regular basis", totalComments: 0) , PostData(name: "Anish Gupta", membershipId: "M12345", postContent: "I have bought a new car. Can you please recommend your personal car cleaning person ?", totalComments: 0)]
