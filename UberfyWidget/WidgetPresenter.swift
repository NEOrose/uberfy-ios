//
//  WidgetPresenter.swift
//  UberfyApp
//
//  Created by Haroldo Olivieri on 6/2/16.
//  Copyright © 2016 neorose. All rights reserved.
//
import UberfyCoreLibrary

protocol WidgetPresenter : BasePresenter {
    func getUberProducts() -> Void
}

class FakeWidgetPresenterImpl : WidgetPresenter {
    
    private var _widgetView : WidgetView!
    func attachView(view: BaseView) {
        _widgetView = view as! WidgetView
        getUberProducts()
    }
    
    func getUberProducts() {
        
        _widgetView.showLoading()
        
        let repo : ProductRepository = ProductRepositoryImpl()
        let startLocation = Location(latitude: -22.951243, longitude: -43.180933)
        let endLocation = Location(latitude: -22.901496, longitude: -43.288348)

        repo.getEstimateFromLocation(startLocation, endLocation: endLocation) { uberProducts in
            self._widgetView.hideLoading()
            self._widgetView.showUberProducts(uberProducts!)
        }
    }
    
}
