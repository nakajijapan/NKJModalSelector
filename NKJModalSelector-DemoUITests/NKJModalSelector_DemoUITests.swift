//
//  NKJModalSelector_DemoUITests.swift
//  NKJModalSelector-DemoUITests
//
//  Created by nakajijapan on 2016/02/03.
//  Copyright 2016年 nakajijapan. All rights reserved.
//

import XCTest

class NKJModalSelector_DemoUITests: XCTestCase {
        
    override func setUp() {
        super.setUp()
        
        continueAfterFailure = false
        XCUIApplication().launch()

    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testShowAndClose() {
        
        let app = XCUIApplication()
        app.tables["NKJViewControllerTable"].staticTexts["Detail View Controller"].tap()
        app.buttons["Button"].tap()
        app.navigationBars["modal"].buttons["Close"].tap()
        
    }
    
    func testShowAndSelect() {

        let app = XCUIApplication()
        app.tables["NKJViewControllerTable"].staticTexts["Detail View Controller"].tap()
        app.buttons["Button"].tap()
        app.tables["ModalTable"].staticTexts["Title #0"].tap()
        
    }
    
    func testCloseWhenTappingBackgroundView() {
        
        let app = XCUIApplication()
        app.tables["NKJViewControllerTable"].staticTexts["Detail View Controller"].tap()
        app.buttons["Button"].tap()
        app.otherElements.containingType(.NavigationBar, identifier:"NKJModalSelectorNavigation").childrenMatchingType(.Other).elementBoundByIndex(1).childrenMatchingType(.Image).element.tap()
        
    }
    
    func testExpandTableView() {

        let app = XCUIApplication()
        app.tables["NKJViewControllerTable"].staticTexts["Detail View Controller"].tap()
        
        let button = app.buttons["Button"]
        button.tap()
        
        let modalNavigationBar = app.navigationBars["modal"]
        modalNavigationBar.swipeUp()
        
        
        let closeButton = modalNavigationBar.buttons["Close"]
        closeButton.tap()
        
    }
    
}
