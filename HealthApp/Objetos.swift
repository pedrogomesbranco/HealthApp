//
//  Objetos.swift
//  HealthApp
//
//  Created by Pedro Gomes Branco on 7/27/16.
//  Copyright © 2016 Pedro Gomes Branco. All rights reserved.
//

import Foundation
import UIKit

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

//var bcg: vacina = vacina.init(tipo: [Tipos.Criança], nome: "BCG", ultimaDose: "", proximaDose: "", numeroDeDoses: "1", obs: "")
//
//var hepatiteB: vacina = vacina.init(tipo: [Tipos.Criança], nome: "Hepatite B", ultimaDose: "", proximaDose: "", numeroDeDoses: "3", obs: "")
//
//var hepatiteBG: vacina = vacina.init(tipo: [Tipos.Gestante], nome: "Hepatite B", ultimaDose: "", proximaDose: "", numeroDeDoses: "1", obs: "")
//
//var antiRabica: vacina = vacina.init(tipo: [Tipos.Criança, Tipos.Adolescente, Tipos.Adulto, Tipos.Gestante, Tipos.Idoso], nome: "Anti-rábica", ultimaDose: "", proximaDose: "", numeroDeDoses: "3", obs: "")
//
//var antiRabicaA: vacina = vacina.init(tipo: [Tipos.Criança, Tipos.Adolescente, Tipos.Adulto, Tipos.Gestante, Tipos.Idoso], nome: "Anti-rábica", ultimaDose: "", proximaDose: "", numeroDeDoses: "1", obs: "")
//
//var tetano: vacina = vacina.init(tipo: [Tipos.Criança, Tipos.Adolescente, Tipos.Adulto, Tipos.Gestante, Tipos.Idoso], nome: "Difteria e Tétano (Antitetânica)", ultimaDose: "", proximaDose: "", numeroDeDoses: "1", obs: "")
//
//var febreAmarela: vacina = vacina.init(tipo: [Tipos.Criança, Tipos.Adolescente, Tipos.Adulto, Tipos.Idoso], nome: "Febre Amarela", ultimaDose: "", proximaDose: "", numeroDeDoses: "1", obs: "")
//
//var febreTifoide: vacina = vacina.init(tipo: [Tipos.Criança, Tipos.Adolescente, Tipos.Adulto, Tipos.Idoso], nome: "Febre Tifoide", ultimaDose: "", proximaDose: "", numeroDeDoses: "1", obs: "")
//
//var influenzaB: vacina = vacina.init(tipo: [Tipos.Criança], nome: "Haemophilus (Influenza tipo B)", ultimaDose: "", proximaDose: "", numeroDeDoses: "3", obs: "")
//
//var hepatiteA: vacina = vacina.init(tipo: [Tipos.Criança], nome: "Hepatite A", ultimaDose: "", proximaDose: "", numeroDeDoses: "2", obs: "")
//
//var hpvB: vacina = vacina.init(tipo: [Tipos.Criança, Tipos.Adulto], nome: "HPV (bivalente)", ultimaDose: "", proximaDose: "", numeroDeDoses: "1", obs: "")
//
//var hpvQ: vacina = vacina.init(tipo: [Tipos.Criança], nome: "HPV (Quadrivalente)", ultimaDose: "", proximaDose: "", numeroDeDoses: "1", obs: "")
//
//var influenza: vacina = vacina.init(tipo: [Tipos.Criança, Tipos.Adolescente, Tipos.Adulto, Tipos.Gestante, Tipos.Idoso], nome: "Influenza (Gripe)", ultimaDose: "", proximaDose: "", numeroDeDoses: "1", obs: "")
//
//var meningocica: vacina = vacina.init(tipo: [Tipos.Criança], nome: "Meningocócia C conjugada", ultimaDose: "", proximaDose: "", numeroDeDoses: "3", obs: "")
//
//var pentavalente: vacina = vacina.init(tipo: [Tipos.Criança], nome: "Pentavalente", ultimaDose: "", proximaDose: "", numeroDeDoses: "3", obs: "")
//
//var pneumotica: vacina = vacina.init(tipo: [Tipos.Criança], nome: "Pneumocócica conjugada", ultimaDose: "", proximaDose: "", numeroDeDoses: "4", obs: "")
//
//var poliomelite: vacina = vacina.init(tipo: [Tipos.Criança], nome: "Poliomielite (oral)", ultimaDose: "", proximaDose: "", numeroDeDoses: "4", obs: "")
//
//var rotaM: vacina = vacina.init(tipo: [Tipos.Criança], nome: "Rotavírus (monovalente)", ultimaDose: "", proximaDose: "", numeroDeDoses: "2", obs: "")
//
//var rotaP: vacina = vacina.init(tipo: [Tipos.Criança], nome: "Rotavírus (pentavalente)", ultimaDose: "", proximaDose: "", numeroDeDoses: "3", obs: "")
//
//var tetra: vacina = vacina.init(tipo: [Tipos.Criança], nome: "Tetra Viral", ultimaDose: "", proximaDose: "", numeroDeDoses: "1", obs: "")
//
//var triplice: vacina = vacina.init(tipo: [Tipos.Criança], nome: "Tríplice Bacteriana", ultimaDose: "", proximaDose: "", numeroDeDoses: "5", obs: "")
//
//var tripliceV: vacina = vacina.init(tipo: [Tipos.Criança], nome: "Tríplice Viral", ultimaDose: "", proximaDose: "", numeroDeDoses: "1", obs: "")
//
//var varicela: vacina = vacina.init(tipo: [Tipos.Criança], nome: "Varicela (Catapora)", ultimaDose: "", proximaDose: "", numeroDeDoses: "1", obs: "")

// crianças
var criancas = ["BCG", "Hepatite B", "Pentavalente" ,"Penta/DTP", "VIP/VOP", "Pneumocócica 10V (conjugada)", "Rotavírus Humano", "Meningocócica C (conjugada)", "Febre Amarela", "Hepatite A", "Triplice Viral", "Tetra Viral"]
var criancasAdministracaoVacinas = [String]()
var criancasValidadeVacinas = [String]()
var criancasProximaDose = [String]()
var criancasNumeroDeDoses = [String]()
var criancasObs = [String]()

// adolescente
var adolescente = ["Hepatite B", "Febre Amarela", "Triplice Viral", "HPV", "Dupla Adulto"]
var adolescenteAdministracaoVacinas = ["","","","",""]
var adolescenteValidadeVacinas = [String]()
var adolescenteProximaDose = [String]()
var adolescenteNumeroDeDoses = [String]()
var adolescenteObs = [String]()

// adulto
var adulto = ["Hepatite B", "Febre Amarela", "Triplice Viral", "Dupla Adulto"]
var adultoAdministracaoVacinas = [String]()
var adultoValidadeVacinas = [String]()
var adultoProximaDose = [String]()
var adultoNumeroDeDoses = [String]()
var adultoObs = [String]()

// idoso
var idoso = ["Hepatite B", "Febre Amarela", "Dupla Adulto", "Gripe"]
var idosoAdministracaoVacinas = [String]()
var idosoValidadeVacinas = [String]()
var idosoProximaDose = [String]()
var idosoNumeroDeDoses = [String]()
var idosoObs = [String]()

// gestante
var gestante = ["dTpa"]
var gestanteAdministracaoVacinas = [String]()
var gestanteValidadeVacinas = [String]()
var gestanteProximaDose = [String]()
var gestanteNumeroDeDoses = [String]()
var gestanteObs = [String]()