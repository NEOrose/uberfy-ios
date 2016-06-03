//
//  WidgetUI.swift
//  UberfyApp
//
//  Created by Haroldo Olivieri on 6/2/16.
//  Copyright © 2016 neorose. All rights reserved.
//

import UIKit
import UberfyCoreLibrary

protocol WidgetUI {
    func returnView() -> UIView
    func changeValues(uberProducts : [UberProduct]) -> Void
    func hideLoading() -> Void
    func showLoading() -> Void
}

class WidgetUIImpl : UIView, WidgetUI {
    
    private var uberXLabel = UILabel()
    private var uberBlackLabel = UILabel()
    private var uberEnglishXLabel = UILabel()
    private var uberEnglishBlackLabel = UILabel()
    private var loadingLabel = UILabel()
    private var uberLabels = [UILabel]()
    
    func returnView() -> UIView {
        return self
    }
    
    func changeValues(uberProducts : [UberProduct]) {
        for element in uberProducts {
            
            let uberTypeStr = element.type.rawValue.capitalizedString
            
            switch element.type {
            case .UberX:
                uberXLabel.text = "\(uberTypeStr) - Tarifa -> \(element.surgeMultiplier)x"
                uberXLabel.textAlignment = .Center
                uberXLabel.textColor = UIColor.whiteColor()
            case .UberBlack:
                uberBlackLabel.text = "\(uberTypeStr) - Tarifa -> \(element.surgeMultiplier)x"
                uberBlackLabel.textAlignment = .Center
                uberBlackLabel.textColor = UIColor.whiteColor()
            case .UberEnglishBlack:
                uberEnglishBlackLabel.text = "\(uberTypeStr) - Tarifa -> \(element.surgeMultiplier)x"
                uberEnglishBlackLabel.textAlignment = .Center
                uberEnglishBlackLabel.textColor = UIColor.whiteColor()
            case .UberEnglishX:
                uberEnglishXLabel.text = "\(uberTypeStr) - Tarifa -> \(element.surgeMultiplier)x"
                uberEnglishXLabel.textAlignment = .Center
                uberEnglishXLabel.textColor = UIColor.whiteColor()
            }
        }
    }
    
    func hideLoading() {
        loadingLabel.hidden = true
    }
    
    func showLoading() {
        loadingLabel.text = "Loading..."
        loadingLabel.textAlignment = .Center
        loadingLabel.textColor = UIColor.whiteColor()
        loadingLabel.hidden = false
    }
    
    init() {
        let screenSize: CGRect = UIScreen.mainScreen().bounds
        super.init(frame: CGRect(x:0, y:0, width:screenSize.width, height:80))
        
        uberLabels.append(uberXLabel)
        uberLabels.append(uberBlackLabel)
        uberLabels.append(uberEnglishXLabel)
        uberLabels.append(uberEnglishBlackLabel)
        uberLabels.append(loadingLabel)

        let stackView = UIStackView(arrangedSubviews: uberLabels)
        stackView.axis = .Vertical
        stackView.distribution = .FillEqually
        stackView.alignment = .Fill
        stackView.spacing = 5
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(stackView)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
