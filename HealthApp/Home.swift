//
//  HomeViewController.swift
//  HealthApp
//
//  Created by Bia Lemos on 7/22/16.
//  Copyright © 2016 Pedro Gomes Branco. All rights reserved.
//

import UIKit

class Home: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet var table: UITableView!
    @IBOutlet weak var olaLabel: UILabel!
    
    var i = 4

    override func viewDidLoad() {
        super.viewDidLoad()
        self.table.delegate = self
        self.table.dataSource = self
        self.table.separatorStyle = UITableViewCellSeparatorStyle.None
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    let imagens = [UIImage(named: "Group 4"), UIImage(named: "Group 3"), UIImage(named: "Group 22"),  UIImage(named: "Group 2")]
    let textos = ["Atenção! Sua vacina Antitetânica vence em 14 dias.", "A sua próxima dose da Triplice Viral é daqui a 4 dias.", "Você tem dados que precisam ser preenchidos!", "Não se esqueça de informar a data do Exame de Vista."]
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return i
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("home") as! homeCell
        if(imagens[indexPath.row] == UIImage(named: "Group 2") || imagens[indexPath.row] == UIImage(named: "Group 22")){
            cell.imagem.contentMode = .Center
        }
        else{
            cell.imagem.contentMode = .Top
        }
        cell.imagem.image = imagens[indexPath.row]
        cell.texto.text = textos[indexPath.row]
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        performSegueWithIdentifier("cell", sender: self)
    }


}

