//
//  CachePreferences.swift
//  MobileTestiOS
//
//  Created by Liliana on 6/21/20.
//  Copyright © 2020 Test. All rights reserved.
//

import Foundation

class CachePreferences : ICache{
    
    func setObject(key: String, dataPostObject: DataPost) {
        UserDefaults.standard.set(try? PropertyListEncoder().encode(dataPostObject), forKey:key)
    }
    
    func getObject(key: String) -> DataPost {
        var dataPost: DataPost!

        if let data = UserDefaults.standard.object(forKey: key) as? Foundation.Data {
            
            let dataPostObject = try? PropertyListDecoder().decode(DataPost.self, from: data)
            dataPost = dataPostObject
        }
        return dataPost
    }
    
    
}
