//
//  UberProductAdapter.swift
//  uberfy-repository
//
//  Created by Haroldo Olivieri on 6/1/16.
//  Copyright © 2016 neorose. All rights reserved.
//
import SwiftyJSON

public final class UberProductAdapter : UberProduct {
    var uberTypeRaw: String = ""
    public var type: UberType {
        get {
            if let value = UberType(rawValue: uberTypeRaw) {
                return value
            }
            return .UberX
        }
    }
    
    private(set) public var surgeMultiplier: Double = 0.0
    
    convenience required public init(dict: Dictionary<String, AnyObject>) {
        let json = JSON(dict)
        self.init(json: json)
    }
    
    
    convenience public init(json: JSON) {
        self.init()
        self.uberTypeRaw = json["localized_display_name"].stringValue.uppercaseString
        self.surgeMultiplier = json["surge_multiplier"].doubleValue
    }
}
