//
//  Location.swift
//  Uberfy
//
//  Created by Haroldo Olivieri on 6/1/16.
//  Copyright © 2016 neorose. All rights reserved.
//

public struct Location {
    public var latitude : Double!
    public var longitude : Double!
    
    public func isEmpty() -> Bool{
        if (self.latitude == 0.0 && self.longitude == 0.0){
            return true;
        } else {
            return false;
        }
    }
    
    public init(latitude : Double, longitude : Double){
        self.latitude = latitude
        self.longitude = longitude
    }
    
    public init () {
        latitude = Double(0.0)
        longitude = Double(0.0)
    }
}
