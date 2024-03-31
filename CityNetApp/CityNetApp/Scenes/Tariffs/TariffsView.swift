//
//  TariffsView.swift
//  CityNetApp
//
//  Created by Nazrin Atayeva on 27.03.24.
//

import UIKit
import SnapKit
import CityNetUIkit

protocol TariffsViewDelegate: AnyObject {}

final class TariffsView: UIView {
    
    weak var delegate: TariffsViewDelegate?
    
    lazy var tariffsTableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .grouped)
        tableView.register(TariffTableViewCell.self, forCellReuseIdentifier: TariffTableViewCell.reuseIdentifier)
        tableView.backgroundColor = .clear
        tableView.separatorStyle = .none
        tableView.showsVerticalScrollIndicator = false
        return tableView
    }()
    
    init() {
        super.init(frame: .zero)
        
        self.addSubviews()
        self.setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func updateConstraints() {
        self.tariffsTableView.snp.updateConstraints { make in
            make.top.equalToSuperview().offset(16)
            make.horizontalEdges.equalToSuperview().inset(16)
            make.bottom.equalToSuperview()
        }
        
        super.updateConstraints()
    }
    
    
    // MARK: - Private
    
    private func addSubviews() {
        self.addSubview(self.tariffsTableView)
        self.updateConstraints()
    }
    
    private func setupUI() {
        self.backgroundColor = .white
    }
}
