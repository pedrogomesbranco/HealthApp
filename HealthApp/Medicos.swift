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
    @IBOutlet weak var medicosCell: UITableViewCell!
    
    @IBAction func addMedicoButton(sender: AnyObject) {
    }
    
    override func prefersStatusBarHidden() -> Bool { return true }
    

    override func viewDidLoad() {
        super.viewDidLoad()

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }


}




extension Medicos : UITableViewDelegate, UITableViewDataSource {
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        return medicosCell
    }
}