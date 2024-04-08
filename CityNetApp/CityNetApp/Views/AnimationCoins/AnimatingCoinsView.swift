//
//  AnimatingCoinsView.swift
//  CityNetApp
//
//  Created by Nazrin Atayeva on 08.04.24.
//

import UIKit

class AnimatingCoinsView: UIView {
    
    let cardWidth: CGFloat
    
    private let coin1 = CoinView()
    private let coin2 = CoinView()
    private let coin3 = CoinView()
    
    private let imageWidth = 256.0
    
    lazy var firstPosition = (cardWidth - imageWidth)/2 + 20
    
    lazy var secondPosition = firstPosition + 256/2 - 40
    lazy var thirdPosition = secondPosition + 256/2 - 40
    
    func resetCoinPositions() {
        self.coin1.frame = .init(x: firstPosition, y: -40, width: 40, height: 40)
        self.coin2.frame = .init(x: secondPosition, y: -40, width: 40, height: 40)
        self.coin3.frame = .init(x: thirdPosition, y: -40, width: 40, height: 40)
    }
    
    
    func animateCoins() {
        UIView.animate(withDuration: 1, delay: 0, options: [.repeat, .curveEaseIn],  animations: {
            self.coin1.frame = CGRect(x: self.firstPosition, y: 200, width: 40, height: 40)
        })
        
        UIView.animate(withDuration: 1, delay: 0.2, options: [.repeat, .curveEaseIn],  animations: {
            self.coin3.frame = CGRect(x: self.thirdPosition, y: 200, width: 40, height: 40)
        })
        
        UIView.animate(withDuration: 1, delay: 0.4, options: [.repeat, .curveEaseIn],  animations: {
            self.coin2.frame = CGRect(x: self.secondPosition, y: 200, width: 40, height: 40)
        })
        
    }
    
    //MARK: Init
    
    fileprivate func addSubviews() {
        self.addSubview(self.coin1)
        self.addSubview(self.coin2)
        self.addSubview(self.coin3)
    }
    
    init(cardWidth: CGFloat) {
        self.cardWidth = cardWidth
        super.init(frame: .zero)
        addSubviews()
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    
    public func startAnimating() {
        
        DispatchQueue.main.async {
            self.resetCoinPositions()
            self.animateCoins()
        }
        
    }
}
