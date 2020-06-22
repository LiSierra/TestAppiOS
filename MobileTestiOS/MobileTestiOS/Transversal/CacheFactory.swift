//
//  CacheFactory.swift
//  MobileTestiOS
//
//  Created by Liliana on 6/21/20.
//  Copyright © 2020 Test. All rights reserved.
//

import Foundation

class CacheFactory{
    private var cache : ICache!
    private var factoryCache : IFactoryCache!
    private static var shared : CacheFactory?
    
    public static func getIntance() -> CacheFactory{
        if shared == nil{
            shared = CacheFactory()
        }
        return shared!
    }
    
    
    public func setCurrent(cacheFactory : IFactoryCache){
        self.factoryCache = cacheFactory
    }
    
    public func createCache() -> ICache{
        if factoryCache == nil{
            print("Factory Cache nil")
        }
        if cache == nil{
            cache = factoryCache.createCache()
        }
        return cache;
    }
}
