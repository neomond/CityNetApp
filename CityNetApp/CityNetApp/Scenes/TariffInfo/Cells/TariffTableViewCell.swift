//
//  TariffTableViewCell.swift
//  CityNetApp
//
//  Created by Nazrin Atayeva on 31.03.24.
//

import UIKit
import CityNetUIkit

protocol TariffTableViewCellDelegate: AnyObject {
    func onTapJoinButton(model: TariffModel)
}

class TariffTableViewCell: UITableViewCell, ThemeableView {
    
    static var reuseIdentifier = "TariffTableViewCell"
    var theme: ThemeProvider = App.theme
    
    weak var delegate: TariffTableViewCellDelegate?
    
    var hasJoinButton: Bool = false
    
    
    var model: TariffModel? {
        didSet {
            configure()
        }
    }
    
    private var contentBackView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.cornerRadius = 16
        view.layer.borderColor = UIColor.systemGray5.cgColor
        view.layer.borderWidth = 1
        view.layer.shadowColor = UIColor.black.cgColor
        view.layer.shadowOffset = CGSize(width: 0, height: 4)
        view.layer.shadowRadius = 16
        view.layer.shadowOpacity = 0.1
        return view
    }()
    
    private var topView: TariffCellTopView = {
        let view = TariffCellTopView()
        return view
    }()
    
    private var tariffImageView: UIImageView = {
        let view = UIImageView()
        view.image = AppAssets.speedIcon.load()
        return view
    }()
    
    private var tariffInfoStackView: UIStackView = {
        let view = UIStackView()
        view.axis = .vertical
        view.spacing = 24
        return view
    }()
    
    private lazy var joinButton: AppPrimaryButton = {
        let btn = AppPrimaryButton()
        btn.addTarget(self, action: #selector(onTapBtn), for: .touchUpInside)
        return btn
    }()
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        for subview in tariffInfoStackView.arrangedSubviews {
            tariffInfoStackView.removeArrangedSubview(subview)
            subview.removeFromSuperview()
        }
    }
    
    //MARK: Init
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    
        self.selectionStyle = .none
        self.isUserInteractionEnabled = true
        self.addSubviews()
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    private func addSubviews() {
        self.contentBackView.addSubview(self.topView)
        
        self.contentBackView.addSubview(self.tariffInfoStackView)
        
        
        self.contentBackView.addSubview(self.tariffImageView)
        
        self.contentView.addSubview(self.contentBackView)
        
        self.updateConstraints()
    }
    
    override func updateConstraints() {
        
        self.contentBackView.snp.updateConstraints { make in
            make.top.leading.trailing.equalToSuperview()
            make.bottom.equalToSuperview().offset(-32)
        }
        
        
        self.topView.snp.updateConstraints { make in
            make.top.equalToSuperview().offset(2)
            make.horizontalEdges.equalToSuperview().inset(2)
        }
        
        
        self.tariffImageView.snp.updateConstraints { make in
            make.width.height.equalTo(88)
            make.top.equalToSuperview().offset(32)
            make.trailing.equalToSuperview().offset(-12)
        }
        
        
        super.updateConstraints()
    }
    
    @objc func onTapBtn() {
        guard let model = model else { return }
        delegate?.onTapJoinButton(model: model)
    }
    
    
    //MARK: Configure
    
    private func configure() {
        guard let model = model else { return }
        
        self.topView.backgroundColor = model.type.color
        
        self.topView.title = model.name
        
        self.tariffImageView.image = model.image
        
        for info in model.tariffInfos {
            let view = TariffContentSingleTile()
            view.data = info
            self.tariffInfoStackView.addArrangedSubview(view)
        }
        
        self.setupButton(model)
        
    }
    
    
    private func setupButton(_ model: TariffModel) {
        if self.hasJoinButton {
            self.contentBackView.addSubview(self.joinButton)
            
            self.tariffInfoStackView.snp.updateConstraints { make in
                make.top.equalTo(self.topView.snp.bottom).offset(20)
                make.horizontalEdges.equalToSuperview().inset(12)
            }
            
            
            self.joinButton.snp.updateConstraints { make in
                make.top.equalTo(self.tariffInfoStackView.snp.bottom).offset(32)
                make.horizontalEdges.equalToSuperview().inset(12)
                make.bottom.equalToSuperview().offset(-12)
                make.height.equalTo(56)
            }
            self.joinButton.setTitle("Tarifə qoşul \(model.price)", for: .normal)
            
        }
        
        else {
            self.tariffInfoStackView.snp.updateConstraints { make in
                make.top.equalTo(self.topView.snp.bottom).offset(20)
                make.horizontalEdges.equalToSuperview().inset(12)
                make.bottom.equalToSuperview().offset(-20)
            }
            
        }
    }
}
