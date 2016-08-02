//
//  ExameCellTableViewCell.swift
//  HealthApp
//
//  Created by Arthur Carvalho on 7/28/16.
//  Copyright © 2016 Pedro Gomes Branco. All rights reserved.
//

import UIKit

class ExameCellTableViewCell: UITableViewCell {

    @IBOutlet var nomeExame: UILabel!
    @IBOutlet var dataRealizacaoExame: UILabel!
    @IBOutlet var web: UIWebView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
}
