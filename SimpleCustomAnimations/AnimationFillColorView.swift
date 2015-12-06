//
//  AnimationFillColorView.swift
//  SimpleCustomAnimations
//
//  Created by Ajay on 11/29/15.
//  Copyright © 2015 Ajay. All rights reserved.
//

import Foundation
import UIKit

@IBDesignable class AnimationFillColorView: UIView {
    
    @IBInspectable var circleColor : UIColor = UIColor(red: 226, green: 226, blue: 226, alpha: 0)
    @IBInspectable var fillColor   : UIColor = UIColor(red: 226, green: 226, blue: 226, alpha: 0)
    
    private let percentageLabel : UILabel
    
    var timer  = NSTimer()
    var count  =  0.0
    
    var percentage = 0.0  {
        
        didSet {
            
            updateAppearance()
        }
    }
    
    //MARK:- Init Methods
    
    required init?(coder aDecoder: NSCoder) {
        
        percentageLabel = UILabel()
        super.init(coder: aDecoder)
        
        setupSubviews()
    }
    
    override required init(frame: CGRect) {
        
        percentageLabel = UILabel()
        super.init(frame: frame)
        
        setupSubviews()
    }
    
    override func drawRect(rect: CGRect) {
        
        self.drawBezierWithStrokeColor(circleColor.CGColor,
            startAngle: 0,
            endAngle: 360,
            animated: false)
        self.drawBezierWithStrokeColor(self.fillColor.CGColor,
            startAngle: 0,
            endAngle: (((2*CGFloat(M_PI))/100) * CGFloat(percentage)),
            animated: true)
    }
    
    override func layoutSubviews() {
        
        super.layoutSubviews()
        
    }
    
    private func setupSubviews() {
        
        self.addSubview(percentageLabel)
        percentageLabel.translatesAutoresizingMaskIntoConstraints = false
        
        let vAlignConstraint = NSLayoutConstraint(item: percentageLabel,
            attribute   : .CenterY,
            relatedBy   : .Equal,
            toItem      : percentageLabel.superview,
            attribute   : .CenterY,
            multiplier  : 1.0,
            constant    : 0.0);
        self.addConstraint(vAlignConstraint)
        
        let hAlignConstraint =  NSLayoutConstraint(item: percentageLabel,
            attribute   : .CenterX,
            relatedBy   : .Equal,
            toItem      : percentageLabel.superview,
            attribute   : .CenterX,
            multiplier  : 1.0,
            constant    : 0.0);
        self.addConstraint(hAlignConstraint);

        percentageLabel.textColor = UIColor(white: 0.15, alpha: 1.0)
        percentageLabel.text = "\(self.percentage)"
    }
    
    //MARK:- Private Methods
    
    private func updateAppearance () {
        
        self.setNeedsDisplay()
        self.percentageLabel.text = "\(self.percentage)"
    }
    
    private func drawBezierWithStrokeColor(color:CGColor, startAngle:CGFloat, endAngle:CGFloat, animated:Bool) {
        
        let bezier:CAShapeLayer = CAShapeLayer()
        bezier.path             = bezierPathWithStartAngle(startAngle, endAngle: endAngle).CGPath
        bezier.strokeColor      = color
        bezier.fillColor        = UIColor.clearColor().CGColor
        bezier.lineWidth        = bounds.width * 0.18
        
        self.layer.addSublayer(bezier)
        
        if (animated) {
            
            let animatedStrokeEnd:CABasicAnimation = CABasicAnimation(keyPath: "strokeEnd");
            animatedStrokeEnd.duration             = (2.0/100)*Double(percentage);
            animatedStrokeEnd.fromValue            = NSNumber(float: 0.0);
            animatedStrokeEnd.toValue              = NSNumber(float: 1.0);
            animatedStrokeEnd.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseIn)
            
            bezier.addAnimation(animatedStrokeEnd, forKey: "strokeEndAnimation");
        }
    }
    
    private func bezierPathWithStartAngle(startAngle:CGFloat, endAngle:CGFloat) -> UIBezierPath {
        
        let center          = CGPoint(x:bounds.width/2, y: bounds.height/2)
        let radius          = max(bounds.width, bounds.height)
        let arcWidth        = bounds.width * 0.25
        let path            = UIBezierPath(arcCenter   : center,
                                           radius      : radius/2 - arcWidth/2,
                                           startAngle  : startAngle,
                                           endAngle    : endAngle ,
                                           clockwise   : true)
        return path
    }
}

