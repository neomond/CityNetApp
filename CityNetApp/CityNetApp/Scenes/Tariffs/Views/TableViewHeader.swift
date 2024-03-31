//
//  TableViewHeader.swift
//  CityNetApp
//
//  Created by Nazrin Atayeva on 27.03.24.
//

import UIKit
import SnapKit
import CityNetUIkit

class TariffsTableViewHeader: UILabel, ThemeableView {
    
    var theme: ThemeProvider = App.theme
    
    //MARK: Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.text = "Tariflər"
        self.font = AppFonts.SFBoldLargeTitle.fontStyle
        
    }
    required init?(coder: NSCoder) {
        fatalError()
    }
}
