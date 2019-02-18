//
//  WelcomeProtocols.swift
//  Sift
//
//  Created Денис Фролов on 25/01/2019.
//  Copyright © 2019 Denis Frolov. All rights reserved.
//
//  Template generated by Juanpe Catalán @JuanpeCMiOS
//

import Foundation

//MARK: Wireframe -
protocol WelcomeWireframeProtocol: class {

}
//MARK: Presenter -
protocol WelcomePresenterProtocol: class {

    var interactor: WelcomeInteractorInputProtocol! { get set }
    
    // Actions
    func actionLoginWithPhone()
    func actionNext()
}

//MARK: Interactor -
protocol WelcomeInteractorOutputProtocol: class {

    /* Interactor -> Presenter */
}

protocol WelcomeInteractorInputProtocol: class {

    var presenter: WelcomeInteractorOutputProtocol!  { get set }

    /* Presenter -> Interactor */
}

//MARK: View -
protocol WelcomeViewProtocol: class {

    var presenter: WelcomePresenterProtocol!  { get set }

    /* Presenter -> ViewController */
}
