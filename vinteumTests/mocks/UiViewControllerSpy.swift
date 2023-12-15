//
//  UiViewControllerSpy.swift
//  vinteumTests
//
//  Created by Mirella Miyakawa on 12/12/23.
//

import Foundation
import UIKit

class UIViewControllerSpy: UIViewController {
    var navigationControllerMock: UINavigationController?
    
    override var navigationController: UINavigationController? {
        return navigationControllerMock
    }
}
