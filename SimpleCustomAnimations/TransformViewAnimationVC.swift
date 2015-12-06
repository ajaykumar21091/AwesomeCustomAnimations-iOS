//
//  TransformViewAnimationVC.swift
//  SimpleCustomAnimations
//
//  Created by Ajay on 12/6/15.
//  Copyright © 2015 Ajay. All rights reserved.
//

import UIKit

class TransformViewAnimationVC: UIViewController {
    
    var transformView : AnimationScaleView?    //View in which transform animation is to be applied.

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor.whiteColor()
        
        //Adding cancel button
        let cancelButton = UIButton(frame: CGRectMake(360,5,50,70))
        cancelButton.setImage(UIImage(named:"Cancel"), forState: .Normal)
        cancelButton.addTarget(self, action:"closeButtonTapped:", forControlEvents: .TouchUpInside)
        self.view.addSubview(cancelButton)
        
        //initializing view to which animation is to be applied.
        transformView = AnimationScaleView(frame: CGRectMake(view.center.x - 75,view.center.y - 75,150,150))
        view.addSubview(transformView!)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(animated: Bool) {
        
        //animate the 'transform.scale'.
        let animation                   = CABasicAnimation(keyPath: "transform.scale")
        animation.fromValue             = 1.5       // start vaule.
        animation.toValue               = 1.0       // end value.
        animation.duration              = 1.0       // duration of animation.
        animation.removedOnCompletion   = false     // do not remove after completion.
        animation.fillMode              = kCAFillModeForwards
        animation.repeatCount           = 5         // number of times to repeat animation.
        animation.timingFunction        = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseInEaseOut) //animation is EaseIn EaseOut.
        
        transformView?.layer.addAnimation(animation, forKey: "transform.scale")
    }
    
    // cancel button.
    func closeButtonTapped (sender:UIButton) {
        dismissViewControllerAnimated(true, completion: nil)
    }
}
