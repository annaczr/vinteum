import UIKit

protocol HomeInteractorInterface{
    func newGame()
}


class HomeInteractor: HomeInteractorInterface {
    let presenter:HomePresenterInterface;
    
    init(presenter:HomePresenterInterface) {
        self.presenter = presenter
    }
    
    func newGame() {
        //lógica
        presenter.navigateToNewGame()
    }
}
