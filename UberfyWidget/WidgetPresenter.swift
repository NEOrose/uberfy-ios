//
//  WidgetPresenter.swift
//  UberfyApp
//
//  Created by Haroldo Olivieri on 6/2/16.
//  Copyright © 2016 neorose. All rights reserved.
//

protocol WidgetPresenter : BasePresenter {
    func getUberProducts() -> Void
}

class WidgetPresenterImpl : WidgetPresenter {
    
    private var _widgetView : WidgetView!
    func attachView(view: BaseView) {
        _widgetView = view as! WidgetView
    }
    
    func getUberProducts() {
        
    }
    
}
