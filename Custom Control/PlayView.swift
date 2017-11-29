//
//  PlayView.swift
//  Custom Control
//
//  Created by Artur Azarov on 29.11.2017.
//  Copyright © 2017 Artur Azarov. All rights reserved.
//

import UIKit

@IBDesignable class PlayView: UIView {
    @IBInspectable var lineWidth: CGFloat = 1.0
    @IBInspectable var iconSize: CGFloat = 32.0
    
    private var shapeLayer: CAShapeLayer!
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        if shapeLayer == nil {
            shapeLayer = CAShapeLayer()
            
            
            shapeLayer.anchorPoint = .zero
            layer.addSublayer(shapeLayer)
        }
        shapeLayer.bounds = bounds
        applySettings()
    }
    
    private func applySettings() {
        if lineWidth <= 0 {
            shapeLayer.strokeColor = UIColor.clear.cgColor
        } else {
            shapeLayer.strokeColor = tintColor.cgColor
            shapeLayer.fillColor = UIColor.clear.cgColor
            shapeLayer.lineWidth = lineWidth
            let radius = (min(bounds.width, bounds.height) - lineWidth) / 2
            let path = UIBezierPath(arcCenter: CGPoint(x: bounds.midX, y: bounds.midY), radius: radius, startAngle: 0, endAngle: 2 * .pi, clockwise: true)
            shapeLayer.path = path.cgPath
        }
    }
    
    override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        applySettings()
    }
}

