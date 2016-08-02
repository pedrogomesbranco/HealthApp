//
//  Info.swift
//  HealthApp
//
//  Created by Pedro Gomes Branco on 7/29/16.
//  Copyright © 2016 Pedro Gomes Branco. All rights reserved.
//

import Foundation
import UIKit
import MapKit

class Info: ViewController, MKMapViewDelegate{
    
    @IBOutlet var mapa: MKMapView!
    
    var pessoa = pessoas.init(nome: "Pedro", vacina: vacinas.init(tipo: Tipos.Adulto, vacinas: adulto, administracaoVacinas: [""], validadeVacinas: [""], proximaDose: [""], numeroDeDoses: [""], obs: [""]), sexo: Sexo.Masculino, nascimento: "08/05/1993", gravida: false, foto: UIImage(named:"doctor")!)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.mapa.delegate = self
        let startLocation = CLLocation(latitude: -22.97958455, longitude: -43.22951138)
        let range = MKCoordinateRegionMakeWithDistance(startLocation.coordinate, 400, 400)
        self.mapa.setRegion(range, animated: true)
        mapa.showsTraffic = false
        mapa.showsPointsOfInterest = false
        mapa.camera.heading = 240.0
        mapa.mapType = .HybridFlyover
        
        let anotation = MKPointAnnotation()
        anotation.coordinate = CLLocationCoordinate2D(latitude: -22.97958455, longitude: -43.22951138)
        anotation.title = "Hepatite B"
        mapa.addAnnotation(anotation)
        
    }
    @IBAction func back(sender: AnyObject) {
        self.performSegueWithIdentifier("back", sender: self)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if(segue.identifier == "back"){
            let viewController = segue.destinationViewController as! DetalheVacina
            
            viewController.pessoa = pessoa
            viewController.index = 0
        }
    }
}