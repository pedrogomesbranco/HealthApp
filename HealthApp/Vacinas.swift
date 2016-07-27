//
//  Vacinas.swift
//  HealthApp
//
//  Created by Arthur Carvalho on 7/20/16.
//  Copyright © 2016 Pedro Gomes Branco. All rights reserved.
//

import UIKit

class Vacinas: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
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
    var nomeVacinas = ["BCG", "Anti-tetânica", "HPV"]
    
    //array para salvar as datas em que foram tomadas as vacinas
    var administracaoVacinas = ["12/06/16", "16/07/16", "19/08/16"]
    
    //array para salvar as datas de validade das vacinas
    var validadeVacinas = ["12/06/16", "16/07/16", "19/08/16"]
    
    var proximaDose = ["", "", ""]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.table.delegate = self
        self.table.dataSource = self
        
        if NSUserDefaults.standardUserDefaults().objectForKey("nomeVacinas") == nil{
            NSUserDefaults.standardUserDefaults().setObject(nomeVacinas, forKey: "nomeVacinas")
            NSUserDefaults.standardUserDefaults().setObject(administracaoVacinas, forKey: "administracaoVacinas")
            NSUserDefaults.standardUserDefaults().setObject(validadeVacinas, forKey: "validadeVacinas")
            NSUserDefaults.standardUserDefaults().setObject(proximaDose, forKey: "proximaDose")
        }
        else{
            nomeVacinas = NSUserDefaults.standardUserDefaults().objectForKey("nomeVacinas") as! [String]
            administracaoVacinas = NSUserDefaults.standardUserDefaults().objectForKey("administracaoVacinas") as! [String]
            validadeVacinas = NSUserDefaults.standardUserDefaults().objectForKey("validadeVacinas") as! [String]
            proximaDose = NSUserDefaults.standardUserDefaults().objectForKey("proximaDose") as! [String]
        }
        
        table.reloadData()
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return nomeVacinas.count
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
        cell!.title.text = nomeVacinas[indexPath.row]
        cell!.administracao.text = "Administrada: " + administracaoVacinas[indexPath.row]
        cell!.validade.text = "Validade: " + validadeVacinas[indexPath.row]
        return cell!
        
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        row = indexPath.row
        performSegueWithIdentifier("segue", sender: self)
    }
    
    func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        if indexPath.row < 3{
            return false
        }
        return true
    }
    
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == UITableViewCellEditingStyle.Delete{
            nomeVacinas.removeAtIndex(indexPath.row)
            administracaoVacinas.removeAtIndex(indexPath.row)
            proximaDose.removeAtIndex(indexPath.row)
            validadeVacinas.removeAtIndex(indexPath.row)
            NSUserDefaults.standardUserDefaults().setObject(nomeVacinas, forKey: "nomeVacinas")
            NSUserDefaults.standardUserDefaults().setObject(administracaoVacinas, forKey: "administracaoVacinas")
            NSUserDefaults.standardUserDefaults().setObject(validadeVacinas, forKey: "validadeVacinas")
            NSUserDefaults.standardUserDefaults().setObject(proximaDose, forKey: "proximaDose")
            table.deleteRowsAtIndexPaths([indexPath], withRowAnimation: UITableViewRowAnimation.Automatic)
            table.reloadData()
        }
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if (segue.identifier == "segue") {
            let viewController = segue.destinationViewController as! DetalheVacina
            viewController.index = row
        }
    }
}