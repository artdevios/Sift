//
//  SignupRouter.swift
//  Sift
//
//  Created Денис Фролов on 25/01/2019.
//  Copyright © 2019 Denis Frolov. All rights reserved.
//
//  Template generated by Juanpe Catalán @JuanpeCMiOS
//

import UIKit

class SignupRouter {
    
     weak var viewController: UIViewController?

    // MARK: - Private
    
    private static func createModule() -> UIViewController {
        let view = SignupViewController.initiate(storyboardType: .enter)
        let interactor = SignupInteractor()
        let router = SignupRouter()
        let presenter = SignupPresenter(interface: view, interactor: interactor, router: router)

        view.presenter = presenter
        interactor.presenter = presenter
        router.viewController = view

        return view
    }
    
    // MARK: - Public
    
    static func presenSignUpModule(from view: UIViewController) {
        let vc = SignupRouter.createModule()
        view.navigationController?.pushViewController(vc, animated: true)
    }
}

// MARK: - SignupWireframeProtocol

extension SignupRouter: SignupWireframeProtocol {
    
    func showErrorAlert(msg: String) {
        showAlert(title: "Error", msg: msg)
    }
    
    func showAlert(title: String?, msg: String?) {
        let alertController = UIAlertController(title: title, message: msg, preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
        viewController?.present(alertController, animated: true, completion: nil)
    }
    
}
