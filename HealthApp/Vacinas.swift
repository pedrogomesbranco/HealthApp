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
    let dataAplicacao = ["12/6", "16/7", "19/8"]
    let dataValidade = [""]
    
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
        let cell = tableView.dequeueReusableCellWithIdentifier("cell")
        
        return cell!
    }
}
