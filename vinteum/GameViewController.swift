import UIKit
import SnapKit
    
class CardsView: UIView {
        
    var images: [String] = [] {
        didSet {
            updateCards()
        }
    }
        
        override init(frame: CGRect) {
            super.init(frame: frame)
        }
        
        required init?(coder: NSCoder) {
            super.init(coder: coder)
        }
        
        private func updateCards() {
            for i in 0..<images.count {
                let cardsImageView = UIImageView(image: UIImage(named: images[i]))
                cardsImageView.contentMode = .scaleAspectFit
                
                let position =  CGPoint(x: CGFloat(i) * 90, y: 0)
                cardsImageView.frame.origin = position
                
                addSubview(cardsImageView)
            }
        }
}

class GameViewController: UIViewController {
    let viewLayout = UIView()
        
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let cardsView = CardsView(frame: CGRect(x: 0, y: 0, width: 167, height: 231))
        cardsView.images = ["AS","AS","AS", "3S", "KC"]
        self.view.addSubview(cardsView)
        
        cardsView.snp.makeConstraints { (make) in
            make.left.equalTo(-20)
            make.bottom.equalTo(-300)
        }
    }
}
