//
//  TextFieldCell.swift
//  Sift
//
//  Created by Денис Фролов on 25/01/2019.
//  Copyright © 2019 Denis Frolov. All rights reserved.
//

import UIKit

class TextFieldCell: UITableViewCell {
    
    
    @IBOutlet weak var textField: UITextField!
    
    var model: SignUpCellModel? {
        didSet {
            reloadData()
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        textField.delegate = self
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        textField.delegate = nil
    }

    // MARK: - Public
    
    static var identifier: String {
        return String(describing: self)
    }
    
    // MARK: - Private
    
    func reloadData() {
        guard let model = model else { return }
        textField.textContentType = model.contentType
        textField.placeholder = model.placeholder
        textField.autocapitalizationType = model.autocapitalizationType
        textField.keyboardType = model.keyboardType
        textField.isSecureTextEntry = model.isSecureTextEntry
    }

}

// MARK: - UITextFieldDelegate

extension TextFieldCell: UITextFieldDelegate {
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool  {
        guard let model = model else { return false }
        model.value = (textField.text as NSString?)?.replacingCharacters(in: range, with: string)
        return true
    }
}
