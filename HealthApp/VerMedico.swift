//
//  EditarMedicoViewController.swift
//  HealthApp
//
//  Created by Bia Lemos on 7/22/16.
//  Copyright © 2016 Pedro Gomes Branco. All rights reserved.
//

import UIKit

class VerMedico: UIViewController {
    
    @IBOutlet weak var nomeLabel: UILabel!
    @IBOutlet weak var fotoImageView: UIImageView!
    @IBOutlet weak var nomeTextField: UITextField!
    @IBOutlet weak var crmTextField: UITextField!
    @IBOutlet weak var especialidadeTextField: UITextField!
    @IBOutlet weak var telefoneTextField: UITextField!
    @IBOutlet weak var celularTextField: UITextField!
    @IBOutlet weak var enderecoTextField: UITextField!
    
    @IBAction func editarButton(sender: AnyObject) {
    }
    
    
    override func prefersStatusBarHidden() -> Bool { return true }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Deixar a Image View circular
        fotoImageView.layer.cornerRadius = fotoImageView.frame.size.width / 2
        fotoImageView.clipsToBounds = true

        // Adicionar estilo aos Text Fields
        func textFieldStyles(textField: UITextField) {
            
            //Criar e personalizar Shadow e Corner Radius
            textField.layer.masksToBounds = false
            textField.layer.cornerRadius = 5.0
            
            // Criar Indent antes do texto
            let SpacerView = UIView(frame:CGRect(x:0, y:0, width:10, height:10))
            textField.leftViewMode = UITextFieldViewMode.Always
            textField.leftView = SpacerView
        }
        
        textFieldStyles(nomeTextField)
        textFieldStyles(crmTextField)
        textFieldStyles(telefoneTextField)
        textFieldStyles(celularTextField)
        textFieldStyles(enderecoTextField)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

}
