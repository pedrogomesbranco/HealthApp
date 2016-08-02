//
//  File.swift
//  HealthApp
//
//  Created by Pedro Gomes Branco on 7/29/16.
//  Copyright © 2016 Pedro Gomes Branco. All rights reserved.
//

import Foundation
import UIKit

class File: UIViewController {
    
    @IBOutlet var web: UIWebView!
    
    @IBAction func vai(sender: AnyObject) {
        performSegueWithIdentifier("show", sender: self)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        if let pdf = NSBundle.mainBundle().URLForResource("myPdf2", withExtension: "pdf", subdirectory: nil, localization: nil)  {
            let req = NSURLRequest(URL: pdf)
            web.loadRequest(req)
        }
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if(segue.identifier == "show"){
            let viewController = segue.destinationViewController as! Home
            viewController.i = 3
        }
    }

    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
}
