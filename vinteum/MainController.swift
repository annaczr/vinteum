import Foundation
import UIKit
import SnapKit

class MainController: UIViewController{
    
    //Criando a struct do Deck de cartas
    private struct Deck: Codable {
        var deck_id: String;
    }
    
    //Criando a struct do Deck de cartas
    private struct Cards: Codable {
        var value:String;
        var code:String;
    }
    
    //Criando as variaveis a serem usadas
    private var total:Int = 0
    private var deckId:String = ""
    
    //Criando botão de parada
    private let button: UIButton = {
        let button = UIButton()
        button.setTitle("stop", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 20, weight: .bold)
        button.backgroundColor = .red
        button.layer.cornerRadius = 15
        return button
    }()
    
    //Criando as imagens
    private let deck: UIImageView = {
        let cards = UIImageView()
        let baralho = UIImage(named: "Baralho")
        cards.image = baralho
        cards.isUserInteractionEnabled = true
        return cards
    }()
    
    private let bomb: UIImageView = {
        let cards = UIImageView()
        let baralho = UIImage(named: "Bomb")
        cards.image = baralho
        cards.isUserInteractionEnabled = true
        return cards
    }()
    
    private let victory: UIImageView = {
        let cards = UIImageView()
        let baralho = UIImage(named: "Victory")
        cards.image = baralho
        cards.isUserInteractionEnabled = true
        return cards
    }()
    
    //Criando contador
    private var cont: UILabel = {
        let titulo = UILabel()
        titulo.textColor = .black
        titulo.textAlignment = .center
        titulo.font = UIFont.systemFont(ofSize: 40, weight: .bold)
        return titulo
       }()
    
    // Criando Stack view
        lazy var stackView: UIStackView = {
            let stack = UIStackView()
            stack.axis = .vertical
            stack.spacing = -100.0
            stack.alignment = .fill
            stack.distribution = .fillProportionally
            stack.axis = .horizontal
            return stack
        }()
        
        private func imageCard(name:String) -> UIImageView {
            let imageview = UIImageView()
            let image = UIImage(named: name)
            imageview.image = image
            return imageview
        }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Chamando função de criação de Deck
        let mainInteractor = MainInteractor()
        mainInteractor.newDeck(){ deckId in
            self.deckId = deckId
            //Comprando uma carta automaticamente para o usuario
            self.drawCard()
        }
        
        //Settando background branco
        self.view.backgroundColor = .white
        
        
        //Adicionado e colocando funcionalidade no botão de comprar cartas
        self.view.addSubview(self.deck)
        
        let click = UITapGestureRecognizer(target: self, action: #selector(self.drawCard))
        self.deck.addGestureRecognizer(click)
        
        self.deck.snp.makeConstraints{ make in
            make.centerX.equalToSuperview()
            make.top.equalToSuperview().offset(50)
        }
        
        //Adicionando o contador
        self.view.addSubview(self.cont)
        self.cont.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview()
        }
        
        self.view.addSubview(self.stackView)
         stackView.snp.makeConstraints { make in
             make.centerX.left.right.equalToSuperview()
             make.bottom.equalToSuperview().offset(30)
             make.height.equalTo(400)
         }
    }
        
    @objc private func drawCard(){
        //Instanciando MainInteractor
        let mainInteractor = MainInteractor()
        
        //Chamada da função newCard
        mainInteractor.newCard(deckId: self.deckId){card in
            DispatchQueue.main.async {
                            self.stackView.addArrangedSubview(self.imageCard(name: card.cards[0].code))
            }
            
            if(card.cards[0].value.uppercased() == "QUEEN" || card.cards[0].value.uppercased() == "JACK" || card.cards[0].value.uppercased() == "KING"){
                self.total += 10
            }
            else if (card.cards[0].value.uppercased() == "ACE"){
                self.total += 1
            }
            else{
                self.total += Int(card.cards[0].value)!
            }
            
            DispatchQueue.main.async{
                self.cont.text = "Total: \(self.total)"
            }
            
            if (self.total > 21){
                
                //Adicionando imagem de derrota
                DispatchQueue.main.async{
                    self.view.addSubview(self.bomb)
                    self.bomb.snp.makeConstraints { make in
                        make.centerX.equalToSuperview().offset(110)
                        make.centerY.equalToSuperview()
                        }
                }
                
                //Retirando funcionalidade de comprar cartas
                let click = UITapGestureRecognizer(target: self, action: #selector(self.drawCard))
                DispatchQueue.main.asyncAfter(deadline: .now()+2){
                    self.deck.removeGestureRecognizer(click)
                    //Adicionando o modal de derrota
                    let modalLoose = ModalLooseController()
                    modalLoose.modalPresentationStyle = .currentContext
                    
                    self.present(modalLoose, animated: true, completion: nil)
                }
            }
            else if (self.total == 21){
                
                //Adicionando imagem de vitória
                DispatchQueue.main.async {
                self.view.addSubview(self.victory)
                self.victory.snp.makeConstraints { make in
                    make.centerX.equalToSuperview().offset(110)
                    make.centerY.equalToSuperview()
                        }
                }
                
                //Retirando funcionalidade de comprar cartas
                let click = UITapGestureRecognizer(target: self, action: #selector(self.drawCard))
                DispatchQueue.main.asyncAfter(deadline: .now()+2){
                    self.deck.removeGestureRecognizer(click)
                    //Abrindo o modal de vitoria
                    let modalVictory = ModalVictoryController()
                    modalVictory.modalPresentationStyle = .currentContext
                    
                    self.present(modalVictory, animated: true, completion: nil)
                }
            }
                }
    }
}
