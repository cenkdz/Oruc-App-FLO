//
//  ObservableObject.swift
//  Oruc
//
//  Created by Cenk Donmez on 5.07.2023.
//
// BOXING TECHNIQUE
import Foundation

final class ObservableObj<T> {
    
    //Whenever the value changes (didSet) it broadcasts to the observers.
    var value: T {
        didSet{
            listener?(value)
        }
    }
    
    private var listener: ((T) -> Void)?
    
    init(_ value: T) {
        self.value = value
    }
    
    func bind(_ listener: @escaping(T) -> Void) {
        listener(value)
        self.listener = listener
    }
}
