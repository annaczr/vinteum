import UIKit

class HomeInteractor {
    let presenter:HomePresenter;
    
    init(presenter:HomePresenter) {
        self.presenter = presenter
    }
    
    func newGame() {
        //lógica
        presenter.navigateToNewGame()
    }
}
