//
//  Mediator.swift
//  HDAlgorithm
//
//  Created by bailun on 2022/11/18.
//

import Foundation
import UIKit

public protocol Mediator {}

public protocol Receiver: Mediator {
    
    associatedtype Message
    var outputBlock: (() -> Void)? { get set }
    mutating func receive(message: Message)
}

public protocol Sender: Mediator {
    
    associatedtype Message
    associatedtype ReceiverType: Receiver
    var recipients: [ReceiverType] { get }
    func send(message: Message)
}

struct SecondPage: Receiver {
    
    var outputBlock: (() -> Void)?
    var rereiveData: Any?
    func receive(message: String) {
        print("-receive-\(message)")
    }
}


final class MediatorClass: Sender {

    var recipients: [SecondPage] = []
    
    func add(recipient: SecondPage) {
        recipients.append(recipient)
    }
    
    func send(message: String) {
        recipients.forEach { (programmer) in
            programmer.receive(message: message)
        }
    }
}
