//
//  MainInteractor.swift
//  vinteum
//
//  Created by Mirella Miyakawa on 15/12/23.
//

import Foundation
import UIKit

protocol MainInteractorInterface {
    func drawCard()
    func newDeck()
    func getDeckId() -> String
}

//Criando a struct do Deck de cartas
struct Cards: Codable {
    var value:String;
    var code:String;
}


class MainInteractor: MainInteractorInterface {
    
    //Criando as variaveis a serem usadas
    private let service:ServiceInterface;
    private var total:Int = 0
    private var deckId:String = ""
    let presenter:MainPresenterInterface;
    
    init(presenter: MainPresenterInterface, service: ServiceInterface){
        self.presenter = presenter
        self.service = service
    }
    
    func getDeckId() -> String {
        return self.deckId
    }
    
    //lógica das func
    func drawCard() {
        service.newCard(deckId: deckId){card in
            if(card.cards[0].value.uppercased() == "QUEEN" || card.cards[0].value.uppercased() == "JACK" || card.cards[0].value.uppercased() == "KING"){
                self.total += 10
            }
            else if (card.cards[0].value.uppercased() == "ACE"){
                self.total += 1
            }
            else{
                self.total += Int(card.cards[0].value)!
            }
            
            self.presenter.totalPoints(total: self.total, card: card)
        }
    }
    
    func newDeck() {
        self.service.newDeck(){deckId in
            self.deckId = deckId
            self.presenter.stopLoading()
        }
    }
}

