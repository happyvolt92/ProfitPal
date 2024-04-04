//
//  ViewController.swift
//  ProfitPal
//
//  Created by HappyVolt on 04/04/2024.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var costTextField: UITextField!
    @IBOutlet weak var taxTextField: UITextField!
    @IBOutlet weak var profitLabel: UILabel!
    
    var materials: [Material] = []
    var profitCalculator: ProfitCalculating = ProfitCalculator()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return materials.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MaterialCell", for: indexPath)
        cell.textLabel?.text = "Material \(indexPath.row + 1): $\(materials[indexPath.row].cost)"
        return cell
    }
    
    @IBAction func addMaterialCost(_ sender: UIButton) {
        guard let costText = costTextField.text, let cost = Double(costText) else {
            return
        }
        let material = Material(cost: cost)
        materials.append(material)
        tableView.reloadData()
        costTextField.text = ""
        updateProfit()
    }
    
    func updateProfit() {
        guard let taxText = taxTextField.text, let tax = Double(taxText) else {
            return
        }
        let (profit, totalPrice) = profitCalculator.calculateProfit(materialCosts: materials, tax: tax)
        profitLabel.text = "Profit: $\(profit), Total Price (with tax): $\(totalPrice)"
    }
    
    @IBAction func calculateProfit(_ sender: UIButton) {
        updateProfit()
    }
    
}
