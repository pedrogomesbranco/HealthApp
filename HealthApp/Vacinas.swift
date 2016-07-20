//
//  Vacinas.swift
//  HealthApp
//
//  Created by Arthur Carvalho on 7/20/16.
//  Copyright © 2016 Pedro Gomes Branco. All rights reserved.
//

import UIKit

class Vacinas: UIViewController, UITableViewDataSource, UITableViewDelegate {

    let nomeVacinas = ["BCG", "Anti-tetânica", "HPV"]
    let administracaoVacinas = ["12/06/16", "16/07/16", "19/08/16"]
    let validadeVacinas = [""]
    
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
    
        cell?.title.text = nomeVacinas[indexPath.row]
        cell?.administrada.text = "Administrada: " + administracaoVacinas[indexPath.row]
        cell?.validade.text = "Validade: " + gitvalidadeVacinas[indexPath.row]
        
        return cell!
    }
    
   
}
