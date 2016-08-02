//
//  ExameCellTableViewCell.swift
//  HealthApp
//
//  Created by Arthur Carvalho on 7/28/16.
//  Copyright © 2016 Pedro Gomes Branco. All rights reserved.
//

import UIKit

class homeCell: UITableViewCell {
    
    @IBOutlet var imagem: UIImageView!
    @IBOutlet var texto: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code

    }
    
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
}
