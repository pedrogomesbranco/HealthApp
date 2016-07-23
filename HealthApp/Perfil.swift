//
//  Perfil.swift
//  HealthApp
//
//  Created by Arthur Carvalho on 7/23/16.
//  Copyright © 2016 Pedro Gomes Branco. All rights reserved.
//

import UIKit

class Perfil: UIViewController {
    
    @IBOutlet var imagemUsuario: UIImageView!
    @IBOutlet var scrollView: UIScrollView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        scrollView.contentSize.height = 1000
        
        arredondarImagem(imagemUsuario)
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func arredondarImagem (imagem:UIImageView) {
        
        imagem.frame = CGRectMake(0, 0, 120, 120)
        imagem.layer.borderColor = UIColor.clearColor().CGColor
        imagem.layer.cornerRadius = imagem.frame.size.height/2
        imagem.layer.masksToBounds = true
        imagem.clipsToBounds = true
        imagem.layer.borderWidth = 1.0
        imagem.contentMode = UIViewContentMode.ScaleAspectFill
    
    }
    
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
}
