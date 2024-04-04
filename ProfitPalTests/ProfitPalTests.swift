//
//  ProfitPalTests.swift
//  ProfitPalTests
//
//  Created by HappyVolt on 04/04/2024.
//
import XCTest
@testable import ProfitPal

class ProfitCalculatorTests: XCTestCase {

    var profitCalculator: ProfitCalculating!

    override func setUpWithError() throws {
        profitCalculator = ProfitCalculator()
    }

    override func tearDownWithError() throws {
        profitCalculator = nil
    }

    func testCalculateProfitWithNoMaterials() throws {
        // Given
        let materials: [Material] = []
        let tax = 20.0
        
        // When
        let (profit, totalPrice) = profitCalculator.calculateProfit(materialCosts: materials, tax: tax)
        
        // Then
        XCTAssertEqual(profit, 0.0)
        XCTAssertEqual(totalPrice, 0.0)
    }

    func testCalculateProfitWithMaterials() throws {
        // Given
        let materials = [Material(cost: 10.0), Material(cost: 20.0)]
        let tax = 20.0
        
        // When
        let (profit, totalPrice) = profitCalculator.calculateProfit(materialCosts: materials, tax: tax)
        
        // Then
        XCTAssertEqual(profit, 30.0)
        XCTAssertEqual(totalPrice, 36.0)
    }

    func testCalculateProfitWithDifferentTaxRate() throws {
        // Given
        let materials = [Material(cost: 10.0), Material(cost: 20.0)]
        let tax = 10.0
        
        // When
        let (profit, totalPrice) = profitCalculator.calculateProfit(materialCosts: materials, tax: tax)
        
        // Then
        XCTAssertEqual(profit, 30.0)
        XCTAssertEqual(totalPrice, 33.0)
    }

    func testCalculateProfitWithZeroTax() throws {
        // Given
        let materials = [Material(cost: 10.0), Material(cost: 20.0)]
        let tax = 0.0
        
        // When
        let (profit, totalPrice) = profitCalculator.calculateProfit(materialCosts: materials, tax: tax)
        
        // Then
        XCTAssertEqual(profit, 30.0)
        XCTAssertEqual(totalPrice, 30.0)
    }

    func testCalculateProfitWithSingleMaterial() throws {
        // Given
        let materials = [Material(cost: 15.0)]
        let tax = 20.0
        
        // When
        let (profit, totalPrice) = profitCalculator.calculateProfit(materialCosts: materials, tax: tax)
        
        // Then
        XCTAssertEqual(profit, 15.0)
        XCTAssertEqual(totalPrice, 18.0)
    }

    func testCalculateProfitWithZeroMaterialCost() throws {
        // Given
        let materials = [Material(cost: 0.0)]
        let tax = 20.0
        
        // When
        let (profit, totalPrice) = profitCalculator.calculateProfit(materialCosts: materials, tax: tax)
        
        // Then
        XCTAssertEqual(profit, 0.0)
        XCTAssertEqual(totalPrice, 0.0)
    }
}
