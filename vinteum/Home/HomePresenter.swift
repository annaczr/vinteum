import UIKit

class HomePresenter: HomePresenterInterface {
    let coordinator:HomeCoordinatorInterface
    
    init(coordinator:HomeCoordinatorInterface) {
        self.coordinator = coordinator
    }
    
    func navigateToNewGame() {
        //configuração visual -> chama o coordinator
        coordinator.navigationNewGame()
    }
}

protocol HomePresenterInterface {
    func navigateToNewGame()
}
