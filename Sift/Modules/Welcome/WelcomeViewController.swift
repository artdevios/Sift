//
//  WelcomeViewController.swift
//  Sift
//
//  Created Денис Фролов on 25/01/2019.
//  Copyright © 2019 Denis Frolov. All rights reserved.
//
//  Template generated by Juanpe Catalán @JuanpeCMiOS
//

import UIKit
import AWSMobileClient
import FBSDKCoreKit
import FBSDKLoginKit
import GoogleSignIn

class WelcomeViewController: UIViewController {

	var presenter: WelcomePresenterProtocol!

    // MARK: - Life Cycle
    
	override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.isNavigationBarHidden = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.navigationController?.isNavigationBarHidden = false
    }
    
    // MARK: - Private
    
    private func showAlert(title: String?, msg: String?) {
        let alertController = UIAlertController(title: title, message: msg, preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
        self.present(alertController, animated: true, completion: nil)
    }
    
    private func loginWithFacebook(token: String) {
        AWSMobileClient.sharedInstance().federatedSignIn(providerName: IdentityProvider.facebook.rawValue, token: token) { (userState, error)  in
            if let error = error {
                print("Facebook Sign In failed: \(error.localizedDescription)")
                DispatchQueue.main.async {
                    self.showAlert(title: "Facebook Sign In failed", msg: error.localizedDescription)
                }
            }
            if userState == .signedIn {
                DispatchQueue.main.async {
                    TestViewController.presentBaseTestViewController()
                }
            }
        }
    }
    
    private func loginWithGoogle(token: String) {
        AWSMobileClient.sharedInstance().federatedSignIn(providerName: IdentityProvider.google.rawValue, token: token) { (userState, error) in
            if let error = error {
                print("Google Sign In failed: \(error.localizedDescription)")
                DispatchQueue.main.async {
                    self.showAlert(title: "Google Sign In failed", msg: error.localizedDescription)
                }
            }
            if userState == .signedIn {
                DispatchQueue.main.async {
                    TestViewController.presentBaseTestViewController()
                }
            }
        }

    }
    
    // MARK: - Actions
    
    @IBAction func onLoginWithFacebook(_ sender: Any) {
        let fbLoginManager : FBSDKLoginManager = FBSDKLoginManager()
        fbLoginManager.logIn(withReadPermissions: ["email"], from: self) { (result, error) -> Void in
            if (error == nil){
                let fbloginresult : FBSDKLoginManagerLoginResult = result!
                // if user cancel the login
                if (result?.isCancelled)!{
                    return
                }
                if(fbloginresult.grantedPermissions.contains("email")) {
                    guard let currentToken = FBSDKAccessToken.current() else {
                        self.showAlert(title: nil, msg: "Facebook Sign In failed")
                        return
                    }
                    self.loginWithFacebook(token: currentToken.tokenString)
                }
            }
        }
        
        
        
    }
    
    @IBAction func onLoginWithGoogle(_ sender: btnRoundRect) {
        GIDSignIn.sharedInstance().delegate = self
        GIDSignIn.sharedInstance().uiDelegate = self
        GIDSignIn.sharedInstance().signIn()
    }
    
    @IBAction func onLoginWithPhone(_ sender: btnRoundRect) {
        presenter.actionLoginWithPhone()
    }
    
    @IBAction func onNextButton(_ sender: btnRoundRectWithShadow) {
//        presenter.actionNext()
    }
    

}

// MARK: - GIDSignInDelegate

extension WelcomeViewController: GIDSignInDelegate {
    func sign(_ signIn: GIDSignIn!, didSignInFor user: GIDGoogleUser!, withError error: Error!) {
        if (error == nil) {
            guard let token = user.authentication.idToken else {
                self.showAlert(title: "Error", msg: "Google Sign In failed")
                return
            }
            self.loginWithGoogle(token: token)
        } else {
            self.showAlert(title: "Error", msg: error.localizedDescription)
        }
    }
    
    
}

// MARK: - GIDSignInUIDelegate

extension WelcomeViewController: GIDSignInUIDelegate {
    
    func sign(_ signIn: GIDSignIn!, present viewController: UIViewController!) {
        self.present(viewController, animated: true, completion: nil)
    }
    
    func sign(_ signIn: GIDSignIn!, dismiss viewController: UIViewController!) {
        viewController.dismiss(animated: true, completion: nil)
    }
    
}

// MARK: - WelcomeViewProtocol

extension WelcomeViewController: WelcomeViewProtocol {
    
}

// MARK: - StoryboardInitiable

extension WelcomeViewController: StoryboardInitiable {}
