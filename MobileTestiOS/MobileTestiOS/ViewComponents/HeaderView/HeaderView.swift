//
//  HeaderView.swift
//  MobileTestiOS
//
//  Created by Liliana on 6/20/20.
//  Copyright © 2020 Test. All rights reserved.
//

import Foundation
import UIKit

class HeaderView: BaseView {
    
    @IBOutlet weak var headerTitle: UILabel!
    @IBOutlet weak var backButton: UIButton!
    
    override var nibName: String {
        get {
            return Constants.headerView
        }
    }
    
    weak var delegate: HeaderViewDelegate?

    @IBInspectable var title: String = Constants.empty {
           didSet {
               headerTitle.text = title
           }
       }
    
    @IBInspectable var isVisible: Bool {
        get {
            return self.backButton.isHidden
        }

        set {
            self.backButton.isHidden = newValue
        }
    }
    
    @IBAction func backButtonPressed(_ sender: UIButton) {
        self.delegate?.backButton(sender: sender)
    }
    
}
