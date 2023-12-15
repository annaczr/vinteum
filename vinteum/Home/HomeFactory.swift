
import Foundation

class HomeFactory {
    static func make() -> HomeViewController {
        let coordinator = HomeCoordinator()
        let presenter = HomePresenter(coordinator: coordinator)
        let interactor = HomeInteractor(presenter: presenter)
        let viewController = HomeViewController(interactor: interactor)
        coordinator.viewController = viewController
        
        return viewController
    }
}
