//
//  MainFactory.swift
//  vinteum
//
//  Created by Mirella Miyakawa on 15/12/23.
//

import Foundation

class MainFactory {
    static func make() -> MainViewController {
        let coordinator = MainCoordinator()
        let presenter = MainPresenter(coordinator: coordinator)
        let interactor = MainInteractor(presenter: presenter)
        let viewController = MainViewController(interactor: interactor)
        coordinator.viewController = viewController
        
        return viewController
    }
}
