//
//  HomePresenterTests.swift
//  vinteumTests
//
//  Created by Marcus Thomazetti on 14/12/23.
//

import Foundation
import XCTest
import UIKit

@testable
import vinteum

class HomePresenterTests: XCTestCase{
    
    func testNewGame_shouldCallPresenter(){
        let coordinatorSpy = UICoordinatorSpy()
        let presenter = HomePresenter(coordinator: coordinatorSpy)
        
        presenter.navigateToNewGame()
        
        XCTAssertEqual(coordinatorSpy.games, [.newGame])
    }
}
