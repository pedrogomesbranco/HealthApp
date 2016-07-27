//
//  Objetos.swift
//  HealthApp
//
//  Created by Pedro Gomes Branco on 7/27/16.
//  Copyright © 2016 Pedro Gomes Branco. All rights reserved.
//

import Foundation
import UIKit

var criancas = ["BCG", "Hepatite B", "Pentavalente" ,"Penta/DTP", "VIP/VOP", "Pneumocócica 10V (conjugada)", "Rotavírus Humano", "Meningocócica C (conjugada)", "Febre Amarela", "Hepatite A", "Triplice Viral", "Tetra Viral"]
var adolescente = ["Hepatite B", "Febre Amarela", "Triplice Viral", "HPV", "Dupla Adulto"]
var adulto = ["Hepatite B", "Febre Amarela", "Triplice Viral", "Dupla Adulto"]
var idoso = ["Hepatite B", "Febre Amarela", "Dupla Adulto", "Gripe"]
var gestante = ["dTpa"]

enum Sexo{
    case Masculino
    case Feminino
}

enum Tipos{
    case Criança
    case Adolescente
    case Adulto
    case Idoso
    case Gestante
}

struct vacinas{
    var tipo: Tipos
    var vacinas: [String]
    var administracaoVacinas: [String]
    var validadeVacinas: [String]
    var proximaDose: [String]
    var numeroDeDoses: [String]
    var obs: [String]
    
    init(tipo: Tipos, vacinas: [String], administracaoVacinas: [String], validadeVacinas: [String], proximaDose: [String], numeroDeDoses: [String], obs: [String]){
        self.tipo = tipo
        self.vacinas = vacinas
        self.administracaoVacinas = administracaoVacinas
        self.validadeVacinas = validadeVacinas
        self.proximaDose = proximaDose
        self.numeroDeDoses = numeroDeDoses
        self.obs = obs
    }
}

struct pessoas{
    var nome: String
    var nascimento: String
    var sexo: Sexo
    var gravida: Bool
    var foto: UIImage
    var vacina: vacinas
    
    init(nome: String, vacina: vacinas, sexo: Sexo, nascimento: String, gravida: Bool, foto: UIImage){
        self.nome = nome
        self.vacina = vacina
        self.sexo = sexo
        self.nascimento = nascimento
        self.gravida = gravida
        self.foto = foto
    }
}