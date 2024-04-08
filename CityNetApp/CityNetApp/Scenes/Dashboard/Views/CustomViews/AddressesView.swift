//
//  AddressesView.swift
//  CityNetApp
//
//  Created by Nazrin Atayeva on 06.04.24.
//

import UIKit
import CityNetUIkit

class AddressesView: UIView   {
    
    lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let screenWidth = UIScreen.main.bounds.width
        let cellWidth = screenWidth - 32
        let cellHeight = 338.0
        let cellPadding = 16
        
        layout.itemSize = .init(width: cellWidth, height: cellHeight)
        layout.minimumLineSpacing = UIScreen.main.bounds.width - cellWidth
        layout.sectionInset = .init(top: 8, left: 16, bottom: 16, right: 16)
              
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.isPagingEnabled = true
        cv.showsHorizontalScrollIndicator = false
        
        cv.register(AdressCollectionViewCell.self, forCellWithReuseIdentifier: AdressCollectionViewCell.reuseIdentifier)
        cv.backgroundColor = adaptiveColor(.black)
        return cv
    }()
    
    //MARK: Init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.addSubviews()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    private func addSubviews() {
        self.addSubview(self.collectionView)
        self.updateConstraints()
    }
    
    override func updateConstraints() {
        super.updateConstraints()
        
        self.collectionView.snp.updateConstraints { make in
            make.edges.equalToSuperview()
            make.height.equalTo(380.0)
        }

    }
}
