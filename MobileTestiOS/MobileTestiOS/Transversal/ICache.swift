//
//  ICache.swift
//  MobileTestiOS
//
//  Created by Liliana on 6/21/20.
//  Copyright © 2020 Test. All rights reserved.
//

import Foundation

protocol ICache{
    func setObject(key : String, dataPostObject : DataPost)
    func getObject(key : String) -> DataPost?
}
