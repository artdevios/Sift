//
//  Buttons.swift
//  Sift
//
//  Created by Денис Фролов on 25/01/2019.
//  Copyright © 2019 Denis Frolov. All rights reserved.
//

import UIKit

class btnRoundRect: UIButton {
    override func awakeFromNib() {
        super.awakeFromNib()
        self.layer.cornerRadius = self.bounds.height/2
    }
}

class btnRoundRectWithShadow: UIButton {
    override func awakeFromNib() {
        super.awakeFromNib()
        
        updateLayerProperties()
        self.layer.cornerRadius = self.bounds.height/2
    }
    
    func updateLayerProperties() {
        // Shadow and Radius
        self.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.25).cgColor
        self.layer.shadowOffset = CGSize(width: 1.0, height: 2.0)
        self.layer.shadowOpacity = 1.0
        self.layer.shadowRadius = 0.0
        self.layer.masksToBounds = false
        self.layer.cornerRadius = self.bounds.height/2
    }
}
