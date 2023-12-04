import UIKit
import SnapKit

class ViewController: UIViewController {
    
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
            
            //Settando titulo da pagina
            self.view.addSubview(titulo)
                titulo.snp.makeConstraints{ make in
                  make.centerX.equalToSuperview()
                  make.top.equalToSuperview().offset(250)
                }
            
            
            //Settando a imagem como background
            let backgroundImageView = UIImageView(image: backgroundImage)
            backgroundImageView.contentMode = .scaleAspectFill
            self.view.addSubview(backgroundImageView)
            
            backgroundImageView.snp.makeConstraints{ make in
                make.edges.equalToSuperview()
            }

            //Settando botão e adicionando funcionalidade
            self.button.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)

            self.view.addSubview(button)
            button.translatesAutoresizingMaskIntoConstraints = false
            
            button.snp.makeConstraints{ make in
                make.width.equalTo(250)
                make.centerX.equalToSuperview()
                make.centerY.equalToSuperview().offset(200)
            }
            
          }

        @objc private func didTapButton(){
            let mainController = MainController()
          navigationController?.pushViewController(mainController, animated: true)
        }


}
