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
    
    func showDefeat() {
        //Adicionando o modal de derrota
        DispatchQueue.main.asyncAfter(deadline: .now()+1) { [self] in
            let modalLoose = ModalLooseController()
            modalLoose.modalPresentationStyle = .currentContext
            self.viewController?.present(modalLoose, animated: true, completion: nil)
        }
    }
    
    func showVictory() {
        //Abrindo o modal de vitoria
        DispatchQueue.main.asyncAfter(deadline: .now()+1)  {
            let modalVictory = ModalVictoryController()
            modalVictory.modalPresentationStyle = .currentContext
            self.viewController?.present(modalVictory, animated: true, completion: nil)
        }
    }
    
}
