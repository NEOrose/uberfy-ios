//
//  ProductRemoteService.swift
//  UberfyCoreLibrary
//
//  Created by Haroldo Olivieri on 6/1/16.
//  Copyright © 2016 neorose. All rights reserved.
//

import Alamofire
import Siesta

public class ProductRemoteService : RemoteService {
    
    func transformResponse(response : AnyObject)  -> [UberProductAdapter]{
        let products = response["prices"] as! [Dictionary<String, AnyObject>]
        return products.map(UberProductAdapter.init)
    }
    
    override init() {
        super.init()
        
        service.configureTransformer("/estimates/price") {
            self.transformResponse($0.content)
        }
    }
}
