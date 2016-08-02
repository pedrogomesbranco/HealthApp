//
//  Exames.swift
//  HealthApp
//
//  Created by Arthur Carvalho on 7/28/16.
//  Copyright © 2016 Pedro Gomes Branco. All rights reserved.
//

import UIKit

class Exames: UIViewController, UITableViewDataSource, UITableViewDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    var exames = ["EXAME DE SANGUE", "EXAME DE VISTA", "EXAME DE URINA", "TOMOGRAFIA"]
    var exames2 = ["08/07/2016", " ", "12/12/2014", "23/05/2015"]

    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath) as! ExameCellTableViewCell
        if let pdf = NSBundle.mainBundle().URLForResource("myPdf\(indexPath.row+1)", withExtension: "pdf", subdirectory: nil, localization: nil)  {
            let req = NSURLRequest(URL: pdf)
            cell.web.loadRequest(req)
        }
        
        cell.nomeExame.text = exames[indexPath.row]
        cell.dataRealizacaoExame.text = exames2[indexPath.row]
        
        return cell
        
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return exames.count
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        self.performSegueWithIdentifier("show", sender: self)
    }
    
}
