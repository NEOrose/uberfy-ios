//
//  UberProduct.swift
//  Uberfy
//
//  Created by Haroldo Olivieri on 6/1/16.
//  Copyright © 2016 neorose. All rights reserved.
//

import Foundation

public protocol UberProduct {
    var type : UberType { get }
    var surgeMultiplier : Double { get }
}
