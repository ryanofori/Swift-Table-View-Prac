//
//  ViewController.swift
//  tableViewPrac
//
//  Created by Ryan Ofori on 11/21/19.
//  Copyright © 2019 Ryan Ofori. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var items: [String] = ["item1","item2","item3"]
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }


}
//everytime time you make a
extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "pizzaCell", for: indexPath) as! PizzaTableViewCell
        
        cell.lblPizza.text = items[indexPath.row]
        return cell
    }
    
    
}
