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
    
    @IBAction func dismmis(sender: AnyObject) {
    
    self.presentingViewController?.dismissViewControllerAnimated(true, completion: nil)
    
    }
    
    
    
    @IBAction func addMedicoButton(sender: AnyObject) {
    }
    
    override func prefersStatusBarHidden() -> Bool { return true }
    
    
    
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
        return 0
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {

        let cell = tableView.dequeueReusableCellWithIdentifier("medCell")
        return cell!
    }
}