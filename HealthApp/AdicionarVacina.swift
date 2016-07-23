//
//  AdicionarVacina.swift
//  HealthApp
//
//  Created by Arthur Carvalho on 7/22/16.
//  Copyright © 2016 Pedro Gomes Branco. All rights reserved.
//

import UIKit

class AdicionarVacina: UIViewController {
    
    
    
    //esses são os textfields em que o usuário vai dar input nas informações
    
    @IBOutlet var textField1: UITextField!
    @IBOutlet var textField2: UITextField!
    @IBOutlet var textField3: UITextField!
    @IBOutlet var textField4: UITextField!
    
    var myArray: [String] = [""]
    
  
    
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
        let touch: UITouch = touches.first!
        if !touch.view!.isMemberOfClass(UITextField.self) {
            touch.view!.endEditing(true)
        }
    }
    
    func textFieldStyles(textField: UITextField) {
        
        //Criar e personalizar Shadow e Corner Radius
        textField.layer.masksToBounds = false
        textField.layer.shadowOpacity = 0.5
        textField.layer.shadowRadius = 2.0
        textField.layer.shadowColor = UIColor(red:0.14, green:0.14, blue:0.14, alpha:0.5).CGColor
        textField.layer.shadowOffset = CGSizeMake(1.0, 1.0)
        textField.layer.cornerRadius = 5.0
        
        // Criar Indent antes do texto
        let SpacerView = UIView(frame:CGRect(x:0, y:0, width:10, height:10))
        textField.leftViewMode = UITextFieldViewMode.Always
        textField.leftView = SpacerView
    }


    override func viewDidLoad() {
        super.viewDidLoad()

        textFieldStyles(textField1)
        textFieldStyles(textField2)
        textFieldStyles(textField3)
        textFieldStyles(textField4
        
        )
        
        
        
//        //informações referentes à
//        textField1.layer.shadowColor = UIColor.blackColor().CGColor
//        textField1.layer.shadowRadius = 1
//        textField1.layer.shadowOffset = CGSizeMake(0, 1)
//        textField1.layer.shadowOpacity = 0.3
//        textField1.clipsToBounds = false
//        
//        textField2.layer.shadowColor = UIColor.blackColor().CGColor
//        textField2.layer.shadowRadius = 1
//        textField2.layer.shadowOffset = CGSizeMake(0, 1)
//        textField2.layer.shadowOpacity = 0.3
//        textField2.clipsToBounds = false
//        
//        textField3.layer.shadowColor = UIColor.blackColor().CGColor
//        textField3.layer.shadowRadius = 1
//        textField3.layer.shadowOffset = CGSizeMake(0, 1)
//        textField3.layer.shadowOpacity = 0.3
//        textField3.clipsToBounds = false
//        
//        textField4.layer.shadowColor = UIColor.blackColor().CGColor
//        textField4.layer.shadowRadius = 1
//        textField4.layer.shadowOffset = CGSizeMake(0, 1)
//        textField4.layer.shadowOpacity = 0.3
//        textField4.clipsToBounds = false
        
    }
}