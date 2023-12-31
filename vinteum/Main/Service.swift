//
//  service.swift
//  vinteum
//
//  Created by Mirella Miyakawa on 15/12/23.
//

import Foundation

// classes de retorno
struct Card: Codable {
    
    var code: String;
    var value: String;
    var suit: String;
}

struct Response: Codable{
    
    var deck_id: String;
    var cards: [Card];
}

struct Deck: Codable {
    
    var deck_id: String;
}

protocol ServiceInterface {
    func newDeck(onSucess: @escaping (String)-> Void) -> Void
    func newCard(deckId:String, onSucess: @escaping (Response) -> Void) -> Void
}

class Service: ServiceInterface {
    // variáveis
    private var deckId: String = ""
    
    
    // funções
    func newDeck(onSucess: @escaping (String) -> Void) -> Void {
        // criando uma sessão
        let config = URLSessionConfiguration.default
        let session = URLSession(configuration: config)

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
                    let deckId = deck.deck_id
                    onSucess(deckId)
                }
            } catch {
                print("erro")
            }
        }
        task.resume()
    }
    
    func newCard(deckId: String, onSucess: @escaping (Response) -> Void) {
        // criando uma sessão
        let config = URLSessionConfiguration.default
        let session = URLSession(configuration: config)

        
        // pegando um novo baralho quando a view abrir
        let url = URL(string: "https://www.deckofcardsapi.com/api/deck/\(deckId)/draw/?count=1")!
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        let task = session.dataTask(with: request) { data, response, error in
            if let error = error {
                print("Error!!! \(error.localizedDescription)")
            }
            
            do {
                if let data = data {
                    let card = try JSONDecoder().decode(Response.self, from: data)
                    onSucess(card)
                }
            } catch {
                 print("erro \(error) ")
            }
            
        }
            task.resume()
    }
    
}
