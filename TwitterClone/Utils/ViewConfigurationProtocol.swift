//
//  ViewConfigurationProtocol.swift
//  TwitterClone
//
//  Created by João Luis dos Santos on 24/06/20.
//  Copyright © 2020 João Luis dos Santos. All rights reserved.
//

/* It protocol ensures that the screens are built in the best way */

import Foundation

protocol ViewConfiguration {
    func buildView()
    func addConstraints()
    func additionalConfiguration()
    func setupView()
}

extension ViewConfiguration {
    func setupView() {
        buildView()
        addConstraints()
        additionalConfiguration()
    }
}
