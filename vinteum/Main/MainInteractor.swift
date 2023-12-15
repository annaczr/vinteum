//
//  MainInteractor.swift
//  vinteum
//
//  Created by Mirella Miyakawa on 15/12/23.
//

import Foundation
import UIKit

protocol MainInteractorInterface {
    func drawCard(deckId: String) -> (total: Int, card: Response)
}

//Criando a struct do Deck de cartas
struct Cards: Codable {
    var value:String;
    var code:String;
}


class MainInteractor: MainInteractorInterface {
    
    //Criando as variaveis a serem usadas
    private var total:Int = 0
    private var deckId:String = ""
    private var card:Response;
    let presenter:MainPresenterInterface;
    
    init(presenter: MainPresenterInterface){
        self.presenter = presenter
    }
    
    //lógica das func
    func drawCard(deckId: String) -> (total: Int, card: Response) {
            
            if(card.cards[0].value.uppercased() == "QUEEN" || card.cards[0].value.uppercased() == "JACK" || card.cards[0].value.uppercased() == "KING"){
                self.total += 10
            }
            else if (card.cards[0].value.uppercased() == "ACE"){
                self.total += 1
            }
            else{
                self.total += Int(card.cards[0].value)!
            }
            
        return (self.total, card)
    }
}

