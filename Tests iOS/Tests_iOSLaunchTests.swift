//
//  Tests_iOSLaunchTests.swift
//  Tests iOS
//
//  Created by William Swinson on 6/19/22.
//

import XCTest

class Tests_iOSLaunchTests: XCTestCase {
    var app: XCUIApplication!

    override class var runsForEachTargetApplicationUIConfiguration: Bool {
        true
    }

    override func setUpWithError() throws {
        try super.setUpWithError()
        continueAfterFailure = false
        app = XCUIApplication()
        app.launch()
    }

    func testLaunch() throws {
        let app = XCUIApplication()
        app.launch()

        // Insert steps here to perform after app launch but before taking a screenshot,
        // such as logging into a test account or navigating somewhere in the app

        let attachment = XCTAttachment(screenshot: app.screenshot())
        attachment.name = "Launch Screen"
        attachment.lifetime = .keepAlways
        add(attachment)
    }
    
    func testTextLoads() {
        let app = XCUIApplication()
        let descText = app.staticTexts["New X-Men (2001) #150"]
        XCTAssertTrue(descText.exists)
    }
}
