//
//  ListPosts.swift
//  MobileTestiOS
//
//  Created by Liliana on 6/21/20.
//  Copyright © 2020 Test. All rights reserved.
//

import Foundation

public struct DataPost: Codable {
    public var collection: Collection?
}

public struct Collection: Codable {
    public var items: [Items]?
}


public struct Items: Codable {
    public var data: [DataR]?
    public var links: [Links]?
}

public struct DataR: Codable {
    public var description: String?
    public var title: String?
    public var data_created: String?
    public var center: String?
    public var media_type: String?
    public var nasa_id: String?
    public var favorite: String?
}


public struct Links: Codable {
    public var href: String?
    
}
