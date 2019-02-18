//
//  LoginProtocols.swift
//  Sift
//
//  Created Денис Фролов on 25/01/2019.
//  Copyright © 2019 Denis Frolov. All rights reserved.
//
//  Template generated by Juanpe Catalán @JuanpeCMiOS
//

import Foundation

//MARK: Wireframe -
protocol LoginWireframeProtocol: class {

    func showAlert(title: String?, msg: String?)
}
//MARK: Presenter -
protocol LoginPresenterProtocol: class {

    var interactor: LoginInteractorInputProtocol! { get set }
    
    // Actions
    func loginAction(phone: String?)
    func loginAction(email: String?, password: String?)
}

//MARK: Interactor -
protocol LoginInteractorOutputProtocol: class {

    /* Interactor -> Presenter */
}

protocol LoginInteractorInputProtocol: class {

    var presenter: LoginInteractorOutputProtocol!  { get set }

    /* Presenter -> Interactor */
}

//MARK: View -
protocol LoginViewProtocol: class {

    var presenter: LoginPresenterProtocol!  { get set }

    /* Presenter -> ViewController */
}
