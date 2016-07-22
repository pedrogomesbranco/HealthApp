//
//  AdicionarVacina.swift
//  HealthApp
//
//  Created by Arthur Carvalho on 7/22/16.
//  Copyright © 2016 Pedro Gomes Branco. All rights reserved.
//

import UIKit

class AdicionarVacina: UIViewController {
    
    @IBOutlet var textField1: UITextField!
    
    @IBOutlet var textField2: UITextField!
    
    @IBOutlet var textField3: UITextField!
    
    @IBOutlet var textField4: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        textField1.layer.shadowColor = UIColor.blackColor().CGColor
        textField1.layer.shadowRadius = 1
        textField1.layer.shadowOffset = CGSizeMake(0, 1)
        textField1.layer.shadowOpacity = 0.3
        textField1.clipsToBounds = false
        
        textField2.layer.shadowColor = UIColor.blackColor().CGColor
        textField2.layer.shadowRadius = 1
        textField2.layer.shadowOffset = CGSizeMake(0, 1)
        textField2.layer.shadowOpacity = 0.3
        textField2.clipsToBounds = false
        
        textField3.layer.shadowColor = UIColor.blackColor().CGColor
        textField3.layer.shadowRadius = 1
        textField3.layer.shadowOffset = CGSizeMake(0, 1)
        textField3.layer.shadowOpacity = 0.3
        textField3.clipsToBounds = false
        
        textField4.layer.shadowColor = UIColor.blackColor().CGColor
        textField4.layer.shadowRadius = 1
        textField4.layer.shadowOffset = CGSizeMake(0, 1)
        textField4.layer.shadowOpacity = 0.3
        textField4.clipsToBounds = false
        
    }
}