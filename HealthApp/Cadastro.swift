//
//  RegisterViewController.swift
//  HealthApp
//
//  Created by Bia Lemos on 7/19/16.
//  Copyright © 2016 Pedro Gomes Branco. All rights reserved.
//

import UIKit

class Cadastro: UIViewController {
    
    @IBOutlet weak var cpfTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var senhaTextField: UITextField!
    @IBOutlet weak var confirmarSenhaTextField: UITextField!
    @IBOutlet weak var cadastrarButton: UIButton!
    
    override func prefersStatusBarHidden() -> Bool {
        return true
    }

    
    // Movimentar a View quando o Keyboard surgir
    var keyboardHeight: CGFloat!
    
    func animateTextField(up: Bool) {
        let movement = (up ? -keyboardHeight : keyboardHeight)
        
        UIView.animateWithDuration(0.3, animations: { self.view.frame = CGRectOffset(self.view.frame, 0, movement) } )
    }
    
    func keyboardWillShow(notification: NSNotification) {
        if let userInfo = notification.userInfo {
            if let keyboardSize = (userInfo[UIKeyboardFrameBeginUserInfoKey] as? NSValue)?.CGRectValue() {
                keyboardHeight = keyboardSize.height
                self.animateTextField(true)
            }
        }
    }
    
    func keyboardWillHide(notification: NSNotification) {
        self.animateTextField(false)
    }
    
    // Sair do Keyboard clicando na Screen
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        var touch: UITouch = touches.first!
        if !touch.view!.isMemberOfClass(UITextField.self) {
            touch.view!.endEditing(true)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.cpfTextField.delegate = self
        self.emailTextField.delegate = self
        self.senhaTextField.delegate = self
        self.confirmarSenhaTextField.delegate = self
        
        
        func textFieldStyles(textField: UITextField) {
            
            //Criar e personalizar Shadow e Corner Radius
            textField.layer.masksToBounds = false
            textField.layer.shadowOpacity = 0.5
            textField.layer.shadowRadius = 5.0
            textField.layer.shadowColor = UIColor(red:0.14, green:0.14, blue:0.14, alpha:1.0).CGColor
            textField.layer.shadowOffset = CGSizeMake(1.0, 1.0)
            textField.layer.cornerRadius = 5.0
            
            // Criar Indent antes do texto
            let SpacerView = UIView(frame:CGRect(x:0, y:0, width:10, height:10))
            textField.leftViewMode = UITextFieldViewMode.Always
            textField.leftView = SpacerView
        }
        
        textFieldStyles(cpfTextField)
        textFieldStyles(emailTextField)
        textFieldStyles(senhaTextField)
        textFieldStyles(confirmarSenhaTextField)

        
        // Criar Placeholder Text na cor #232323
        let cpfPlaceholder = NSAttributedString(string: "CPF", attributes: [NSForegroundColorAttributeName:UIColor(red:0.14, green:0.14, blue:0.14, alpha:1.0)])
        cpfTextField.attributedPlaceholder = cpfPlaceholder
        
        let emailPlaceholder = NSAttributedString(string: "EMAIL", attributes: [NSForegroundColorAttributeName:UIColor(red:0.14, green:0.14, blue:0.14, alpha:1.0)])
        emailTextField.attributedPlaceholder = emailPlaceholder
        
        let senhaPlaceholder = NSAttributedString(string: "SENHA", attributes: [NSForegroundColorAttributeName:UIColor(red:0.14, green:0.14, blue:0.14, alpha:1.0)])
        senhaTextField.attributedPlaceholder = senhaPlaceholder
        
        let confirmarSenhaPlaceholder = NSAttributedString(string: "CONFIRMAR SENHA", attributes: [NSForegroundColorAttributeName:UIColor(red:0.14, green:0.14, blue:0.14, alpha:1.0)])
        confirmarSenhaTextField.attributedPlaceholder = confirmarSenhaPlaceholder
        
        
        // Criar e personalizar Shadow e Corner Radius do botão
        cadastrarButton.layer.masksToBounds = false
        cadastrarButton.layer.shadowOpacity = 0.5
        cadastrarButton.layer.shadowRadius = 5.0
        cadastrarButton.layer.shadowColor = UIColor(red:0.14, green:0.14, blue:0.14, alpha:1.0).CGColor
        cadastrarButton.layer.shadowOffset = CGSizeMake(1.0, 1.0)
        cadastrarButton.layer.cornerRadius = 5.0
        
    }
    
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)

        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(Cadastro.keyboardWillShow(_:)), name: UIKeyboardWillShowNotification, object: nil)
        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(Cadastro.keyboardWillHide(_:)), name: UIKeyboardWillHideNotification, object: nil)
        
    }
    

    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
        
        NSNotificationCenter.defaultCenter().removeObserver(self)
        
    }

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()

    }

}



extension Cadastro: UITextFieldDelegate {
    
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
        
        switch textField {
        case cpfTextField:
            textField.placeholder = "CPF"
        case emailTextField:
            textField.placeholder = "EMAIL"
        case senhaTextField:
            textField.placeholder = "SENHA"
        case confirmarSenhaTextField:
            textField.placeholder = "CONFIRMAR SENHA"
        default:
            textField.placeholder = ""
        }
    }
}