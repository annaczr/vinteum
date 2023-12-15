//
//  HomeCoordinatorTests.swift
//  vinteumTests
//
//  Created by Mirella Miyakawa on 11/12/23.
//

import Foundation
import XCTest
import UIKit

@testable
import vinteum

class HomeCoordinatorTests: XCTestCase {
    // nav controller nulo
    func testNavigationNewGame_whenNavigationControllerIsNil_shouldReturn(){
        let homeCoordinator = HomeCoordinator()
        let viewControllerSpy = UIViewControllerSpy()
        homeCoordinator.viewController = viewControllerSpy
        let navigationControllerSpy = UINavigationControllerSpy()
        
        XCTAssertEqual(navigationControllerSpy.viewControllerResult, nil)
    }
}
