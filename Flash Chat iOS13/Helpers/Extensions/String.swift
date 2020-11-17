//
//  String.swift
//  Flash Chat iOS13
//
//  Created by Angelique Babin on 17/11/2020.
//  Copyright © 2020 Angela Yu. All rights reserved.
//

import Foundation

extension String {
    /// Check if a string contains at least one element
    var isBlank: Bool {
        return self.trimmingCharacters(in: .whitespaces) == String() ? true : false
    }
}
