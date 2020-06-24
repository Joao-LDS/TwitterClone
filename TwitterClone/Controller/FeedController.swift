//
//  FeedController.swift
//  TwitterClone
//
//  Created by João Luis dos Santos on 22/06/20.
//  Copyright © 2020 João Luis dos Santos. All rights reserved.
//

import UIKit

class FeedController: UIViewController {
    
    // MARK: - Properties
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    
    // MARK: - Functions
    
    func configureUI() {
        view.backgroundColor = .white
        
        let image = UIImageView(image: UIImage(named: "twitter_logo_blue"))
        image.contentMode = .scaleAspectFit
        navigationItem.titleView = image
    }
}
