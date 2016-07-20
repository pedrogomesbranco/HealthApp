//
//  LoginViewController.swift
//  HealthApp
//
//  Created by Bia Lemos on 7/19/16.
//  Copyright © 2016 Pedro Gomes Branco. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var cpfTextField: UITextField!
    @IBOutlet weak var senhaTextField: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    
    override func prefersStatusBarHidden() -> Bool {
        return true
    }
    
    // Movimentar a View quando o Keyboard surgir
    var keyboardHeight: CGFloat!
    var isViewMovedUp: Bool?
    
    func animateTextField(up: Bool) {
        if isViewMovedUp == false {
        let movement = (up ? -keyboardHeight : keyboardHeight)
        
        UIView.animateWithDuration(0.3, animations: { self.view.frame = CGRectOffset(self.view.frame, 0, movement) } )
        }
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
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.cpfTextField.delegate = self
        self.senhaTextField.delegate = self
        
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
        textFieldStyles(senhaTextField)
        
        
        // Criar Placeholder Text na cor #232323
        let cpfPlaceholderColor = NSAttributedString(string: "CPF", attributes: [NSForegroundColorAttributeName:UIColor(red:0.14, green:0.14, blue:0.14, alpha:1.0)])
        cpfTextField.attributedPlaceholder = cpfPlaceholderColor
        
        let senhaPlaceholderColor = NSAttributedString(string: "SENHA", attributes: [NSForegroundColorAttributeName:UIColor(red:0.14, green:0.14, blue:0.14, alpha:1.0)])
        senhaTextField.attributedPlaceholder = senhaPlaceholderColor
      
        
        // Criar e personalizar Shadow e Corner Radius do botão
        loginButton.layer.masksToBounds = false
        loginButton.layer.shadowOpacity = 0.5
        loginButton.layer.shadowRadius = 5.0
        loginButton.layer.shadowColor = UIColor(red:0.14, green:0.14, blue:0.14, alpha:1.0).CGColor
        loginButton.layer.shadowOffset = CGSizeMake(1.0, 1.0)
        loginButton.layer.cornerRadius = 5.0

    }
    
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(LoginViewController.keyboardWillShow(_:)), name: UIKeyboardWillShowNotification, object: nil)
        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(LoginViewController.keyboardWillHide(_:)), name: UIKeyboardWillHideNotification, object: nil)
        
    }
    
    
    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
        
        NSNotificationCenter.defaultCenter().removeObserver(self)
        
    }

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()

    }
    

}



extension LoginViewController: UITextFieldDelegate {
    
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
        case senhaTextField:
            textField.placeholder = "SENHA"
        default:
            textField.placeholder = ""
        }
    }
}
