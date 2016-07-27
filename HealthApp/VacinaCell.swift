//
//  VacinaCell.swift
//  HealthApp
//
//  Created by Arthur Carvalho on 7/20/16.
//  Copyright © 2016 Pedro Gomes Branco. All rights reserved.
//

import UIKit


class VacinaCell: UITableViewCell {
    
    @IBOutlet var img5: UIImageView!
    @IBOutlet var img4: UIImageView!
    
    @IBOutlet var img3: UIImageView!
    
    @IBOutlet var img2: UIImageView!
    
    @IBOutlet var img1: UIImageView!
    
    //labels da célula da TableView de vacinas
    
    //nome da vacina
    @IBOutlet var title: UILabel!
    //data em que foi tomada a vacina
    @IBOutlet var administracao: UILabel!
    //data de validade da vacina
    @IBOutlet var validade: UILabel!
    
}
