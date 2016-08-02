//
//  EmailCell.swift
//  HealthApp
//
//  Created by Pedro Gomes Branco on 7/29/16.
//  Copyright © 2016 Pedro Gomes Branco. All rights reserved.
//

import UIKit


class EmailCell: UICollectionViewCell {

    @IBOutlet var nome: UILabel!
    @IBOutlet var select: UIImageView!
    @IBOutlet var imagem: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        imagem.layer.cornerRadius = imagem.frame.size.width / 2
        imagem.clipsToBounds = true
    }
}
