//
//  Perfil.swift
//  HealthApp
//
//  Created by Arthur Carvalho on 7/23/16.
//  Copyright © 2016 Pedro Gomes Branco. All rights reserved.
//

import UIKit

class Perfil: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
    //MARK: Outlets
    
    @IBOutlet var imagemUsuario: UIImageView!
    @IBOutlet var scrollView: UIScrollView!
    
    //MARK: ViewDidLoad
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        scrollView.contentSize.height = 1000
        
        arredondarImagem(imagemUsuario)

        
    }
    
    //MARK: Funções
    
    func arredondarImagem (imagem:UIImageView) {
        
        imagem.frame = CGRectMake(0, 0, 120, 120)
        imagem.layer.borderColor = UIColor.clearColor().CGColor
        imagem.layer.cornerRadius = imagem.frame.size.height/2
        imagem.layer.masksToBounds = true
        imagem.clipsToBounds = true
        imagem.layer.borderWidth = 1.0
        imagem.contentMode = UIViewContentMode.ScaleAspectFill
        
    }
    
    
    //MARK: TableView
    
    @IBOutlet var tableView: UITableView!
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 6
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        
            if indexPath.row == 0 {
        
                let cell: UITableViewCell = UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: "cell1")
                    
                return cell
                
            } else if indexPath.row == 1 {
                
                let cell: UITableViewCell = UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: ("cell2"))
                return cell
                
            } else if indexPath.row == 2 {
                
                let cell = tableView.dequeueReusableCellWithIdentifier("cell3")
                return cell!
                
            } else if indexPath.row == 3 {
                
                let cell = tableView.dequeueReusableCellWithIdentifier("cell4")
                return cell!
                
            } else if indexPath.row == 4 {
                
                let cell = tableView.dequeueReusableCellWithIdentifier("cell5")
                return cell!
                
            } else {
                
                let cell = tableView.dequeueReusableCellWithIdentifier("cell6")
                
                return cell!
            }
            
    }
}