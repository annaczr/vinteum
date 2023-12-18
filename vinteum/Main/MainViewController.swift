//
//  MainViewController.swift
//  vinteum
//
//  Created by Mirella Miyakawa on 15/12/23.
//

import Foundation
import SnapKit

protocol MainViewControllerInterface {
    func showCard(code:String)
    func removeClick()
    func showPoints(total: Int)
    func stopLoading()
}

class MainViewController: UIViewController, MainViewControllerInterface {

    var click: UITapGestureRecognizer?
   var activityIndicator: UIActivityIndicatorView = UIActivityIndicatorView(style: .gray)
   var interactor: MainInteractor?
   init(interactor: MainInteractor) {
       super.init(nibName: nil, bundle: nil)
       self.interactor = interactor
   }

   required init?(coder: NSCoder) {
       fatalError("init(coder:) has not been implemented")
   }
    
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
    
    // Settando as imagens
    private func imageCard(name:String) -> UIImageView {
        let imageview = UIImageView()
        let image = UIImage(named: name)
        imageview.image = image
        return imageview
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Chamando função de criação de Deck
        self.view.addSubview(activityIndicator)
        interactor?.newDeck()
        
        self.click = UITapGestureRecognizer(target: self, action: #selector(self.drawCard))

        
        //Settando background branco
        self.view.backgroundColor = .white
        
        //Adicionado e colocando funcionalidade no botão de comprar cartas
        self.view.addSubview(self.deck)
        
        self.deck.addGestureRecognizer(self.click!)
        
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
        
        self.view.addSubview(stackView)
        stackView.snp.makeConstraints { (make) in
            make.centerX.left.right.equalToSuperview()
            make.bottom.equalToSuperview().offset(30)
            make.height.equalTo(400)
        }
    }
    
    @objc
    func drawCard(){
        DispatchQueue.main.async{
            self.interactor?.drawCard()
        }
    }
    
    func stopLoading(){
        DispatchQueue.main.async {
            self.activityIndicator.removeFromSuperview()
        }
    }
    
    func showCard(code: String){
        DispatchQueue.main.async {
            self.stackView.addArrangedSubview(self.imageCard(name: code))
        }
    }
    
    @objc
    func removeClick(){
        DispatchQueue.main.async {
            self.deck.removeGestureRecognizer(self.click!)
        }
    }
    
    func showPoints(total: Int){
        DispatchQueue.main.async {
            self.cont.text = "Total: \(total)"
        }
    }
}
