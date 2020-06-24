//
//  ExploreController.swift
//  TwitterClone
//
//  Created by João Luis dos Santos on 22/06/20.
//  Copyright © 2020 João Luis dos Santos. All rights reserved.
//

import UIKit

class ExploreController: UIViewController {
    
    // MARK: - Properties
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
         configureUI()
    }
    
    // MARK: - Functions
    
    func configureUI() {
        view.backgroundColor = .white
        navigationItem.title = "Explore"
    }
}
