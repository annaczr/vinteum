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
    private struct Cards: Codable {

        var value:Int;
        
        var code:String;
        
        var image:String;
        
        var suit:String;
    }
    
    private var deckId:String = ""
    
    lazy var stackView: UIStackView = {
        let stack = UIStackView()
        stack.backgroundColor = .red
        stack.axis = .vertical
        stack.spacing = -100.0
        stack.alignment = .fill
        stack.distribution = .fill
        stack.axis = .horizontal
        [self.imageCard(name: "4H"),self.imageCard(name: "2H"),self.imageCard(name: "3H"),self.imageCard(name: "0C")].enumerated().forEach { image in stack.addArrangedSubview(image.1) }
        return stack
    }()
    
    private func imageCard(name:String) -> UIImageView {
        let imageview = UIImageView()
        let image = UIImage(named: name)
        imageview.image = image
        return imageview
    }
    
    private let card: UIImageView = {
        let cards = UIImageView()
        let baralho = UIImage(named: "0C")
        cards.image = baralho
        cards.isUserInteractionEnabled = true
        return cards
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .black
        
        
//        let cardsView = CardsView(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
//        cardsView.images = ["AS","AS","AS"]
//        self.cardView.addSubview(cardsView)


        
        view.addSubview(stackView)
        stackView.snp.makeConstraints { (make) in
            make.centerX.left.right.equalToSuperview()
            make.top.equalTo(0).offset(30)
            make.height.equalTo(400)
        }
//
        

        //Adding and setting up the button
//        self.view.addSubview(self.deck)

//        let click = UITapGestureRecognizer(target: self, action: #selector(self.didTapImage))
//        self.deck.addGestureRecognizer(click)
//
//        self.deck.snp.makeConstraints { make in
//            make.centerX.equalToSuperview()
//            make.top.equalToSuperview().offset(50)
//        }
    }
        
    @objc private func didTapImage(){
        let mainInteractor = MainInteractor(sessionDelegate: self)
        mainInteractor.newCard(deckId: self.deckId){card in
            print(card.deck_id)
            print(card.code)
        }
    }
}
extension MainController: URLSessionDelegate {
    func urlSession(_ session: URLSession, didReceive challenge: URLAuthenticationChallenge, completionHandler: @escaping (URLSession.AuthChallengeDisposition, URLCredential?) -> Void) {
        completionHandler(.useCredential, URLCredential(trust: challenge.protectionSpace.serverTrust!))
    }
}
