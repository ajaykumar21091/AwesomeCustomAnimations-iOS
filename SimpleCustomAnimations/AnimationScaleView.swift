//
//  AnimationScaleView.swift
//  SimpleCustomAnimations
//
//  Created by Ajay on 12/6/15.
//  Copyright © 2015 Ajay. All rights reserved.
//

import UIKit

class AnimationScaleView: UIView {
    
    override required init(frame: CGRect) {
        
        super.init(frame: frame)
        self.backgroundColor = UIColor.whiteColor()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func drawRect(rect: CGRect) {
        
        //Drawing path which will be used for animation.
        let path = UIBezierPath(roundedRect: rect, cornerRadius: 100)
        
        UIColor.redColor().setFill()
        path.fill()
    }
}
