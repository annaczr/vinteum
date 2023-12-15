import UIKit

class HomeCoordinator: HomeCoordinatorInterface {
    weak var viewController:UIViewController?
    
    func navigationNewGame(){
        guard let navigationController = viewController?.navigationController else {
            return
        }
        let mainController = MainViewController(interactor: )
        navigationController.pushViewController(mainController, animated: true)
    }
}

protocol HomeCoordinatorInterface {
    func navigationNewGame()
}
