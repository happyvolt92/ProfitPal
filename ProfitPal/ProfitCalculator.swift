//
//  ProfitCalculator.swift
//  ProfitPal
//
//  Created by HappyVolt on 04/04/2024.
//

import Foundation


// Protocole définissant les méthodes pour calculer le profit
protocol ProfitCalculating {
    func calculateProfit(materialCosts: [Material], tax: Double) -> (profit: Double, totalPrice: Double)
}

// Implémentation du calculateur de profit
class ProfitCalculator: ProfitCalculating {
    func calculateProfit(materialCosts: [Material], tax: Double) -> (profit: Double, totalPrice: Double) {
        let totalCost = materialCosts.reduce(0) { $0 + $1.cost }
        let totalTax = totalCost * (tax / 100)
        let profit = totalCost
        let totalPrice = totalCost + totalTax
        return (profit, totalPrice)
    }
}
