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
    
    var pizzas = [Pizza]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadData()
    }
    
    func loadData(){
        
        guard let pizzaJsonPath = Bundle.main.path(forResource:"pizza", ofType: "json") else {return}
        // Do any additional setup after loading the view.
        let filePath = "file://" + pizzaJsonPath
        print(pizzaJsonPath)
        
        guard let url = URL(string: filePath) else {return}
        print("URL: \(url)")
        let jsonDecoder = JSONDecoder()
        do{
            let data = try Data(contentsOf: url)
            pizzas = try jsonDecoder.decode([Pizza].self, from: data)
            
            
            
        }catch{(print(NSLocalizedDescriptionKey))}
        
    }

    
    

}
//everytime time you make a
extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pizzas.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "pizzaCell", for: indexPath) as! PizzaTableViewCell
        
        
        cell.lblPizza.text = pizzas[indexPath.row].toppings?.description
        return cell
    }
    
    
}
