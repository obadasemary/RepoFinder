//
//  Box.swift
//  Loyalty
//
//  Created by Abdelrahman Mohamed on 5/23/18.
//  Copyright © 2018 Abdelrahman Mohamed. All rights reserved.
//

import Foundation

class Box<T> {
    
    typealias Listener = (T?)->()
    private var listener: Listener?
    
    internal var value: T? {
        didSet {
            if value != nil {
                DispatchQueue.global(qos: .userInitiated).async { [weak self] in
                    self?.listener?(self?.value)
                }
                print("\(value.customMirror.subjectType) value changed 💡.")
            }
        }
    }
    
    init() {
        print("\(value.customMirror.subjectType) initialized 🚀.")
    }
    
    internal func bind(_ listener: Listener?) -> Void {
        DispatchQueue.global(qos: .userInitiated).async { [weak self] in
            self?.listener = listener
            if self?.value != nil {
                listener?(self?.value)
            }
        }
    }
    
    deinit {
        print("Killed \(value.customMirror.subjectType) 💀.")
    }
}
