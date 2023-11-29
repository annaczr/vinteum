import UIKit
import SnapKit

class ViewController: UIViewController {
    
    let text: UILabel = {
        let text = UILabel()
        text.text = "vinte-um"
        text.textColor = .black
        text.font = UIFont.systemFont(ofSize: 40, weight: .bold)
        return text
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        self.view.addSubview(text)
        text.snp.makeConstraints{ make in
            make.centerX.equalToSuperview()
            make.top.equalToSuperview().offset(250)
        }
    }
}
