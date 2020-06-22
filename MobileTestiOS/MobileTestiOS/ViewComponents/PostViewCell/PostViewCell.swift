//
//  PostViewCell.swift
//  MobileTestiOS
//
//  Created by Liliana on 6/20/20.
//  Copyright © 2020 Test. All rights reserved.
//

import Foundation
import UIKit

class PostViewCell: UITableViewCell{
    
   
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var imgPost: UIImageView!
    
    weak var delegate: PostViewCellDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func setTitle(text: String) {
        self.lblTitle.text = text
    }
    
    func setImage(image: UIImage) {
        self.imgPost.image = image
    }

    @IBAction func buttonFavorite(_ sender: UIButton) {
        self.delegate?.buttonFavorite(sender: sender)
    }
}
