//
//  DetalheVacina.swift
//  HealthApp
//
//  Created by Arthur Carvalho on 7/23/16.
//  Copyright © 2016 Pedro Gomes Branco. All rights reserved.
//

import UIKit

class DetalheVacina: UIViewController {
    
    @IBOutlet var validadeLabel: UILabel!
    @IBOutlet var sliderValidade: UISlider!
    @IBAction func mudandoValidade(sender: AnyObject) {
    }
    //variaveis que armazenam as informação que estão vindo da classe Vacina
    var recebeString:String!
    var recebeString2:String!
    var recebeString3:String!
    var index: Int!
    
    @IBOutlet var simnao: UISwitch!
    @IBOutlet var proximaDose: UILabel!
    @IBOutlet var nomeVacina: UILabel!
    @IBOutlet var administracaoVacina: UILabel!
    @IBOutlet var validadeVacina: UILabel!
    @IBOutlet var text1: UITextField!
    
    @IBOutlet var data2: UIDatePicker!
    @IBOutlet var data1: UIDatePicker!
    @IBOutlet var text4: UITextField!
    
    var nomeVacinas = NSUserDefaults.standardUserDefaults().objectForKey("nomeVacinas") as! [String]
    var administracaoVacinas = NSUserDefaults.standardUserDefaults().objectForKey("administracaoVacinas") as! [String]
    var validadeVacinas = NSUserDefaults.standardUserDefaults().objectForKey("validadeVacinas") as! [String]
    var proximasDose = NSUserDefaults.standardUserDefaults().objectForKey("proximaDose") as! [String]
    
    @IBAction func dismissViewController(sender: AnyObject) {
        
        self.dismissViewControllerAnimated(true, completion: nil)
        
    }
    
    @IBAction func ativar(sender: AnyObject) {
        data2.hidden = !simnao.on
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        nomeVacina.text = nomeVacinas[index]
        administracaoVacina.text = administracaoVacinas[index]
        validadeVacina.text = validadeVacinas[index]
        if proximasDose[index] == ""{
            proximaDose.text = "--"
        }
        else{
            proximaDose.text = proximasDose[index]
        }
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func editar(sender: AnyObject) {
        let formatter = NSDateFormatter()
        formatter.locale = NSLocale(localeIdentifier: "BR_pt")
        formatter.dateFormat = "dd/MM/yyyy"
        
        proximaDose.hidden = true
        nomeVacina.hidden = true
        administracaoVacina.hidden = true
        validadeVacina.hidden = true

        
        simnao.hidden = false
        text1.hidden = false
        data1.hidden = false
        if(proximasDose[index] != ""){
            simnao.on = true
            data2.hidden = false
        }
        text4.hidden = false
        
        text1.text = nomeVacinas[index]
        data1.date = formatter.dateFromString(administracaoVacinas[index])!
        if(proximasDose[index] != ""){
            data2.date = formatter.dateFromString(proximasDose[index])!
        }
        text4.text = validadeVacinas[index]
    }
    
    @IBAction func atualizar(sender: AnyObject) {
        let dateFormatter = NSDateFormatter()
        dateFormatter.dateFormat = "dd-MM-yyyy"
        if(text1.text != "" && text4.text != ""){
            nomeVacinas[index] = text1.text!
            administracaoVacinas[index] = dateFormatter.stringFromDate(data1.date)
            if simnao.on == false{
                proximasDose[index] = ""
            }
            else{
                proximasDose[index] = dateFormatter.stringFromDate(data2.date)
            }
            validadeVacinas[index] = text4.text!
        }
        else{
            let alerta = UIAlertController(title: "Atenção", message: "Preencha corretamente as informações", preferredStyle: .Alert)
            alerta.addAction(UIAlertAction(title: "Ok", style: .Default, handler: nil))
            self.presentViewController(alerta, animated: true, completion: nil)
        }
        NSUserDefaults.standardUserDefaults().setObject(nomeVacinas, forKey: "nomeVacinas")
        NSUserDefaults.standardUserDefaults().setObject(administracaoVacinas, forKey: "administracaoVacinas")
        NSUserDefaults.standardUserDefaults().setObject(validadeVacinas, forKey: "validadeVacinas")
        NSUserDefaults.standardUserDefaults().setObject(proximasDose, forKey: "proximaDose")
        self.performSegueWithIdentifier("atualizado", sender: self)
    }
}
