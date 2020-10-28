//
//  NSObjectProtocol+SwiftAK.swift
//  SwiftAK
//
//  Created by Zach Eriksen on 10/27/20.
//  Copyright © 2020 oneleif. All rights reserved.
//

import Foundation

public extension NSObjectProtocol {
    
    /// Modify the object
    /// - Parameters:
    ///     - closure: A trailing closure that receives itself inside the closue
    @discardableResult
    func configure(_ closure: (Self) -> Void) -> Self {
        closure(self)
        
        return self
    }
}
