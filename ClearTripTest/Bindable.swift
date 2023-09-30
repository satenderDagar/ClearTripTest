//
//  Bindable.swift
//  ClearTripTest
//
//  Created by Satender Dagar on 30/09/23.
//

import Foundation


class Bindable<T> {
    var value: T? {
        didSet {
            observer?(value)
        }
    }
    
    init(value: T? = nil) {
        self.value = value
        observer?(value)
    }
    
    var observer: ((T?) -> ())?
    
    func bind(observer: @escaping (T?) -> ()) {
        self.observer = observer
    }
    
}
