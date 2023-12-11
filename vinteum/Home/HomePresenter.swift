import UIKit

class HomePresenter {
    let coordinator:HomeCoordinator
    
    init(coordinator:HomeCoordinator) {
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
