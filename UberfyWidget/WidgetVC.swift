//
//  WidgetViewController.swift
//  UberfyWidget
//
//  Created by Haroldo Olivieri on 6/2/16.
//  Copyright © 2016 neorose. All rights reserved.
//

import UIKit
import NotificationCenter
import UberfyCoreLibrary

protocol WidgetView : BaseView {
    func showUberProducts(uberProducts : [UberProduct]) -> Void
}

@objc (WidgetViewController)
class WidgetViewController: UIViewController, WidgetView, NCWidgetProviding {
    
    var _widgetUI : WidgetUI!
    var _widgetPresenter : WidgetPresenter!
    
    override func viewDidLoad() {
        self.preferredContentSize = CGSizeMake(0, 100)
        _widgetPresenter.attachView(self)
    }
    
    override func loadView() {
        Configurator.sharedInstance.configure(self)
        view = _widgetUI.returnView()
    }

    func showLoading() {
        _widgetUI.showLoading()
    }
    
    func hideLoading() {
        _widgetUI.hideLoading()
    }
    
    func showUberProducts(uberProducts : [UberProduct]) {
        _widgetUI.changeValues(uberProducts)
    }
    
    func widgetPerformUpdateWithCompletionHandler(completionHandler: ((NCUpdateResult) -> Void)) {
        completionHandler(NCUpdateResult.NewData)
    }
    
}
