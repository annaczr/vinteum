//
//  MainController.swift
//  vinteum
//
//  Created by Marcus Thomazetti on 29/11/23.
//

import Foundation
import UIKit
import SnapKit

class MainController: UIViewController{
    
    private let deck: UIImageView = {
        let cards = UIImageView()
        let baralho = UIImage(named: "Baralho")
        cards.image = baralho
        cards.isUserInteractionEnabled = true
        return cards
    }()
    
    //Criando a struct do Deck de cartas
    private struct Deck: Codable {
        var deck_id: String;
    }
    
    //Criando a struct do Deck de cartas
    private struct Card: Codable {
        
        var code: String;
        
        var value: String;
    }
    
    private var deckId:String = ""

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Chamando função de criação de Deck
        let mainInteractor = MainInteractor()
        mainInteractor.newDeck(){ deckId in
            self.deckId = deckId
        }
        
        //Settando background branco
        self.view.backgroundColor = .white
        
        
        
            //Adicionado e colocando funcionalidade no botão
            self.view.addSubview(self.deck)
            
            let click = UITapGestureRecognizer(target: self, action: #selector(self.didTapImage))
            self.deck.addGestureRecognizer(click)
            
            self.deck.snp.makeConstraints{ make in
                make.centerX.equalToSuperview()
                make.top.equalToSuperview().offset(50)
            }
            
            
        }
        
    @objc private func didTapImage(){
        var deck_id:String = self.deckId;
        let mainInteractor = MainInteractor()
        mainInteractor.newCard(deckId: deck_id){card in
            print(card.cards[0].value)
        }
    }
}
