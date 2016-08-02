//
//  MedicosViewController.swift
//  HealthApp
//
//  Created by Bia Lemos on 7/22/16.
//  Copyright © 2016 Pedro Gomes Branco. All rights reserved.
//

import UIKit

class Medicos: UIViewController {
    
    @IBOutlet weak var pesquisarBar: UISearchBar!
    @IBOutlet var table: UITableView!
    
    var selecionado: Int!
    
    struct medico{
        var foto: UIImage
        var nome: String
        var crm: String
        var especialidade: String
        var celular: String
        var telefone: String
        var email: String
        var consulta: String
        init(foto: UIImage, nome: String, crm: String, especialidade: String, celular: String, telefone: String, email: String, consulta: String){
            self.foto = foto
            self.nome = nome
            self.crm = crm
            self.especialidade = especialidade
            self.celular = celular
            self.telefone = telefone
            self.email = email
            self.consulta = consulta
        }
    }

    var medicos: [medico] = [medico.init(foto: UIImage(named: "flavio")!, nome: "Dr. Fávio Bandeira", crm: "675293-RJ", especialidade: "Dermatologista", celular: "(21) 99988-7721", telefone: "(21) 3325-1816", email: "pedrogomesbranco@me.com", consulta: "16/12/2016 às 19h"),
                             medico.init(foto: UIImage(named: "monica")!, nome: "Dra. Mônica Gomes", crm: "096291-RJ", especialidade: "Oftalmologista", celular: "(21) 99988-7721", telefone: "(21) 3325-1816", email: "prevmama@hotmail.com", consulta: ""),
                             medico.init(foto: UIImage(named: "tonia")!, nome: "Dra. Antônia Cupello", crm: "128977-RJ", especialidade: "Urologista", celular: "(21) 99988-7721", telefone: "(21) 3325-1816", email: "pedrogomesbranco@me.com", consulta: ""),
                             medico.init(foto: UIImage(named: "joao")!, nome: "Dr. João Cupello", crm: "049832-RJ", especialidade: "Clínico Geral", celular: "(21) 99988-7721", telefone: "(21) 3325-1816", email: "jcupelo@me.com", consulta: "08/08/2016 às 14h"),
                             medico.init(foto: UIImage(named: "guga")!, nome: "Dr. Gustavo Domingues", crm: "677462-RJ", especialidade: "Anestesista", celular: "(21) 99988-7721", telefone: "(21) 3325-1816", email: "jcupelo@me.com", consulta: "08/08/2016 às 14h"),
                             medico.init(foto: UIImage(named: "paloma")!, nome: "Dra. Paloma Pedrosa", crm: "769303-RJ", especialidade: "Clínico Geral", celular: "(21) 99988-7721", telefone: "(21) 3325-1816", email: "jcupelo@me.com", consulta: "08/08/2016 às 14h")]
    
    func setImage(iconImage: UIImage, forSearchBarIcon icon: UISearchBarIcon, state: UIControlState) {
        pesquisarBar.imageForSearchBarIcon(.Search, state: .Disabled)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.table.delegate = self
        self.table.dataSource = self
        UISearchBar.appearance().setImage(UIImage(named: ""), forSearchBarIcon: UISearchBarIcon.Search, state: UIControlState.Disabled)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}

extension Medicos : UITableViewDelegate, UITableViewDataSource {
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return medicos.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {

        let cell = tableView.dequeueReusableCellWithIdentifier("medCell") as! MedCell
        cell.foto.image = medicos[indexPath.row].foto
        cell.nome.text = medicos[indexPath.row].nome
        cell.especialidade.text = medicos[indexPath.row].especialidade
        cell.consulta.text = "CRM: \(medicos[indexPath.row].crm)"
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        selecionado = indexPath.row
        self.performSegueWithIdentifier("showMed", sender: self)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if (segue.identifier == "showMed") {
            let viewController = segue.destinationViewController as! VerMedico
            viewController.foto = medicos[selecionado].foto
            viewController.nome = medicos[selecionado].nome
            viewController.crm = medicos[selecionado].crm
            viewController.especialidade = medicos[selecionado].especialidade
            viewController.celular = medicos[selecionado].celular
            viewController.telefone = medicos[selecionado].telefone
            viewController.email = medicos[selecionado].email
        }
    }
    
    
    @IBAction func addMedicoButton(sender: AnyObject) {
    }
}