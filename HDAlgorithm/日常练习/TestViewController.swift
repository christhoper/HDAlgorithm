//
//  TestViewController.swift
//  HDAlgorithm
//
//  Created by bailun on 2022/11/18.
//

import UIKit

class TestViewController: UIViewController {
    
    var receiver: SecondPage?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        print("接收到的数据", receiver?.rereiveData)
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            self.receiver?.outputBlock?()
        }
        // Do any additional setup after loading the view.
    }
}


