//
//  MainPresenter.swift
//  vinteum
//
//  Created by Mirella Miyakawa on 15/12/23.
//

import Foundation
import UIKit

protocol MainPresenterInterface {
    func totalPoints(total: Int, card:Response)
    func stopLoading()
}

class MainPresenter: MainPresenterInterface {
    
    let coordinator: MainCoordinatorInterface
    var viewController: MainViewControllerInterface?
    
    init(coordinator: MainCoordinatorInterface){
        self.coordinator = coordinator
    }
    
    func totalPoints(total: Int, card:Response) {
        //configuração visual -> chama o coordinator
        
        self.viewController?.showPoints(total: total)

        self.viewController?.showCard(code:card.cards[0].code)
        
        if (total > 21){
            //Retirando funcionalidade de comprar cartas
            self.viewController?.removeClick()
            self.coordinator.showDefeat()
            
        }
        else if (total == 21){
            //Retirando funcionalidade de comprar cartas
            self.viewController?.removeClick()
            self.coordinator.showVictory()
        
        }

    }
    func stopLoading() {
        self.viewController?.stopLoading()
    }
}
