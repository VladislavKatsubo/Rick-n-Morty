//
//  Extensions.swift
//  Rick&Morty
//
//  Created by Vlad Katsubo on 1.01.23.
//

import UIKit

extension UIView {
    func addSubviews(_ views: UIView...) {
        views.forEach {
            addSubview($0)
        }
    }
}
