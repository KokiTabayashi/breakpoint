//
//  ShadowView.swift
//  breakpoint
//
//  Created by Koki Tabayashi on 2018/05/12.
//  Copyright © 2018年 Koki Tabayashi. All rights reserved.
//

import UIKit

class ShadowView: UIView {

    override func awakeFromNib() {
        self.layer.shadowOpacity = 0.75
        self.layer.shadowRadius = 5
        self.layer.shadowColor = UIColor.black.cgColor
        
        super.awakeFromNib()
    }
}
