import Foundation
import UIKit
import SnapKit

class ModalVictoryController:UIViewController{
    
    private var total:Int = 0
    
    private var titulo: UILabel = {
        let titulo = UILabel()
        titulo.textColor = .black
        titulo.textAlignment = .center
        titulo.font = UIFont.systemFont(ofSize: 40, weight: .bold)
        return titulo
       }()
    
    private let button: UIButton = {
        let button = UIButton()
        button.setTitle("return to home", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 20, weight: .bold)
        button.backgroundColor = .red
        button.layer.cornerRadius = 15
        return button
    }()
    
    private let victory: UIImageView = {
        let cards = UIImageView()
        let baralho = UIImage(named: "Victory")
        cards.image = baralho
        cards.isUserInteractionEnabled = true
        return cards
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Settando background branco
        self.view.backgroundColor = .white
        
        //Settando titulo da pagina
        self.titulo.text = "you won!\ntotal:\(self.total)" 
        self.view.addSubview(self.titulo)
        self.titulo.snp.makeConstraints{ make in
              make.centerX.equalToSuperview()
              make.top.equalToSuperview().offset(250)
            }
        
        //Settando botão e adicionando funcionalidade
        self.button.addTarget(self, action: #selector(self.newGame), for: .touchUpInside)

        self.view.addSubview(button)
        button.translatesAutoresizingMaskIntoConstraints = false
        
        button.snp.makeConstraints{ make in
            make.width.equalTo(250)
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview().offset(200)
        }
        
        //Adicionando a imagem de vitoria
        self.view.addSubview(self.victory)
        
        self.victory.snp.makeConstraints{ make in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview()
        }
    }
    @objc private func newGame(){
        // criar o coordinator
                
        let modalVictory = ModalVictoryController()
        
        let viewController = HomeFactory.make()
                
        if let appDelegate = UIApplication.shared.delegate as? AppDelegate{
            let navigationController = UINavigationController(rootViewController: modalVictory)
            appDelegate.window?.rootViewController = navigationController
            navigationController.pushViewController(viewController, animated: true)
        }
    }
}
