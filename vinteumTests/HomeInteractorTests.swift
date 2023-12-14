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

class HomeInteractorTests: XCTestCase{
    
    func testNewGame_shouldCallPresenter(){
        let presenterSpy = UIPresenterSpy()
        let interactor = HomeInteractor(presenter: presenterSpy)
        
        interactor.newGame()
        
        XCTAssertEqual(presenterSpy.games, [.newGame])
    }
}
