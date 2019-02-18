//
//  TestViewController.swift
//  Sift
//
//  Created by Денис Фролов on 27/01/2019.
//  Copyright © 2019 Denis Frolov. All rights reserved.
//

import UIKit
import AWSMobileClient

class TestViewController: UIViewController, StoryboardInitiable {
    
    static func presentTestViewController(from view: UIViewController) {
        let vc = TestViewController.initiate(storyboardType: .enter)
        view.navigationController?.pushViewController(vc, animated: true)
    }
    
    static func presentBaseTestViewController() {
        let vc = TestViewController.initiate(storyboardType: .enter)
        let navigationController = UINavigationController(rootViewController: vc)
        let window = UIApplication.shared.delegate?.window ?? nil
        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()
    }
    
    @IBAction func onSignOutButton(_ sender: UIButton) {
        AWSMobileClient.sharedInstance().signOut()
        WelcomeRouter.presentWelcomeModule()
    }

}

