//
//  DetalheVacina.swift
//  HealthApp
//
//  Created by Arthur Carvalho on 7/23/16.
//  Copyright © 2016 Pedro Gomes Branco. All rights reserved.
//

import UIKit

class DetalheVacina: UIViewController {
    
    //variaveis que armazenam as informação que estão vindo da classe Vacina
    var recebeString:String!
    var recebeString2:String!
    var recebeString3:String!
    
    @IBOutlet var nomeVacina: UILabel!
    @IBOutlet var administracaoVacina: UILabel!
    @IBOutlet var validadeVacina: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        nomeVacina.text = recebeString
        administracaoVacina.text = recebeString2
        validadeVacina.text = recebeString3
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    


}
