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
    
    
    
    func setImage(iconImage: UIImage, forSearchBarIcon icon: UISearchBarIcon, state: UIControlState) {
        pesquisarBar.imageForSearchBarIcon(.Search, state: .Disabled)
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()

        UISearchBar.appearance().setImage(UIImage(named: ""), forSearchBarIcon: UISearchBarIcon.Search, state: UIControlState.Disabled)
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
        let cell: UITableViewCell = self.medicosCell
        return cell
    }
}