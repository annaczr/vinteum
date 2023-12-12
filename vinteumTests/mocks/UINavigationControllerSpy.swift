//
//  UINavigationControllerSpy.swift
//  vinteumTests
//
//  Created by Mirella Miyakawa on 12/12/23.
//

import Foundation
import UIKit

class UINavigationControllerSpy: UINavigationController {
    var viewControllerResult:UIViewController?
    var animatedResult: Bool?
    
    override func pushViewController(_ viewController: UIViewController, animated: Bool) {
        viewControllerResult = viewController
        animatedResult = animated
    }
}
