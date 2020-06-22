//
//  AccessApi.swift
//  MobileTestiOS
//
//  Created by Liliana on 6/21/20.
//  Copyright © 2020 Test. All rights reserved.
//

import Foundation
import Alamofire

class AccessApi {
    static let shared = AccessApi()
    
    func getListPosts(completion: @escaping ([String : Any], _ error: Error?)-> Void, _ url : String){
            Alamofire.request(url).responseJSON{ (responseObject) -> Void in
                    print(responseObject)
                if responseObject.result.isSuccess {
                    completion(responseObject.result.value! as! [String : Any], nil)
                }
                if responseObject.result.isFailure {
                    let error : Error = responseObject.result.error!
                    completion(responseObject.result.value! as! [String : Any], error)
                    
                }
        }
        
    }
    
    
}
