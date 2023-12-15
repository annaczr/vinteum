//
//  MainPresenter.swift
//  vinteum
//
//  Created by Mirella Miyakawa on 15/12/23.
//

import Foundation
import UIKit

protocol MainPresenterInterface {
    func totalPoints(total: Int, card:Response, deck: UIImageView)
    
}

class MainPresenter: MainPresenterInterface {
    let coordinator: MainCoordinatorInterface
    let viewController: MainViewControllerInterface
    
    init(coordinator: MainCoordinatorInterface){
        self.coordinator = coordinator
    }
    
    func totalPoints(total: Int, card:Response) {
        //configuração visual -> chama o coordinator
    
        DispatchQueue.main.async { //weak
            self.viewController.showCard(code:card.cards[0].code)
        }
        
        if (total > 21){
            //Retirando funcionalidade de comprar cartas
            let click = UITapGestureRecognizer(target: self, action: #selector(MainInteractor.drawCard))
            DispatchQueue.main.asyncAfter(deadline: .now()+2){
                deck.removeGestureRecognizer(click)
                //Adicionando o modal de derrota
                let modalLoose = ModalLooseController()
                modalLoose.modalPresentationStyle = .currentContext

                self.present(modalLoose, animated: true, completion: nil, ty)
            }
        }
        
        else if (total == 21){
            //Retirando funcionalidade de comprar cartas
            let click = UITapGestureRecognizer(target: self, action: #selector(self.drawCard))
            DispatchQueue.main.asyncAfter(deadline: .now()+2){
                deck.removeGestureRecognizer(click)
                //Abrindo o modal de vitoria
                let modalVictory = ModalVictoryController()
                modalVictory.modalPresentationStyle = .currentContext

                self.present(modalVictory, animated: true, completion: nil)
            }
        }
        
    }
}
