//
//  MainController.swift
//  vinteum
//
//  Created by Marcus Thomazetti on 29/11/23.
//

import Foundation
import UIKit
import SnapKit

class MainController: UIViewController{
    
    private let cards: UIImageView = {
        let cards = UIImageView()
        let baralho = UIImage(named: "/Users/marcusthomazetti/Documents/Api21/vinteum/Assets.xcassets/baralho.imageset/baralho.png")
        cards.image = baralho
        cards.isUserInteractionEnabled = true
        return cards
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        view.addSubview(cards)
        
        let click = UITapGestureRecognizer(target: self, action: #selector(didTapImage))
        cards.addGestureRecognizer(click)
        
        cards.snp.makeConstraints{ make in
            make.centerX.equalToSuperview()
            make.top.equalToSuperview().offset(50)
        }
    }
    
    @objc private func didTapImage(){
//        chamar api - cards
    }
}
