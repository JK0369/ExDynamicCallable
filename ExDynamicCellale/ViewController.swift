//
//  ViewController.swift
//  ExDynamicCellale
//
//  Created by 김종권 on 2024/03/09.
//

import UIKit

class ViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let c1 = SomeModelFactory()
        print(c1)
        print(c1())
        print(c1(1, 2))
        print(c1(a: 1, 2))
        
        /*
         Model()
         0
         2
         ["": 2, "a": 1]
         */
    }
}

@dynamicCallable
struct SomeModelFactory {
    func dynamicallyCall(withArguments args: [Int]) -> Int {
        args.count
    }
    
    func dynamicallyCall(withKeywordArguments args: KeyValuePairs<String, Int>) -> [String: Int] {
        var dict = [String: Int]()
        args
            .forEach { dict[$0.key] = $0.value }
        return dict
    }
}

//enum SomeModelFactory {
//    static func make() -> Int {}
//}
