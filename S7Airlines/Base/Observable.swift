//
//  Observable.swift
//  S7Airlines
//
//  Created by Pavel Plotnikov on 27.03.2021.
//

import Foundation

public class Observable<T> {
    private lazy var observers = [Observer<T>]()

    public init(_ value: T) {
        self._value = value
    }
    private var valueMutex = pthread_mutex_t()
    private var _value: T
    public var value: T {
        get {
            pthread_mutex_lock(&valueMutex)
            defer { pthread_mutex_unlock(&valueMutex) }
            return _value
        }
        set {
            pthread_mutex_lock(&valueMutex)
            _value = newValue
            pthread_mutex_unlock(&valueMutex)
            self.cleanDeadObservers()
            for observer in self.observers {
                if observer.callOnMain {
                    DispatchQueue.main.async {
                        observer.closure(self.value)
                    }
                } else {
                    observer.closure(self.value)
                }
            }
        }
    }

    public func observe(_ observer: AnyObject, closure: @escaping (_ value: T) -> Void, onMainThread: Bool = false) {
        self.observers.append(Observer(owner: observer, closure: closure, callOnMain: onMainThread))
        self.cleanDeadObservers()
    }

    public func removeObserver(_ observer: AnyObject) {
        self.observers = self.observers.filter { $0.owner !== observer }
    }

    private func cleanDeadObservers() {
        self.observers = self.observers.filter { $0.owner != nil }
    }
}

private struct Observer<T> {
    weak var owner: AnyObject?
    let callOnMain: Bool
    let closure: (_ value: T) -> Void
    init (owner: AnyObject, closure: @escaping (_ value: T) -> Void, callOnMain: Bool) {
        self.owner = owner
        self.closure = closure
        self.callOnMain = callOnMain
    }
}
