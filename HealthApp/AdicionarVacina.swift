//
//  AdicionarVacina.swift
//  HealthApp
//
//  Created by Arthur Carvalho on 7/22/16.
//  Copyright © 2016 Pedro Gomes Branco. All rights reserved.
//

import UIKit

class AdicionarVacina: UIViewController {
    
    @IBOutlet var validadeSlider: UISlider!
    @IBAction func mudandoValidade(sender: AnyObject) {
    }
    @IBOutlet var validadeLabel: UILabel!
    
    //esses são os textfields em que o usuário vai dar input nas informações
    
    @IBOutlet var textField1: UITextField!
    
    @IBOutlet var textField4: UITextField!
    
    @IBOutlet var simnao: UISwitch!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        textFieldStyles(textField1)
        textFieldStyles(textField4)
        
    }
    
    @IBOutlet var myDatePicker: UIDatePicker!
    @IBOutlet var myDatePicker2: UIDatePicker!
    
    // a partir daqui: ****KEYBOARD****
    
    @IBAction func ativar(sender: AnyObject) {
            myDatePicker2.hidden = !simnao.on
    }
    
    // Movimentar a View quando o Keyboard surgir
    
    var keyboardHeight: CGFloat!
    var quando: String = ""
    var proxima: String = ""
    
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
    
    @IBAction func datePickerAction(sender: AnyObject) {
        
        let dateFormatter = NSDateFormatter()
        dateFormatter.dateFormat = "dd/MM/yyyy"
        let strDate = dateFormatter.stringFromDate(myDatePicker.date)
        self.quando = strDate
    }
    
    @IBAction func datePickerAction2(sender: AnyObject) {
        
        let dateFormatter = NSDateFormatter()
        dateFormatter.dateFormat = "dd/MM/yyyy"
        let strDate = dateFormatter.stringFromDate(myDatePicker2.date)
        self.proxima = strDate
    }
    
    
    
    @IBAction func adicionar(sender: AnyObject) {
        
        var nomeVacinas = NSUserDefaults.standardUserDefaults().objectForKey("nomeVacinas") as! [String]
        var administracaoVacinas = NSUserDefaults.standardUserDefaults().objectForKey("administracaoVacinas") as! [String]
        var validadeVacinas = NSUserDefaults.standardUserDefaults().objectForKey("validadeVacinas") as! [String]
        var proximaDose = NSUserDefaults.standardUserDefaults().objectForKey("proximaDose") as! [String]
        
        if(textField1.text != "" && textField4.text != ""){
            let dateFormatter = NSDateFormatter()
            dateFormatter.dateFormat = "dd/MM/yyyy"
            nomeVacinas.append(textField1.text!)
            administracaoVacinas.append(dateFormatter.stringFromDate(myDatePicker.date))
            if(proxima == ""){
                proximaDose.append("")
            }
            else{
                proximaDose.append(dateFormatter.stringFromDate(myDatePicker2.date))
            }
            validadeVacinas.append(textField4.text!)
        }
        else{
            let alerta = UIAlertController(title: "Atenção", message: "Preencha todas as informações", preferredStyle: .Alert)
            alerta.addAction(UIAlertAction(title: "Ok", style: .Default, handler: nil))
            self.presentViewController(alerta, animated: true, completion: nil)
        }
        
        NSUserDefaults.standardUserDefaults().setObject(nomeVacinas, forKey: "nomeVacinas")
        NSUserDefaults.standardUserDefaults().setObject(administracaoVacinas, forKey: "administracaoVacinas")
        NSUserDefaults.standardUserDefaults().setObject(validadeVacinas, forKey: "validadeVacinas")
        NSUserDefaults.standardUserDefaults().setObject(proximaDose, forKey: "proximaDose")
        
        self.performSegueWithIdentifier("adicionado", sender: self)
    }
}