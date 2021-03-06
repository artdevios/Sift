//
//  LoginRouter.swift
//  Sift
//
//  Created Денис Фролов on 25/01/2019.
//  Copyright © 2019 Denis Frolov. All rights reserved.
//
//  Template generated by Juanpe Catalán @JuanpeCMiOS
//

import UIKit

class LoginRouter {
    
    weak var viewController: UIViewController?

    // MARK: - Private
    
    private static func createModule() -> UIViewController {
        let view = LoginViewController.initiate(storyboardType: .enter)
        let interactor = LoginInteractor()
        let router = LoginRouter()
        let presenter = LoginPresenter(interface: view, interactor: interactor, router: router)

        view.presenter = presenter
        interactor.presenter = presenter
        router.viewController = view

        return view
    }
    
    // MARK: - Public
    
    static func presenLoginModule(from view: UIViewController) {
        let vc = LoginRouter.createModule()
        view.navigationController?.pushViewController(vc, animated: true)
    }
}

// MARK: - LoginWireframeProtocol

extension LoginRouter: LoginWireframeProtocol {
    
    func showAlert(title: String?, msg: String?) {
        let alertController = UIAlertController(title: title, message: msg, preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
        viewController?.present(alertController, animated: true, completion: nil)
    }
}
