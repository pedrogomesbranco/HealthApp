//
//  EditarMedicoViewController.swift
//  HealthApp
//
//  Created by Bia Lemos on 7/22/16.
//  Copyright © 2016 Pedro Gomes Branco. All rights reserved.
//

import UIKit
import MapKit

class VerMedico: UIViewController, MKMapViewDelegate {
    

    @IBOutlet weak var fotoImageView: UIImageView!
    @IBOutlet weak var nomeTextField: UITextField!
    @IBOutlet weak var crmTextField: UITextField!
    @IBOutlet weak var especialidadeTextField: UITextField!
    @IBOutlet weak var telefoneTextField: UITextField!
    @IBOutlet var emailLabel: UILabel!
    @IBOutlet weak var celularTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet var nomeLabel: UILabel!
    @IBOutlet var celularLabel: UILabel!
    @IBOutlet var telefoneLabel: UILabel!
    @IBOutlet var especialidadeLabel: UILabel!
    @IBOutlet var crmLabel: UILabel!
    
    var foto: UIImage!
    var nome: String!
    var crm: String!
    var especialidade: String!
    var celular: String!
    var telefone: String!
    var email: String!
    
    @IBOutlet var label6: UILabel!
    @IBOutlet var label5: UILabel!
    @IBOutlet var label4: UILabel!
    @IBOutlet var label3: UILabel!
    @IBOutlet var label2: UILabel!
    @IBOutlet var label1: UILabel!
    
    @IBAction func trocarFoto(sender: AnyObject) {
    }
    
    @IBOutlet var fotoBotao: UIImageView!
    @IBOutlet var atualizar: UIButton!
    
    @IBOutlet var MAPA: MKMapView!
    @IBAction func editarButton(sender: AnyObject) {
//        nomeTextField.hidden = false
//        crmTextField.hidden = false
//        especialidadeTextField.hidden = false
//        celularTextField.hidden = false
//        telefoneTextField.hidden = false
//        emailTextField.hidden = false
//        fotoBotao.hidden = false
//        atualizar.hidden = false
//        nomeLabel.hidden = true
//        crmLabel.hidden = true
//        especialidadeLabel.hidden = true
//        celularLabel.hidden = true
//        telefoneLabel.hidden = true
//        emailLabel.hidden = true
//        label1.hidden = true
//        label2.hidden = true
//        label3.hidden = true
//        label4.hidden = true
//        label5.hidden = true
//        label6.hidden = true
    }

    @IBAction func atualizar(sender: AnyObject) {
    
        nomeTextField.hidden = !false
        crmTextField.hidden = !false
        especialidadeTextField.hidden = !false
        celularTextField.hidden = !false
        telefoneTextField.hidden = !false
        emailTextField.hidden = !false
        fotoBotao.hidden = !false
        atualizar.hidden = !false
        nomeLabel.hidden = !true
        crmLabel.hidden = !true
        especialidadeLabel.hidden = !true
        celularLabel.hidden = !true
        telefoneLabel.hidden = !true
        emailLabel.hidden = !true
        label1.hidden = !true
        label2.hidden = !true
        label3.hidden = !true
        label4.hidden = !true
        label5.hidden = !true
        label6.hidden = !true
        
        foto = fotoImageView.image
        crm = crmTextField.text
        especialidade = especialidadeTextField.text
        celular = celularTextField.text
        telefone = telefoneTextField.text
        email = emailTextField.text
        if(nomeTextField.text != ""){
            nome = nomeTextField.text
            self.performSegueWithIdentifier("atualizar", sender: self)
        }
        else{
            let alerta = UIAlertController(title: "Atenção", message: "Digite o nome do médico", preferredStyle: .Alert)
            alerta.addAction(UIAlertAction(title: "Ok", style: .Default, handler: nil))
            self.presentViewController(alerta, animated: true, completion: nil)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        fotoImageView.image = foto
        nomeTextField.text = nome
        crmTextField.text = crm
        especialidadeTextField.text = especialidade
        celularTextField.text = celular
        telefoneTextField.text = telefone
        emailTextField.text = email
        
        nomeLabel.text = nome
        crmLabel.text = crm
        especialidadeLabel.text = especialidade
        celularLabel.text = celular
        telefoneLabel.text = telefone
        emailLabel.text = email
        
        fotoImageView.layer.cornerRadius = fotoImageView.frame.size.width / 2
        fotoImageView.clipsToBounds = true
        self.MAPA.delegate = self
        let startLocation = CLLocation(latitude: -23.003003, longitude: -43.326456)
        let range = MKCoordinateRegionMakeWithDistance(startLocation.coordinate, 400, 400)
        self.MAPA.setRegion(range, animated: true)
        MAPA.showsTraffic = false
        MAPA.showsPointsOfInterest = false
        MAPA.camera.heading = 240.0
        MAPA.mapType = .HybridFlyover
        
        let anotation = MKPointAnnotation()
        anotation.coordinate = CLLocationCoordinate2D(latitude: -23.003003, longitude:-43.326456)
        anotation.title = "Consultório do \(nome)"
        MAPA.addAnnotation(anotation)

        func textFieldStyles(textField: UITextField) {
            
            //Criar e personalizar Shadow e Corner Radius
            textField.layer.masksToBounds = false
            textField.layer.cornerRadius = 5.0
            
            // Criar Indent antes do texto
            let SpacerView = UIView(frame:CGRect(x:0, y:0, width:10, height:10))
            textField.leftViewMode = UITextFieldViewMode.Always
            textField.leftView = SpacerView
        }
        
        textFieldStyles(nomeTextField)
        textFieldStyles(crmTextField)
        textFieldStyles(especialidadeTextField)
        textFieldStyles(telefoneTextField)
        textFieldStyles(celularTextField)
        textFieldStyles(emailTextField)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

}


extension VerMedico: UITextViewDelegate {
    
    // Limpar o Placeholder quando começar a editar e manter a cor correta do texto
    func textViewDidBeginEditing(textView: UITextView) {
        print("TextView did begin editing")
        
        if textView.textColor == UIColor(red:0.14, green:0.14, blue:0.14, alpha:1.0) {
            textView.text = nil
            textView.textColor = UIColor(red:0.14, green:0.14, blue:0.14, alpha:1.0)
        }
    }
    
    // Adicionar Placeholder no TextView se não tiver nada escrito
    func textViewDidEndEditing(textView: UITextView) {
        print("TextView did end editing")
        
        if textView.text.isEmpty {
            textView.text = "ENDEREÇO"
            textView.textColor = UIColor(red:0.14, green:0.14, blue:0.14, alpha:1.0)
        }
    }
    
}
