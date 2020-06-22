//
//  Constants.swift
//  MobileTestiOS
//
//  Created by Liliana on 6/20/20.
//  Copyright © 2020 Test. All rights reserved.
//

import Foundation
import UIKit

struct Constants {
    static let empty: String            = ""
    static let headerView: String       = "HeaderView"
    static let iBackground: String      = "background"
    static let ok: String               = "Ok"
}

public enum NumberCodeCGF : CGFloat{
    case zero           = 0,
    one                 = 1,
    thirty              = 30,
    twoHundredFifty     = 250,
    twoHundredFiftyFive = 255
}

extension UIColor {

    convenience init(hex: Int) {
        let components = (
            R: CGFloat((hex >> 16) & 0xff) / 255,
            G: CGFloat((hex >> 08) & 0xff) / 255,
            B: CGFloat((hex >> 00) & 0xff) / 255
        )

        self.init(red: components.R, green: components.G, blue: components.B, alpha: 1)
    }

}
