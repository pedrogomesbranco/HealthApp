//
//  AdicionarMedicosViewController.swift
//  HealthApp
//
//  Created by Bia Lemos on 7/22/16.
//  Copyright © 2016 Pedro Gomes Branco. All rights reserved.
//

import UIKit

class AdicionarMedico: UIViewController {
    
    @IBOutlet weak var fotoImageView: UIImageView!
    @IBOutlet weak var nomeTextField: UITextField!
    @IBOutlet weak var crmTextField: UITextField!
    @IBOutlet weak var especialidadeTextField: UITextField!
    @IBOutlet weak var telefoneTextField: UITextField!
    @IBOutlet weak var celularTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    
    @IBAction func fotoButton(sender: AnyObject) {
        
    }
    
    @IBAction func confirmarButton(sender: AnyObject) {
        self.performSegueWithIdentifier("adicionado", sender: self)
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.nomeTextField.delegate = self
        self.crmTextField.delegate = self
        self.especialidadeTextField.delegate = self
        self.telefoneTextField.delegate = self
        self.celularTextField.delegate = self
        self.emailTextField.delegate = self
        
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
        textFieldStyles(especialidadeTextField)
        textFieldStyles(telefoneTextField)
        textFieldStyles(celularTextField)
        textFieldStyles(emailTextField)


        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }


}



extension AdicionarMedico: UITextFieldDelegate, UITextViewDelegate {
    
    // Dismiss Keyboard quando clicar em Return
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        print("TextField should return")
        return true
    }
    
    // Limpar Placeholder quando começar a escrever
    func textFieldDidBeginEditing(textField: UITextField) {
        print("TextField did begin editing")
        
        textField.placeholder = nil
    }
    
    
    // Voltar com o Placeholder se não tiver nada escrito
    func textFieldDidEndEditing(textField: UITextField) {
        print("TextField did end editing")
        
        if textField.text?.isEmpty == true {
            textField.textColor = UIColor(red:0.14, green:0.14, blue:0.14, alpha:1.0)
        }
        
        switch textField {
        case nomeTextField:
            textField.placeholder = "NOME"
        case crmTextField:
            textField.placeholder = "CRM"
        case especialidadeTextField:
            textField.placeholder = "ESPECIALIDADE"
        case telefoneTextField:
            textField.placeholder = "TELEFONE"
        case celularTextField:
            textField.placeholder = "CELULAR"
        default:
            textField.placeholder = ""
        }
        
    }
    
    // Limpar o Placeholder quando começar a editar e manter a cor correta do texto
    func textViewDidBeginEditing(textView: UITextView) {
        print("TextView did begin editing")
        
        if textView.textColor == UIColor(red:0.14, green:0.14, blue:0.14, alpha:1.0) {
            textView.text = nil
            textView.textColor = UIColor(red:0.14, green:0.14, blue:0.14, alpha:1.0)
        }
    }
    
    // Adicionar Placeholder no TextView se não tiver nada escrito
    func textViewDidEndEditing(textView: UITextView) {
        print("TextView did end editing")
        
        if textView.text.isEmpty {
            textView.text = "ENDEREÇO"
            textView.textColor = UIColor(red:0.14, green:0.14, blue:0.14, alpha:1.0)
        }
    }


}