//
//  ExameCellTableViewCell.swift
//  HealthApp
//
//  Created by Arthur Carvalho on 7/28/16.
//  Copyright © 2016 Pedro Gomes Branco. All rights reserved.
//

import UIKit

class MedCell: UITableViewCell {
    
    @IBOutlet var consulta: UILabel!
    @IBOutlet var nome: UILabel!
    @IBOutlet var especialidade: UILabel!
    @IBOutlet var foto: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        foto.layer.cornerRadius = foto.frame.size.width / 2
        foto.clipsToBounds = true
    }
    
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
}
