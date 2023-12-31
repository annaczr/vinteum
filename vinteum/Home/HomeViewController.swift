import UIKit
import SnapKit

class HomeViewController: UIViewController {
     var interactor: HomeInteractor?
    init(interactor: HomeInteractor) {
        super.init(nibName: nil, bundle: nil)
        self.interactor = interactor
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

    private let backgroundImage = UIImage(named: "HomeBackGround")

    
    private let button: UIButton = {
        let button = UIButton()
        button.setTitle("new game", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 20, weight: .bold)
        button.backgroundColor = .red
        button.layer.cornerRadius = 15
        return button
    }()
    
    private let titulo: UILabel = {
        let titulo = UILabel()
        titulo.text = "twenty-one"
        titulo.textColor = .black
        titulo.textAlignment = .center
        titulo.font = UIFont.systemFont(ofSize: 40, weight: .bold)
        return titulo
       }()

        override func viewDidLoad() {
            super.viewDidLoad()
            
            //Retirando o botão de back
            self.navigationItem.hidesBackButton = true
            
            //Settando a imagem como background
            let backgroundImageView = UIImageView(image: backgroundImage)
            backgroundImageView.contentMode = .scaleAspectFill
            self.view.addSubview(backgroundImageView)
            
            backgroundImageView.snp.makeConstraints{ make in
                make.edges.equalToSuperview()
            }

            //Settando botão e adicionando funcionalidade
            self.button.addTarget(self, action: #selector(self.newGame), for: .touchUpInside)

            self.view.addSubview(button)
            button.translatesAutoresizingMaskIntoConstraints = false
            
            button.snp.makeConstraints{ make in
                make.width.equalTo(250).priority(.high)
                make.centerX.equalToSuperview()
                make.centerY.equalToSuperview().offset(200)
            }
            
            //Settando titulo da pagina
            self.view.addSubview(titulo)
                titulo.snp.makeConstraints{ make in
                    make.centerX.equalToSuperview().priority(.high)
                    make.centerY.equalToSuperview().offset(-200)
                }
            
            
          }
    @objc
    func newGame(){
        interactor?.newGame()
    }
    
}
