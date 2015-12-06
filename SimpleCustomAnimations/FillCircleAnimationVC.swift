//
//  FillCircleAnimationVC.swift
//  SimpleCustomAnimations
//
//  Created by Ajay on 11/29/15.
//  Copyright © 2015 Ajay. All rights reserved.
//

import UIKit

class FillCircleAnimationVC: UIViewController {

    @IBOutlet weak var animatedCircle: AnimationFillColorView!  // view which will animate.
    
    override func viewDidLoad() {
        super.viewDidLoad()

        animatedCircle.percentage = 80.0   // this value can be changed to configure the percentage of circle to be filled.
        view.backgroundColor = UIColor.whiteColor()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
 
    @IBAction func cancelButton() {

        self.dismissViewControllerAnimated(true, completion: nil)
    }
}
