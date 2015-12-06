//
//  ViewController.swift
//  SimpleCustomAnimations
//
//  Created by Ajay on 12/5/15.
//  Copyright © 2015 Ajay. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var tableView : UITableView!
    
    let animationTypes = ["Fill Circle","Fill Screen","Transform View"] 
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        UIApplication.sharedApplication().statusBarHidden = true
        
        self.tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "cell")
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    // MARK: - Table view data source, delegate
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return animationTypes.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        var cell:UITableViewCell? = tableView.dequeueReusableCellWithIdentifier("cell") as UITableViewCell!
        
        if cell != nil {
            cell = UITableViewCell(style: UITableViewCellStyle.Value1, reuseIdentifier: "cell")
        }
        
        let currentAnimationType = animationTypes[indexPath.row]
        cell!.textLabel!.text = currentAnimationType
        
        return cell!
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        let currentAnimationType = animationTypes[indexPath.row]
        
        switch(currentAnimationType) {
            
        case "Fill Circle" :
            
            let fillColorAnimationDetailVC = FillCircleAnimationVC(nibName: "FillColorVC", bundle: nil)
            self.presentViewController(fillColorAnimationDetailVC, animated: true, completion: nil)
            
        case "Fill Screen" :
            
            let fillScreenVC = FillScreenAnimationVC(nibName: nil, bundle: nil)
            presentViewController(fillScreenVC, animated: true, completion: nil)
            
        case "Transform View":
            
            let scaleAnimationVC = TransformViewAnimationVC(nibName: nil, bundle: nil)
            presentViewController(scaleAnimationVC, animated: true, completion: nil)
            
        default: break
            
        }
    }
}

