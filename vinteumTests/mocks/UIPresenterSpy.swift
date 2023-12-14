//
//  UIPresenterSpy.swift
//  vinteumTests
//
//  Created by Marcus Thomazetti on 14/12/23.
//

import Foundation
import XCTest
import UIKit

@testable
import vinteum

class UIPresenterSpy: HomePresenterInterface{
    
    enum Game: Equatable{
        case newGame
    }
    
    var games: [Game] = []
    
    func navigateToNewGame() {
        games.append(.newGame)
    }
}
