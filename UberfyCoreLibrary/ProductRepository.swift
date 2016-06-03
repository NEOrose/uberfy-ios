//
//  ProductRepository.swift
//  UberfyCoreLibrary
//
//  Created by Haroldo Olivieri on 6/1/16.
//  Copyright © 2016 neorose. All rights reserved.
//

import Siesta
import Alamofire


public protocol ProductRepository {
    func getEstimateFromLocation(startLocation: Location,
                                 endLocation: Location, closure : ([UberProduct]?) -> Void) -> Void
}

public class ProductRepositoryImpl : ProductRemoteService, ProductRepository {
    
    private var _productResource : Resource?
    
    public override init() {
        super.init()
        _productResource = service.resource("/estimates/price")
    }
    
    public func getEstimateFromLocation(startLocation: Location,
                                 endLocation: Location, closure : ([UberProduct]?) -> Void) {
        _productResource?
            .withParam("start_latitude", "\(startLocation.latitude)")
            .withParam("start_longitude", "\(startLocation.longitude)")
            .withParam("end_latitude", "\(endLocation.latitude)")
            .withParam("end_longitude", "\(endLocation.longitude)")
            .withParam("server_token", "\(_serverToken)")
            .load()
            .onSuccess { data in
                let uberProductsAdapters = data.content as? [UberProductAdapter] ?? []
                let uberProducts = uberProductsAdapters.map{$0 as UberProduct}
                closure(uberProducts)
            }.onFailure { error in
                print(error)
                closure(nil)
        }
    }
}

