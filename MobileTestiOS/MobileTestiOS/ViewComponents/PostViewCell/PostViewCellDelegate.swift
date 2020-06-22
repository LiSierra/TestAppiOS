//
//  DelegatePostViewCell.swift
//  MobileTestiOS
//
//  Created by Liliana on 6/21/20.
//  Copyright © 2020 Test. All rights reserved.
//

import Foundation
import UIKit

protocol PostViewCellDelegate: class {
    func buttonFavorite (sender: UIButton)
}
