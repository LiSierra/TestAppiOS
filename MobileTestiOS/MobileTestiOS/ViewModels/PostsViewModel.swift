//
//  PostsViewModel.swift
//  MobileTestiOS
//
//  Created by Liliana on 6/21/20.
//  Copyright © 2020 Test. All rights reserved.
//

import Foundation
class PostsViewModel {
    var collectionPosts : DataPost?
    
    func getListPosts(completion: @escaping () -> Void){
        let url : String = ConstantsResApi.baseUrl+ConstantsResApi.keyGetPost
               AccessApi.init().getListPosts(completion: { (responseObject, error) in
                   print(responseObject)
                   let response = JSONHelper.deserialize(responseObject, type: DataPost.self)
                    self.collectionPosts = response
                
                CacheFactory.getIntance().createCache().setObject(key: "collection", dataPostObject: self.collectionPosts!)
                self.collectionPosts = CacheFactory.getIntance().createCache().getObject(key: "collection")
                completion()
                   
               }, url)
    }
    
    func numberOfItemsInTable(section: Int) -> Int {
        let num = CacheFactory.getIntance().createCache().getObject(key: "collection")
        return num?.collection?.items?.count ?? 0
    }
}
