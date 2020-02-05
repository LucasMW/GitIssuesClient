//
//  Observable.swift
//  GitIssues
//
//  Created by Lucas Menezes on 2/5/20.
//  Copyright © 2020 Lucas Menezes. All rights reserved.
//

import Foundation

class Observable<Data: Equatable> {
    typealias Listener = (Data) -> Void

    var listeners: [Listener]? = []

    var value: Data {
        didSet {
            if oldValue != value {
                for listener in listeners! {
                    listener(value)
                }
            }
        }
    }

    init(_ value: Data) {
        self.value = value
    }

    func observe(listener: @escaping Listener) {
        self.listeners?.append(listener)
        listener(value)
    }

    func bind<T: Observable>(_ observable: T) {
        listeners?.append({
            observable.value = $0
        })
    }

    func removeAllObservers() {
        self.listeners?.removeAll()
    }
}
