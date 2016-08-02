//
//  E-mail.swift
//  HealthApp
//
//  Created by Pedro Gomes Branco on 7/29/16.
//  Copyright © 2016 Pedro Gomes Branco. All rights reserved.
//

import UIKit
import MessageUI

class Email: UIViewController, MFMailComposeViewControllerDelegate, UICollectionViewDelegate, UICollectionViewDataSource {
    
    @IBOutlet var collection: UICollectionView!
    @IBOutlet weak var emailButton: UIButton!
    
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
    
    var selecionados = [""]
    
    var medicos: [medico] = [medico.init(foto: UIImage(named: "flavio")!, nome: "Dr. Fávio Bandeira", crm: "675293-RJ", especialidade: "Dermatologista", celular: "(21) 99988-7721", telefone: "(21) 3325-1816", email: "pedrogomesbranco@me.com", consulta: "16/12/2016 às 19h"),
                             medico.init(foto: UIImage(named: "monica")!, nome: "Dra. Mônica Gomes", crm: "096291-RJ", especialidade: "Oftalmologista", celular: "(21) 99988-7721", telefone: "(21) 3325-1816", email: "pedrogomesbranco@me.com", consulta: ""),
                             medico.init(foto: UIImage(named: "tonia")!, nome: "Dra. Antônia Cupello", crm: "128977-RJ", especialidade: "Urologista", celular: "(21) 99988-7721", telefone: "(21) 3325-1816", email: "pedrogomesbranco@me.com", consulta: ""),
                             medico.init(foto: UIImage(named: "joao")!, nome: "Dr. João Cupello", crm: "049832-RJ", especialidade: "Clínico Geral", celular: "(21) 99988-7721", telefone: "(21) 3325-1816", email: "jcupelo@me.com", consulta: "08/08/2016 às 14h"),
                             medico.init(foto: UIImage(named: "guga")!, nome: "Dr. Gustavo Domingues", crm: "677462-RJ", especialidade: "Anestesista", celular: "(21) 99988-7721", telefone: "(21) 3325-1816", email: "jcupelo@me.com", consulta: "08/08/2016 às 14h"),
                             medico.init(foto: UIImage(named: "paloma")!, nome: "Dra. Paloma Pedrosa", crm: "769303-RJ", especialidade: "Clínico Geral", celular: "(21) 99988-7721", telefone: "(21) 3325-1816", email: "jcupelo@me.com", consulta: "08/08/2016 às 14h")]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.collection.delegate = self
        self.collection.dataSource = self
        self.collection.allowsMultipleSelection = true
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func sendEmail(sender: UIButton) {
        //Check to see the device can send email.
        if( MFMailComposeViewController.canSendMail() ) {
            print("Can send email.")
            
            let mailComposer = MFMailComposeViewController()
            mailComposer.mailComposeDelegate = self
            
            //Set the subject and message of the email
            mailComposer.setToRecipients(selecionados)
            mailComposer.setSubject("EXAME DE SANGUE - Pedro G. Branco")
            mailComposer.setMessageBody("", isHTML: false)
            
            if let filePath = NSBundle.mainBundle().pathForResource("myPdf1", ofType: "pdf") {
                print("File path loaded.")
                
                if let fileData = NSData(contentsOfFile: filePath) {
                    print("File data loaded.")
                    mailComposer.addAttachmentData(fileData, mimeType: "pdf", fileName: "myPdf1")
                }
            }
            self.presentViewController(mailComposer, animated: true, completion: nil)
        }
    }
    
    func mailComposeController(controller: MFMailComposeViewController, didFinishWithResult result: MFMailComposeResult, error: NSError?) {
        NSUserDefaults.standardUserDefaults().setBool(true, forKey: "foi")
        self.dismissViewControllerAnimated(true, completion: nil)
        verifica()
        performSegueWithIdentifier("go", sender: self)

    }
    
    func verifica(){
        if NSUserDefaults.standardUserDefaults().boolForKey("foi") == true{
            func handleCancel(alertView: UIAlertAction!){
                performSegueWithIdentifier("go", sender: self)
            }
            NSUserDefaults.standardUserDefaults().setBool(false, forKey: "foi")
            let alerta = UIAlertController(title: "Sucesso", message: "E-mail enviado", preferredStyle: .Alert)
            alerta.addAction(UIAlertAction(title: "OK", style: .Default, handler: handleCancel))
            self.presentViewController(alerta, animated: true, completion: nil)
        }
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return medicos.count
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("email", forIndexPath: indexPath) as! EmailCell
        cell.nome.text = medicos[indexPath.row].nome
        cell.imagem.image = medicos[indexPath.row].foto
        return cell

    }
    
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        let cell = collectionView.cellForItemAtIndexPath(indexPath) as! EmailCell
        if cell.selected == true {
            selecionados.append(medicos[indexPath.row].email)
            cell.select.hidden = false
        }
        else{
            cell.select.hidden = true
        }
    }
}
