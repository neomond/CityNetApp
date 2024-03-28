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

final class TariffsView: UIView, UITableViewDataSource, ThemeableView {
    
    var theme: ThemeProvider = App.theme
    weak var delegate: TariffsViewDelegate?
    
    var tariffs: [Tariff] = [
        Tariff(type: .internet, title: "İnternet", speedText: "40 Mb/s sürət", priceText: "Tarifə qoşul • 17.99 ₼ / Aylıq", speedImage: UIImage(named: AppAssets.speedImage40.rawValue)!),
        Tariff(type: .internetTV, title: "İnternet + TV", speedText: "40 Mb/s sürət", priceText: "Tarifə qoşul • 17.99 ₼ / Aylıq", speedImage: UIImage(named: AppAssets.speedImage50.rawValue)!),
        Tariff(type: .internetTVPhone, title: "İnternet + TV + Telefon xətti", speedText: "40 Mb/s sürət", priceText: "Tarifə qoşul • 17.99 ₼ / Aylıq", speedImage: UIImage(named: AppAssets.speedImage100.rawValue)!)
    ]
    
    lazy var tariffsTableView: TariffsTableView = {
        let tableView = TariffsTableView()
        tableView.dataSource = self
        tableView.delegate = self
        //MARK: Disable the automatic adjustment of scroll view insets:
        tableView.contentInsetAdjustmentBehavior = .never
        return tableView
    }()
    
    
    init() {
        super.init(frame: .zero)
        
        self.addSubviews()
        self.setupUI()
        self.addConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func updateConstraints() {
        super.updateConstraints()
    }
    
    
    // MARK: - Private
    
    private func addSubviews() {
        //self.updateConstraints()
      
        self.addSubview(tariffsTableView)
    }
    
    private func setupUI() {
        self.backgroundColor = adaptiveColor(.grayPrimary)
    }
    
    private func addConstraints(){
        self.tariffsTableView.snp.updateConstraints { make in
            make.top.equalTo(self.safeAreaLayoutGuide.snp.top).offset(-8)
            make.leading.trailing.equalToSuperview().inset(16)
            make.bottom.equalToSuperview()
        }
    }
}


extension TariffsView: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tariffs.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: TariffsCell.identifier, for: indexPath) as? TariffsCell else {
            return UITableViewCell()
        }
        
        let tariff = tariffs[indexPath.row]
        cell.configure(with: tariff)
        return cell
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
         
           let header = TariffsTableViewHeader()
           return header
       }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
           return 60
       }
}
