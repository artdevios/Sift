//
//  StoryboardInitiable.swift
//  Sift
//
//  Created by Денис Фролов on 25/01/2019.
//  Copyright © 2019 Denis Frolov. All rights reserved.
//

import Foundation

import UIKit

enum StoryboardType: String {
    case enter  = "Enter"
    case main   = "Main"
    
    var instance: UIStoryboard {
        return UIStoryboard(name: self.rawValue, bundle: Bundle.main)
    }
}

protocol StoryboardInitiable {
    static var storyboardIdentifier: String { get }
}

extension StoryboardInitiable where Self: UIViewController {
    
    static var storyboardIdentifier: String {
        return String(describing: self)
    }
    
    static func initiate(storyboardType: StoryboardType) -> Self {
        return storyboardType.instance.instantiateViewController(withIdentifier: storyboardIdentifier) as! Self
    }
}
