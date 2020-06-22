//
//  FactoryCachePreference.swift
//  MobileTestiOS
//
//  Created by Liliana on 6/21/20.
//  Copyright © 2020 Test. All rights reserved.
//

import Foundation


class FactoryCachePreference : IFactoryCache{
    private var cache : ICache!
    
    func createCache() -> ICache {
        if cache == nil{
            cache = CachePreferences()
        }
        return cache
    }
    
    
}
