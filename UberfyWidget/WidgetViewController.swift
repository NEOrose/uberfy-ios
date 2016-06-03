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
}

@objc (WidgetViewController)
class WidgetViewController: UIViewController, NCWidgetProviding {
    
    
    override func loadView() {
        view = UIView()
    }

    override func viewDidLoad() {
        self.preferredContentSize = CGSizeMake(0, 100)
        
        super.viewDidLoad()
        let label = UILabel(frame: CGRectMake(0, 0, 200, 21))
        label.textAlignment = NSTextAlignment.Center
        label.text = "I'am a test label"
        self.view.addSubview(label)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func widgetPerformUpdateWithCompletionHandler(completionHandler: ((NCUpdateResult) -> Void)) {
        
//        self.testLabel.text = "Loading..."
//        
//        let repo : ProductRepository = ProductRepositoryImpl()
//        let startLocation = Location(latitude: -22.951243, longitude: -43.180933)
//        let endLocation = Location(latitude: -22.901496, longitude: -43.288348)
//        
//        repo.getEstimateFromLocation(startLocation, endLocation: endLocation) { ubers in
//            let label = (ubers![0] as UberProduct).type.rawValue
//            let surgeMultiplier = (ubers![0] as UberProduct).surgeMultiplier
//            self.testLabel.text = "\(label) - TARIFA \(surgeMultiplier)x"
        
            completionHandler(NCUpdateResult.NewData)
//        }
    }
    
}
