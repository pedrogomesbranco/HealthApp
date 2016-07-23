//
//  Vacinas.swift
//  HealthApp
//
//  Created by Arthur Carvalho on 7/20/16.
//  Copyright © 2016 Pedro Gomes Branco. All rights reserved.
//

import UIKit

class Vacinas: UIViewController, UITableViewDataSource, UITableViewDelegate {

    //array para salvar o nome das vacinas
    let nomeVacinas = ["BCG", "Anti-tetânica", "HPV"]
    
    //array para salvar as datas em que foram tomadas as vacinas
    let administracaoVacinas = ["12/06/16", "16/07/16", "19/08/16"]
    
    //array para salvar as datas de validade das vacinas
    let validadeVacinas = ["12/06/16", "16/07/16", "19/08/16"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
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
    
        cell?.title.text = nomeVacinas[indexPath.row]
        
        cell?.administrada.text = "Administrada: " + administracaoVacinas[indexPath.row]
        
        cell?.validade.text = "Validade: " + validadeVacinas[indexPath.row]
        
        return cell!
        
    }
    
   
}
