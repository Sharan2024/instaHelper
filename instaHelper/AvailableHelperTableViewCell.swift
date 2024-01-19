//
//  AvailableHelperTableViewCell.swift
//  instaHelper
//
//  Created by sharanjit Kaur on 12/01/24.
//

import UIKit

class AvailableHelperTableViewCell: UITableViewCell {

    @IBOutlet weak var helperImage: UIImageView!
    
    @IBOutlet weak var experienceofHelper: UILabel!
    
    @IBOutlet weak var nameofHelper: UILabel!
    
    @IBOutlet weak var genderofHelper: UILabel!
    
    @IBOutlet weak var ratingHelper: UILabel!
    
    
    @IBOutlet weak var reviewsOfHelper: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
   
 func update(with servant: Int) {
     nameofHelper.text = servants.first{ $0.id == servant}?.name
     let reviews: Int? = servants.first{ $0.id == servant}?.numberOfReviews
     if let reviews {
         reviewsOfHelper.text = String(reviews)
         print(reviews)
     }
     /// Servant Image
     let imageName: String? = servants.first{ $0.id == servant }?.image
     print(imageName)
     if let imageName {
         helperImage.image = UIImage(named: imageName)
         print(helperImage)
         print(imageName)
     } else {
         print("Cant fetch image name")
     }
     let experience: Int? = servants.first{ $0.id == servant}?.experience
     if let experience {
         experienceofHelper.text = String(experience) + " years of experience"
         print(experience)
     }
     let rating: Double? = servants.first{ $0.id == servant}?.rating
     if let rating {
        ratingHelper.text = String(rating)
         print(rating)
     }
     let gender : String? = servants.first{ $0.id == servant}?.gender
     if let gender {
       genderofHelper.text = String(gender)
         print(gender)
     }

}
   

    

}
