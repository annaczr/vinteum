//
//  MainCoordinator.swift
//  vinteum
//
//  Created by Mirella Miyakawa on 15/12/23.
//

import Foundation
import UIKit

protocol MainCoordinatorInterface {
    func showVictory()
    func showDefeat()
}

class MainCoordinator: MainCoordinatorInterface {
    
    weak var viewController: UIViewController?
    
    func showVictory() {
        //Adicionando o modal de derrota
        let modalLoose = ModalLooseController()
        modalLoose.modalPresentationStyle = .currentContext
        viewController?.present(modalLoose, animated: true, completion: nil)
    }
    
    func showDefeat() {
        //Abrindo o modal de vitoria
        let modalVictory = ModalVictoryController()
        modalVictory.modalPresentationStyle = .currentContext
        viewController?.present(modalVictory, animated: true, completion: nil)
    }
    
}
