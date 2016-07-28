//
//  AdicionarVacina.swift
//  HealthApp
//
//  Created by Arthur Carvalho on 7/22/16.
//  Copyright © 2016 Pedro Gomes Branco. All rights reserved.
//

import UIKit

class AdicionarVacina: UIViewController {
    
    //MARK: Outlets
    
    @IBOutlet var validadeSlider: UISlider!
    @IBOutlet var myDatePicker: UIDatePicker!
    @IBOutlet var myDatePicker2: UIDatePicker!
    
    @IBAction func dismissViewController(sender: AnyObject) {
        
        self.presentingViewController?.dismissViewControllerAnimated(true, completion: nil)
        
    }
    
    @IBAction func mudandoValidade(sender: AnyObject) {
        let currentValue = Int(validadeSlider.value)
        if(Int(validadeSlider.value) == 11){
            validadeLabel.text = "Vitalícia"
        }
        else{
            validadeLabel.text = "\(currentValue) anos"
        }
    }
    
    @IBOutlet var scrollView: UIScrollView!
    @IBOutlet var validadeLabel: UILabel!
    @IBOutlet var textField1: UITextField!
    @IBOutlet var textField4: UITextField!
    @IBOutlet var simnao: UISwitch!
    
    var pessoa: pessoas!
    
    //MARK: viewDidLoad
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
//        let currentValue = Int(validadeSlider.value)
//
//        if(Int(validadeSlider.value) == 11){
//            validadeLabel.text = "Vitalícia"
//        }
//        else{
//            validadeLabel.text = "\(currentValue) anos"
//        }
        
        textFieldStyles(textField1)
//        textFieldStyles(textField4)
        
    }
    
  
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
        
        pessoa.vacina.vacinas = NSUserDefaults.standardUserDefaults().objectForKey("\(pessoa.nome)vacinas") as! [String]
        pessoa.vacina.administracaoVacinas = NSUserDefaults.standardUserDefaults().objectForKey("\(pessoa.nome)administracaoVacinas") as! [String]
        pessoa.vacina.validadeVacinas = NSUserDefaults.standardUserDefaults().objectForKey("\(pessoa.nome)validadeVacinas") as! [String]
        pessoa.vacina.proximaDose = NSUserDefaults.standardUserDefaults().objectForKey("\(pessoa.nome)proximaDose") as! [String]
        pessoa.vacina.validadeVacinas = NSUserDefaults.standardUserDefaults().objectForKey("\(pessoa.nome)validadeVacinas") as! [String]
        pessoa.vacina.numeroDeDoses = NSUserDefaults.standardUserDefaults().objectForKey("\(pessoa.nome)numeroDeDoses") as! [String]
        pessoa.vacina.obs = NSUserDefaults.standardUserDefaults().objectForKey("\(pessoa.nome)obs") as! [String]
        
        if(textField1.text != ""){
            let dateFormatter = NSDateFormatter()
            dateFormatter.dateFormat = "dd/MM/yyyy"
            pessoa.vacina.vacinas.append(textField1.text!)
             pessoa.vacina.administracaoVacinas.append(dateFormatter.stringFromDate(myDatePicker.date))
            if(proxima == ""){
                 pessoa.vacina.proximaDose.append("")
            }
            else{
                 pessoa.vacina.proximaDose.append(dateFormatter.stringFromDate(myDatePicker2.date))
            }
//             pessoa.vacina.validadeVacinas.append(textField4.text!)
        }
        else{
            let alerta = UIAlertController(title: "Atenção", message: "Preencha todas as informações", preferredStyle: .Alert)
            alerta.addAction(UIAlertAction(title: "Ok", style: .Default, handler: nil))
            self.presentViewController(alerta, animated: true, completion: nil)
        }
        
        NSUserDefaults.standardUserDefaults().setObject(pessoa.vacina.vacinas, forKey: "\(pessoa.nome)vacinas")
        NSUserDefaults.standardUserDefaults().setObject(pessoa.vacina.administracaoVacinas, forKey: "\(pessoa.nome)administracaoVacinas")
        NSUserDefaults.standardUserDefaults().setObject(pessoa.vacina.validadeVacinas, forKey: "\(pessoa.nome)validadeVacinas")
        NSUserDefaults.standardUserDefaults().setObject(pessoa.vacina.proximaDose, forKey: "\(pessoa.nome)proximaDose")
        NSUserDefaults.standardUserDefaults().setObject(pessoa.vacina.numeroDeDoses, forKey: "\(pessoa.nome)numeroDeDoses")
        NSUserDefaults.standardUserDefaults().setObject(pessoa.vacina.obs, forKey: "\(pessoa.nome)obs")
        
        self.performSegueWithIdentifier("adicionado", sender: self)
    }
}