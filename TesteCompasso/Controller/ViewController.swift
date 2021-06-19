//
//  ViewController.swift
//  TesteCompasso
//
//  Created by Fernando Crelick on 19/06/21.
//

import UIKit

class ViewController: UIViewController {
    let parser = Parser()
    let event = [Event]()
    override func viewDidLoad() {
        super.viewDidLoad()
        parser.automatedParse()
    }


}

