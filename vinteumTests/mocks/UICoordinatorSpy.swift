//
//  UICoordinatorSpy.swift
//  vinteumTests
//
//  Created by Marcus Thomazetti on 14/12/23.
//

import Foundation
import XCTest
import UIKit

@testable
import vinteum

class UICoordinatorSpy: HomeCoordinatorInterface{
    
    
    enum Game: Equatable{
        case newGame
    }
    
    var games: [Game] = []
    
    func navigationNewGame(){
        games.append(.newGame)
    }
}
