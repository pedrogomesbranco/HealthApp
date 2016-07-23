//
//  EditarMedicoViewController.swift
//  HealthApp
//
//  Created by Bia Lemos on 7/22/16.
//  Copyright © 2016 Pedro Gomes Branco. All rights reserved.
//

import UIKit

class EditarMedico: UIViewController {
    
    @IBOutlet weak var nomeLabel: UILabel!
    @IBOutlet weak var fotoImageView: UIImageView!
    @IBOutlet weak var nomeTextField: UITextField!
    @IBOutlet weak var crmTextField: UITextField!
    @IBOutlet weak var especialidadeTextField: UITextField!
    @IBOutlet weak var telefoneTextField: UITextField!
    @IBOutlet weak var celularTextField: UITextField!
    @IBOutlet weak var enderecoTextField: UITextField!
    
    @IBAction func fotoButton(sender: AnyObject) {
    }
    
    @IBAction func confirmarButton(sender: AnyObject) {
    }
    
    override func prefersStatusBarHidden() -> Bool { return true }

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    

}
