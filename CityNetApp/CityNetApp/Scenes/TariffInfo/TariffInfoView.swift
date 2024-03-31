//
//  TariffInfoView.swift
//  CityNetApp
//
//  Created by Nazrin Atayeva on 28.03.24.
//

import UIKit
import CityNetUIkit

protocol TariffInfoViewDelegate: AnyObject {}

final class TariffInfoView: UIView, ThemeableView {
    
    var theme: ThemeProvider = App.theme
    weak var delegate: TariffInfoViewDelegate?
    
    
    lazy var tariffsInfoTableView: TariffInfoTableView = {
        let tableView = TariffInfoTableView()
        tableView.dataSource = self
        tableView.delegate = self
        return tableView
    }()
    
    
    private lazy var totalStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [totalTitleLabel, totalAmountLabel])
        stackView.axis = .horizontal
        stackView.spacing = 4
        stackView.alignment = .fill
        stackView.distribution = .equalSpacing
        return stackView
    }()
    
    
    private lazy var totalTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "Toplam"
        label.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        label.textAlignment = .center
        return label
    }()
    
    private lazy var totalAmountLabel: UILabel = {
        let label = UILabel()
        label.text = "32.99 ₼ / Aylıq"
        label.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        label.textAlignment = .center
        return label
    }()
    
    private lazy var borderView: BorderView = {
        let view = BorderView()
        view.borderColor = adaptiveColor(.grayPrimary)
        view.borderWidth = 1.0
        return view
    }()
    
    private lazy var orderButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Sifarişə bax", for: .normal)
        button.backgroundColor = adaptiveColor(.main)
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 12
        return button
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
        super.updateConstraints()
        
        self.tariffsInfoTableView.snp.updateConstraints { make in
            make.top.equalToSuperview()
            make.leading.trailing.equalToSuperview().inset(16)
            make.bottom.equalToSuperview()
            //          make.bottom.equalTo(totalStackView.snp.top).offset(-20)
        }
        
        //        self.totalStackView.snp.updateConstraints { make in
        //            make.leading.trailing.equalToSuperview().inset(16)
        //            make.top.equalTo(borderView.snp.bottom).offset(16)
        //        }
        //
        //        self.orderButton.snp.updateConstraints { make in
        //            make.top.equalTo(totalStackView.snp.bottom).offset(16)
        //            make.leading.trailing.equalToSuperview().inset(16)
        //            make.height.equalTo(50)
        //            make.bottom.lessThanOrEqualTo(self.safeAreaLayoutGuide.snp.bottom).offset(-20)
        //        }
        //        self.borderView.snp.makeConstraints { make in
        //            make.top.equalTo(tariffsInfoTableView.snp.bottom)
        //            make.bottom.equalTo(totalStackView.snp.top).offset(-16)
        //            make.leading.trailing.equalToSuperview()
        //            make.height.equalTo(1.0)
        //        }
    }
    
    
    // MARK: - Private
    
    private func addSubviews() {
        //self.updateConstraints()
        
        self.addSubview(tariffsInfoTableView)
        //        self.addSubview(borderView)
        //        self.addSubview(totalStackView)
        //        self.totalStackView.addSubview(totalTitleLabel)
        //        self.totalStackView.addSubview(totalAmountLabel)
        //        self.addSubview(orderButton)
    }
    
    private func setupUI() {
        self.backgroundColor = .white
    }
    
}


extension TariffInfoView: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0: return 1
            
        case 1: return 1
            
        default: return 1
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.section == 0 {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: TariffInfoCell.identifier, for: indexPath) as? TariffInfoCell else {
                return UITableViewCell()
            }
            return cell
            
        } else if indexPath.section == 1 {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: TariffInfoPackageDetailsCell.identifier, for: indexPath) as? TariffInfoPackageDetailsCell else {
                return UITableViewCell()
            }
            
            return cell
        }
        else if indexPath.section == 2 {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: TariffAdditionalsCell.identifier, for: indexPath) as? TariffAdditionalsCell else {
                return UITableViewCell()
            }
            return cell
        }
        else {
            return UITableViewCell()
        }
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    //    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
    //        //----for performance
    //        return 100
    //    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        if section == 0 {
            let header = TariffTableViewInfoHeader()
            return header
        } else {
            return nil
        }
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 60
    }
}
