//
//  SignupProtocols.swift
//  Sift
//
//  Created Денис Фролов on 25/01/2019.
//  Copyright © 2019 Denis Frolov. All rights reserved.
//
//  Template generated by Juanpe Catalán @JuanpeCMiOS
//

import UIKit

//MARK: Wireframe -
protocol SignupWireframeProtocol: class {
    
    func showErrorAlert(msg: String)
    func showAlert(title: String?, msg: String?)

}
//MARK: Presenter -
protocol SignupPresenterProtocol: class {

    var interactor: SignupInteractorInputProtocol! { get set }
    
    // Table View
    var cellCount: Int { get }
    var cellHeight: CGFloat { get }
    func dataForIndexPath(_ indexPath: IndexPath) -> SignUpCellModel?
    
    // Actions
    func signUpAction()
}

//MARK: Interactor -
protocol SignupInteractorOutputProtocol: class {

    /* Interactor -> Presenter */
}

protocol SignupInteractorInputProtocol: class {

    var presenter: SignupInteractorOutputProtocol!  { get set }

    /* Presenter -> Interactor */
}

//MARK: View -
protocol SignupViewProtocol: class {

    var presenter: SignupPresenterProtocol!  { get set }

    /* Presenter -> ViewController */
}