//
//  TextFields.swift
//  Sift
//
//  Created by Денис Фролов on 25/01/2019.
//  Copyright © 2019 Denis Frolov. All rights reserved.
//

import UIKit

class txtFeildRoundRectWithShadow: UITextField {
    override func awakeFromNib() {
        super.awakeFromNib()
        
        let indentView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 20))
        self.leftView = indentView
        self.leftViewMode = .always
        
        self.layer.cornerRadius = self.bounds.height/2
        self.layer.borderColor = UIColor.black.cgColor
        self.layer.borderWidth = 1
    }
}
