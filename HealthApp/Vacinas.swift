//
//  Vacinas.swift
//  HealthApp
//
//  Created by Arthur Carvalho on 7/20/16.
//  Copyright © 2016 Pedro Gomes Branco. All rights reserved.
//

import UIKit

class Vacinas: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBAction func adicionar(sender: AnyObject) {
        self.performSegueWithIdentifier("adicionar", sender: self)
    }
    
    override func prefersStatusBarHidden() -> Bool {
        return true
    }
    
    //variaveis auxiliares para passar as Labels da Cell pra outra VC
    
    var nome: String!
    var administracao: String!
    var validade: String!
    var row: Int!

    @IBOutlet var table: UITableView!

    
    //array para salvar o nome das vacinas

    var pessoa: pessoas = pessoas.init(nome: "Pedro", vacina: vacinas.init(tipo: Tipos.Adulto, vacinas: adulto, administracaoVacinas: [""], validadeVacinas: [""], proximaDose: [""], numeroDeDoses: [""], obs: [""]), sexo: Sexo.Masculino, nascimento: "08/05/1993", gravida: false, foto: UIImage(named:"doctor")!)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.table.delegate = self
        self.table.dataSource = self
        
        if NSUserDefaults.standardUserDefaults().objectForKey("nomeVacinas") == nil{
            pessoa.vacina.administracaoVacinas.removeAll()
            pessoa.vacina.validadeVacinas.removeAll()
            pessoa.vacina.proximaDose.removeAll()
            pessoa.vacina.numeroDeDoses.removeAll()
            pessoa.vacina.obs.removeAll()
            
            for _ in criancas{
                pessoa.vacina.administracaoVacinas.append("")
                pessoa.vacina.validadeVacinas.append("")
                pessoa.vacina.proximaDose.append("")
                pessoa.vacina.numeroDeDoses.append("")
                pessoa.vacina.obs.append("")
            }
            
            NSUserDefaults.standardUserDefaults().setObject(pessoa.vacina.vacinas, forKey: "\(pessoa.nome)vacinas")
            NSUserDefaults.standardUserDefaults().setObject(pessoa.vacina.administracaoVacinas, forKey: "\(pessoa.nome)administracaoVacinas")
            NSUserDefaults.standardUserDefaults().setObject(pessoa.vacina.validadeVacinas, forKey: "\(pessoa.nome)validadeVacinas")
            NSUserDefaults.standardUserDefaults().setObject(pessoa.vacina.proximaDose, forKey: "\(pessoa.nome)proximaDose")
            NSUserDefaults.standardUserDefaults().setObject(pessoa.vacina.numeroDeDoses, forKey: "\(pessoa.nome)numeroDeDoses")
            NSUserDefaults.standardUserDefaults().setObject(pessoa.vacina.obs, forKey: "\(pessoa.nome)obs")
            pessoa.vacina.vacinas = NSUserDefaults.standardUserDefaults().objectForKey("\(pessoa.nome)vacinas") as! [String]
            pessoa.vacina.administracaoVacinas = NSUserDefaults.standardUserDefaults().objectForKey("\(pessoa.nome)administracaoVacinas") as! [String]
            pessoa.vacina.validadeVacinas = NSUserDefaults.standardUserDefaults().objectForKey("\(pessoa.nome)validadeVacinas") as! [String]
            pessoa.vacina.proximaDose = NSUserDefaults.standardUserDefaults().objectForKey("\(pessoa.nome)proximaDose") as! [String]
            pessoa.vacina.validadeVacinas = NSUserDefaults.standardUserDefaults().objectForKey("\(pessoa.nome)validadeVacinas") as! [String]
            pessoa.vacina.numeroDeDoses = NSUserDefaults.standardUserDefaults().objectForKey("\(pessoa.nome)numeroDeDoses") as! [String]
            pessoa.vacina.obs = NSUserDefaults.standardUserDefaults().objectForKey("\(pessoa.nome)obs") as! [String]
        }
        else{
            pessoa.vacina.vacinas = NSUserDefaults.standardUserDefaults().objectForKey("\(pessoa.nome)vacinas") as! [String]
            pessoa.vacina.administracaoVacinas = NSUserDefaults.standardUserDefaults().objectForKey("\(pessoa.nome)administracaoVacinas") as! [String]
            pessoa.vacina.validadeVacinas = NSUserDefaults.standardUserDefaults().objectForKey("\(pessoa.nome)validadeVacinas") as! [String]
            pessoa.vacina.proximaDose = NSUserDefaults.standardUserDefaults().objectForKey("\(pessoa.nome)proximaDose") as! [String]
            pessoa.vacina.validadeVacinas = NSUserDefaults.standardUserDefaults().objectForKey("\(pessoa.nome)validadeVacinas") as! [String]
            pessoa.vacina.numeroDeDoses = NSUserDefaults.standardUserDefaults().objectForKey("\(pessoa.nome)numeroDeDoses") as! [String]
            pessoa.vacina.obs = NSUserDefaults.standardUserDefaults().objectForKey("\(pessoa.nome)obs") as! [String]
        }
        
        print("\(pessoa.nome)vacinas")
        table.reloadData()
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pessoa.vacina.vacinas.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath) as? VacinaCell
        
        /***********************************************************************************
         ********************************** SHADOW *****************************************
         **********************************************************************************/
        
        let shadowFrame: CGRect = (cell?.layer.bounds)!
        let shadowPath: CGPathRef = UIBezierPath(rect: shadowFrame).CGPath
        cell?.layer.shadowPath = shadowPath
        
        cell?.layer.shadowOffset = CGSizeMake(0, 1)
        cell?.layer.shadowColor = UIColor.blackColor().CGColor
        cell?.layer.shadowRadius = 1
        cell?.layer.shadowOpacity = 0.3
        cell?.clipsToBounds = false
        
        /********************************************************************************
         *********************************************************************************
         *********************************************************************************/
        cell!.title.text = pessoa.vacina.vacinas[indexPath.row]
        cell!.administracao.text = "Administrada: " + pessoa.vacina.administracaoVacinas[indexPath.row]
        cell!.validade.text = "Validade: " + pessoa.vacina.validadeVacinas[indexPath.row]
        return cell!
        
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        row = indexPath.row
        performSegueWithIdentifier("segue", sender: self)
    }
    
    func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        if indexPath.row < contagem(pessoa.vacina.tipo){
            return false
        }
        return true
    }
    
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == UITableViewCellEditingStyle.Delete{
            pessoa.vacina.vacinas.removeAtIndex(indexPath.row)
            pessoa.vacina.administracaoVacinas.removeAtIndex(indexPath.row)
            pessoa.vacina.proximaDose.removeAtIndex(indexPath.row)
            pessoa.vacina.validadeVacinas.removeAtIndex(indexPath.row)
            pessoa.vacina.obs.removeAtIndex(indexPath.row)
            pessoa.vacina.numeroDeDoses.removeAtIndex(indexPath.row)
            NSUserDefaults.standardUserDefaults().setObject(pessoa.vacina.vacinas, forKey: "\(pessoa.nome)vacinas")
            NSUserDefaults.standardUserDefaults().setObject(pessoa.vacina.administracaoVacinas, forKey: "\(pessoa.nome)administracaoVacinas")
            NSUserDefaults.standardUserDefaults().setObject(pessoa.vacina.validadeVacinas, forKey: "\(pessoa.nome)validadeVacinas")
            NSUserDefaults.standardUserDefaults().setObject(pessoa.vacina.proximaDose, forKey: "\(pessoa.nome)proximaDose")
            NSUserDefaults.standardUserDefaults().setObject(pessoa.vacina.numeroDeDoses, forKey: "\(pessoa.nome)numeroDeDoses")
            NSUserDefaults.standardUserDefaults().setObject(pessoa.vacina.obs, forKey: "\(pessoa.nome)obs")
            table.deleteRowsAtIndexPaths([indexPath], withRowAnimation: UITableViewRowAnimation.Automatic)
            table.reloadData()
        }
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if (segue.identifier == "segue") {
            let viewController = segue.destinationViewController as! DetalheVacina
            viewController.index = row
            viewController.pessoa = self.pessoa
        }
        else if(segue.identifier == "adicionar"){
            let viewController = segue.destinationViewController as! AdicionarVacina
            viewController.pessoa = self.pessoa
        }
    }
    
    func contagem(tipo: Tipos)-> Int{
        if(tipo == Tipos.Adulto){
            return adulto.count
        }
        else if(tipo == Tipos.Adolescente){
            return adolescente.count
        }
        else if(tipo == Tipos.Criança){
            return criancas.count
        }
        else if(tipo == Tipos.Idoso){
            return idoso.count
        }
        else{
            return adulto.count+1
        }
    }
}