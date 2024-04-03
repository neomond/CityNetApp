//
//  StoriesTableViewCell.swift
//  CityNetApp
//
//  Created by Nazrin Atayeva on 03.04.24.
//

import UIKit

class StoriesTableViewCell: UITableViewCell {
    static let identifier = "StoriesTableViewCell"
    
    //MARK: Init
    private lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 12
        layout.itemSize = .init(width: 96, height: 152)
        
        let view = UICollectionView(frame: .zero, collectionViewLayout: layout)
        view.contentInset = .init(top: 16, left: 16, bottom: 16, right: 16)
        view.showsHorizontalScrollIndicator = false
        
        view.register(StoryCollectionViewCell.self, forCellWithReuseIdentifier: StoryCollectionViewCell.reuseIdentifier)
        view.dataSource = self
      
        return view
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.addSubviews()
    }
    required init?(coder: NSCoder) {
        fatalError()
    }

    private func addSubviews() {
        
        self.contentView.addSubview(self.collectionView)
        
        self.updateConstraints()
    }
    
    override func updateConstraints() {
        super.updateConstraints()
        
        self.collectionView.snp.updateConstraints { make in
            make.edges.equalToSuperview()
        }
    }
}

extension StoriesTableViewCell: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: StoryCollectionViewCell.reuseIdentifier, for: indexPath) as! StoryCollectionViewCell
        cell.configure(image: AppAssets.storyImg.load(), title: "Böyükdən kiçiyə hər kəs üçün")
        return cell
    }
    
    
}
