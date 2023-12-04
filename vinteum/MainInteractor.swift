//
//  MainInteractor.swift
//  vinteum
//
//  Created by Mirella Miyakawa on 28/11/23.
//

import Foundation

// classes de retorno
struct Card: Codable {
    
    var deck_id: String;
    
    var code: String;
    
    var value: Int;
    
    var suit: String;
}

struct Deck: Codable {
    
    var deck_id: String;
    
}

protocol MainViewProtocol {
    func newDeck(onSucess: @escaping (Deck)-> Void) -> Void
    func newCard(deckId:String, onSucess: @escaping (Card) -> Void) -> Void
}



class MainInteractor:MainViewProtocol {
    
    // variáveis
    private var deckId: String = ""
    private let sessionDelegate: URLSessionDelegate
    
    
    // funções
    func newDeck(onSucess: @escaping (Deck) -> Void) -> Void {
        // criando uma sessão
        let config = URLSessionConfiguration.default
        let session = URLSession(configuration: config, delegate: sessionDelegate, delegateQueue: nil)

        // pegando um novo baralho quando a view abrir
        let url = URL(string: "https://www.deckofcardsapi.com/api/deck/new/shuffle")!
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        let task = session.dataTask(with: request) { data, response, error in
            if let error = error {
                print("Error!!! \(error.localizedDescription)")
            }
            do {
                if let data = data {
                    let deck = try JSONDecoder().decode(Deck.self, from: data)
                    onSucess(deck)
                }
            } catch {
                print("erro")
            }
        }
        task.resume()
    }
    
    func newCard(deckId: String, onSucess: @escaping (Card) -> Void) {
        // criando uma sessão
        let config = URLSessionConfiguration.default
        let session = URLSession(configuration: config, delegate: sessionDelegate, delegateQueue: nil)

        
        // pegando um novo baralho quando a view abrir
        let url = URL(string: "https://www.deckofcardsapi.com/api/deck/gbj9cgqkwthv/draw/?count=1")!
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        let task = session.dataTask(with: request) { data, response, error in
            if let error = error {
                print("Error!!! \(error.localizedDescription)")
            }
            
            do {
                if let data = data {
                    let card = try JSONDecoder().decode(Card.self, from: data)
                    onSucess(card)
                }
            } catch {
                 print("erro \(error) ")
            }
            
        }
            task.resume()
    }
    
    
    // Delegate (:
        init(sessionDelegate: URLSessionDelegate){
            self.sessionDelegate = sessionDelegate
        }
}










