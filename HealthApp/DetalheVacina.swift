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
        let currentValue = Int(sliderValidade.value)
        if(Int(sliderValidade.value) == 11){
            validadeLabel.text = "Vitalícia"
        }
        else{
            validadeLabel.text = "\(currentValue) anos"
        }
    }
    
    var recebeString:String!
    var recebeString2:String!
    var recebeString3:String!
    var index: Int!
    var pessoa: pessoas!
    
    @IBOutlet var simnao: UISwitch!
    @IBOutlet var proximaDose: UILabel!
    @IBOutlet var nomeVacina: UILabel!
    @IBOutlet var administracaoVacina: UILabel!
    @IBOutlet var validadeVacina: UILabel!
    @IBOutlet var text1: UITextField!
    
    @IBOutlet var data2: UIDatePicker!
    @IBOutlet var data1: UIDatePicker!
    @IBOutlet var text4: UITextField!
    
    @IBAction func dismissViewController(sender: AnyObject) {
        
        self.dismissViewControllerAnimated(true, completion: nil)
        
    }
    
    @IBAction func ativar(sender: AnyObject) {
        data2.hidden = !simnao.on
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        pessoa.vacina.vacinas = NSUserDefaults.standardUserDefaults().objectForKey("\(pessoa.nome)vacinas") as! [String]
        pessoa.vacina.administracaoVacinas = NSUserDefaults.standardUserDefaults().objectForKey("\(pessoa.nome)administracaoVacinas") as! [String]
        pessoa.vacina.validadeVacinas = NSUserDefaults.standardUserDefaults().objectForKey("\(pessoa.nome)validadeVacinas") as! [String]
        pessoa.vacina.proximaDose = NSUserDefaults.standardUserDefaults().objectForKey("\(pessoa.nome)proximaDose") as! [String]
        pessoa.vacina.validadeVacinas = NSUserDefaults.standardUserDefaults().objectForKey("\(pessoa.nome)validadeVacinas") as! [String]
        pessoa.vacina.numeroDeDoses = NSUserDefaults.standardUserDefaults().objectForKey("\(pessoa.nome)numeroDeDoses") as! [String]
        pessoa.vacina.obs = NSUserDefaults.standardUserDefaults().objectForKey("\(pessoa.nome)obs") as! [String]
        
        validadeLabel.hidden = true
        sliderValidade.hidden = true
        
        nomeVacina.text = pessoa.vacina.vacinas[index]
        administracaoVacina.text = pessoa.vacina.administracaoVacinas[index]
        validadeVacina.text = pessoa.vacina.validadeVacinas[index]
        if pessoa.vacina.proximaDose[index] == ""{
            proximaDose.text = "--"
        }
        else{
            proximaDose.text = pessoa.vacina.proximaDose[index]
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
        
        let currentValue = Int(sliderValidade.value)
        
        if(Int(sliderValidade.value) == 11){
            validadeLabel.text = "Vitalícia"
        }
        else{
            validadeLabel.text = "\(currentValue) anos"
        }
        proximaDose.hidden = true
        nomeVacina.hidden = true
        administracaoVacina.hidden = true
        validadeVacina.hidden = true
        
        simnao.hidden = false
        text1.hidden = false
        data1.hidden = false
        if(pessoa.vacina.proximaDose[index] != ""){
            simnao.on = true
            data2.hidden = false
        }
        validadeLabel.hidden = false
        sliderValidade.hidden = false
        text1.text = pessoa.vacina.vacinas[index]
        data1.date = formatter.dateFromString(pessoa.vacina.administracaoVacinas[index])!
        if(pessoa.vacina.proximaDose[index] != ""){
            data2.date = formatter.dateFromString(pessoa.vacina.proximaDose[index])!
        }
    }
    
    @IBAction func atualizar(sender: AnyObject) {
        let dateFormatter = NSDateFormatter()
        dateFormatter.dateFormat = "dd-MM-yyyy"
        if(text1.text != "" && text4.text != ""){
            pessoa.vacina.vacinas[index] = text1.text!
            pessoa.vacina.administracaoVacinas[index] = dateFormatter.stringFromDate(data1.date)
            if simnao.on == false{
                pessoa.vacina.proximaDose[index] = ""
            }
            else{
                pessoa.vacina.proximaDose[index] = dateFormatter.stringFromDate(data2.date)
            }
            pessoa.vacina.validadeVacinas[index] = text4.text!
        }
        else{
            let alerta = UIAlertController(title: "Atenção", message: "Preencha corretamente as informações", preferredStyle: .Alert)
            alerta.addAction(UIAlertAction(title: "Ok", style: .Default, handler: nil))
            self.presentViewController(alerta, animated: true, completion: nil)
        }
        NSUserDefaults.standardUserDefaults().setObject(pessoa.vacina.vacinas, forKey: "\(pessoa.nome)nomeVacinas")
        NSUserDefaults.standardUserDefaults().setObject(pessoa.vacina.administracaoVacinas, forKey: "\(pessoa.nome)administracaoVacinas")
        NSUserDefaults.standardUserDefaults().setObject(pessoa.vacina.validadeVacinas, forKey: "\(pessoa.nome)validadeVacinas")
        NSUserDefaults.standardUserDefaults().setObject(pessoa.vacina.proximaDose, forKey: "\(pessoa.nome)proximaDose")
        self.performSegueWithIdentifier("atualizado", sender: self)
    }
}