//
//  FillScreenAnimationVC.swift
//  SimpleCustomAnimations
//
//  Created by Ajay on 11/30/15.
//  Copyright © 2015 Ajay. All rights reserved.
//

import UIKit

class FillScreenAnimationVC: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.whiteColor()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidAppear(animated: Bool) {
        
        super.viewDidAppear(animated)
        
        //Creating CAShapeLayer.
        let shape:CAShapeLayer = CAShapeLayer()
        shape.frame            = CGRectMake(view.center.x - 40, view.center.y - 40, 80, 80)
        shape.cornerRadius     = 80 / 2
        shape.fillColor        = UIColor.cyanColor().CGColor
        view.layer.addSublayer(shape)
        
        // animation begin with a small circle.
        let startShape = UIBezierPath(roundedRect: CGRectMake(0, 0, 80, 80), cornerRadius: 40).CGPath
        
        // animation end with a large circle.
        let endShape = UIBezierPath(roundedRect: CGRect(x: -500, y: -500, width: 1200, height: 1200), cornerRadius: 550).CGPath
        
        // setting initial shape.
        shape.path = startShape
        
        // animate the path
        let animation                   = CABasicAnimation(keyPath: "path")
        animation.toValue               = endShape
        animation.duration              = 1.5
        animation.timingFunction        = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseOut)
        animation.fillMode              = kCAFillModeBoth // keep to value after finishing
        animation.removedOnCompletion   = false // don't remove after finishing
        
        shape.addAnimation(animation, forKey: animation.keyPath)
        
        // adding cancel button
        let cancelButton = UIButton(frame: CGRectMake(360,5,50,70))
        cancelButton.setImage(UIImage(named:"Cancel"), forState: .Normal)
        cancelButton.addTarget(self, action:"closeButtonTapped:", forControlEvents:.TouchUpInside)
        self.view.addSubview(cancelButton)
    }
    
    func closeButtonTapped (sender:UIButton) {
        dismissViewControllerAnimated(true, completion: nil)
    }
}
