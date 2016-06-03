//
//  RemoteService.swift
//  PortalMobileYes
//
//  Created by Haroldo Olivieri on 5/6/16.
//  Copyright © 2016 carioca.build. All rights reserved.
//

import Foundation
import Siesta

public class RemoteService {
    
    private var configuration : NSURLSessionConfiguration!
    private var baseUrl : String = "https://api.uber.com/v1"
    var _serverToken = "serverTokenHere"
    
    let service : Service!
    
    init() {
        
        #if DEBUG
            Siesta.enabledLogCategories = LogCategory.detailed
        #endif
        configuration = NSURLSessionConfiguration.defaultSessionConfiguration()
        configuration.timeoutIntervalForResource = 10
        
        service = Service(baseURL: baseUrl, networking: AlamofireProvider(configuration: configuration))
        
        service.configure {
            $0.config.headers["Accept"] = "application/json"
        }
        
    }
}