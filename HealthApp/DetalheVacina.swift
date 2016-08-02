//
//  DetalheVacina.swift
//  HealthApp
//
//  Created by Arthur Carvalho on 7/23/16.
//  Copyright © 2016 Pedro Gomes Branco. All rights reserved.
//

import UIKit

class DetalheVacina: UIViewController {
    
    @IBOutlet var nomeVacina: UILabel!
    @IBOutlet var prox: UILabel!
    var i = false
    @IBOutlet var NAO: UIButton!
    @IBAction func nao(sender: AnyObject) {
        if(i == false){
            data2.hidden = true
            prox.hidden = false
            NAO.setTitle("NECESSÁRIA?", forState: .Normal)
            i = true
        }
        else{
            data2.hidden = !true
            prox.hidden = !false
            NAO.setTitle("NÃO NECESSÁRIA?", forState: .Normal)
            i = false
        }
        
    }
    
    var recebeString:String!
    var recebeString2:String!
    var recebeString3:String!
    var index: Int!
    var pessoa: pessoas!

    
    @IBOutlet var data2: UIDatePicker!
    @IBOutlet var data1: UIDatePicker!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        pessoa.nome = "Pedro"
        pessoa.vacina.vacinas = NSUserDefaults.standardUserDefaults().objectForKey("\(pessoa.nome)vacinas") as! [String]
        pessoa.vacina.administracaoVacinas = NSUserDefaults.standardUserDefaults().objectForKey("\(pessoa.nome)administracaoVacinas") as! [String]
        pessoa.vacina.validadeVacinas = NSUserDefaults.standardUserDefaults().objectForKey("\(pessoa.nome)validadeVacinas") as! [String]
        pessoa.vacina.proximaDose = NSUserDefaults.standardUserDefaults().objectForKey("\(pessoa.nome)proximaDose") as! [String]
        pessoa.vacina.validadeVacinas = NSUserDefaults.standardUserDefaults().objectForKey("\(pessoa.nome)validadeVacinas") as! [String]
        pessoa.vacina.numeroDeDoses = NSUserDefaults.standardUserDefaults().objectForKey("\(pessoa.nome)numeroDeDoses") as! [String]
        pessoa.vacina.obs = NSUserDefaults.standardUserDefaults().objectForKey("\(pessoa.nome)obs") as! [String]
        
        
        let formatter = NSDateFormatter()
        formatter.locale = NSLocale(localeIdentifier: "BR_pt")
        formatter.dateFormat = "dd/MM/yyyy"
        
        
        nomeVacina.text = pessoa.vacina.vacinas[index]
        if pessoa.vacina.administracaoVacinas[index] != ""{
            data1.date = formatter.dateFromString(pessoa.vacina.administracaoVacinas[index])!}
        if(pessoa.vacina.proximaDose[index] != ""){
            data2.date = formatter.dateFromString(pessoa.vacina.proximaDose[index])!
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func atualizar(sender: AnyObject) {
        let dateFormatter = NSDateFormatter()
        dateFormatter.dateFormat = "dd-MM-yyyy"
            pessoa.vacina.administracaoVacinas[index] = dateFormatter.stringFromDate(data1.date)
            if dateFormatter.stringFromDate(data1.date) == dateFormatter.stringFromDate(data2.date){
                pessoa.vacina.proximaDose[index] = ""
            }
            else if dateFormatter.stringFromDate(data2.date) == ""{
                pessoa.vacina.proximaDose[index] = "Não necessária"
            }
            else{
                pessoa.vacina.proximaDose[index] = dateFormatter.stringFromDate(data2.date)
            }
        
        NSUserDefaults.standardUserDefaults().setObject(pessoa.vacina.vacinas, forKey: "\(pessoa.nome)vacinas")
        NSUserDefaults.standardUserDefaults().setObject(pessoa.vacina.administracaoVacinas, forKey: "\(pessoa.nome)administracaoVacinas")
        NSUserDefaults.standardUserDefaults().setObject(pessoa.vacina.validadeVacinas, forKey: "\(pessoa.nome)validadeVacinas")
        NSUserDefaults.standardUserDefaults().setObject(pessoa.vacina.proximaDose, forKey: "\(pessoa.nome)proximaDose")
        self.performSegueWithIdentifier("atualizado", sender: self)
    }
}