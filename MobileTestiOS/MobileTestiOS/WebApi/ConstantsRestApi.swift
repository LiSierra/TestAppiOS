//
//  ConstantsRestApi.swift
//  MobileTestiOS
//
//  Created by Liliana on 6/21/20.
//  Copyright © 2020 Test. All rights reserved.
//

import Foundation

struct ConstantsResApi{
    static let baseUrl : String = "https://images-api.nasa.gov/"
    static let endPoint : String = "search"
    static let apiKey : String = "apollo%2011"
    static let keyApiKey : String = "?q="+apiKey
    static let keyGetPost : String = endPoint+keyApiKey
}
