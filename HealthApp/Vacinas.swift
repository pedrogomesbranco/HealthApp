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
    let datas = ["Administrada: 12/06/16 \n Validade: 12/06/26", "Administrada: 16/7", "Administrada: 19/8"]
    
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
        
        cell!.textLabel?.text = nomeVacinas[indexPath.row]
        cell?.detailTextLabel!.text = datas[indexPath.row]
        
       
        allowMultipleLines(cell!)
        
        return cell!
    }
    
    func allowMultipleLines(tableViewCell:UITableViewCell) {
        tableViewCell.textLabel?.numberOfLines = 0
        tableViewCell.textLabel?.lineBreakMode = NSLineBreakMode.ByWordWrapping
    }
}
