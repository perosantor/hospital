//
//  ExplanationOverlayView.swift
//  DomZdravlja
//
//  Created by Petar Santor on 4/8/17.
//  Copyright © 2017 Petar Santor. All rights reserved.
//

import UIKit

class ExplanationOverlayView: UIView {
    
    public var dismissOverlayHandler:(() -> Void)?
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        
        //if self.transparentHoleView != nil {
            // Ensures to use the current background color to set the filling color
            //self.backgroundColor = UIColor.clear
            self.alpha = 0.8
            UIRectFill(rect)
            
            let layer = CAShapeLayer()
            let path = CGMutablePath()
            
            // Make hole in view's overlay
            // NOTE: Here, instead of using the transparentHoleView UIView we could use a specific CFRect location instead...
            path.addRect(CGRect.init(x: UIScreen.main.bounds.width - 80,
                                     y: 20,
                                     width: 80,
                                     height: 70))
            path.addRect(bounds)
            
            layer.path = path
            layer.fillRule = kCAFillRuleEvenOdd
            self.layer.mask = layer
        
        addExplanationLabel()
        
        //}
    }
    
    func addExplanationLabel() {
        let label = UILabel.init(frame: CGRect.init(x: 16,
                                                    y: 200,
                                                    width: UIScreen.main.bounds.width - 32,
                                                    height: 100))
        label.text = "Можете позвати службу Хитне помоћи притиском на ово дугме"
        Utilities.setТitleLabel(label)
        label.numberOfLines = 0
        
        self.addSubview(label)
        
        let button = UIButton.init(frame: CGRect.init(x:16 , y: label.frame.size.height + 200 + 30, width: 100, height: 50))
        button.setTitle("У РЕДУ", for: .normal)
        button.setTitleColor(UIColor.white, for: .normal)
        
        button.addTarget(self, action: #selector(ExplanationOverlayView.dismissButtonTapped(_:)), for: .touchDown)
        self.addSubview(button)
    }
    
    
    
    func dismissButtonTapped(_ button: UIButton) {
        if (dismissOverlayHandler == nil) {
            return
        } else {
            dismissOverlayHandler!()
        }
    }
    
    override func layoutSubviews () {
        super.layoutSubviews()
    }
    
    // MARK: - Initialization
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }

}
