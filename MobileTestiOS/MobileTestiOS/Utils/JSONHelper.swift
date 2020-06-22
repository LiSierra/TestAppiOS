//
//  JSONHelper.swift
//  MobileTestiOS
//
//  Created by Liliana on 6/21/20.
//  Copyright © 2020 Test. All rights reserved.
//

import Foundation

class JSONHelper {
    //MARK: - Method for deserialize JSON
    static func deserialize<T>(_ object: [AnyHashable: Any], type: T.Type) -> T? where T: Codable {
       do {
           guard let data = try? JSONSerialization.data(withJSONObject:object,
                                                        options: .prettyPrinted) else { return nil }
           return try JSONDecoder().decode(type, from: data)
       } catch let error {
           print(">> Error Get/Parese as Data Custom =\(error.localizedDescription) !!")
       }
       return nil
    }
    
    //MARK: - Method for serialize JSON
    static func serialize<T>(value: T) -> [AnyHashable: Any] where T: Codable {
       do {
           let data = try JSONEncoder().encode(value)
        return try (JSONSerialization.jsonObject(with: data, options: .allowFragments) as? [String : Any] ?? [:])
       } catch {
           return [:]
       }
    }

}

