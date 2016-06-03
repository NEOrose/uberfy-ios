//
//  WidgetConfigurator.swift
//  UberfyApp
//
//  Created by Haroldo Olivieri on 6/2/16.
//  Copyright © 2016 neorose. All rights reserved.
//
import UIKit

class WidgetConfigurator {
    
    static let sharedInstance = WidgetConfigurator()
    
    private init() {
    }
    
    func configure(viewController: WidgetViewController) {
        let presenter = FakeWidgetPresenterImpl()
        let uiView = WidgetUIImpl()
        
        viewController._widgetPresenter = presenter
        viewController._widgetUI = uiView
    }
}
