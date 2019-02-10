//
//  HomeViewController.swift
//  zapei
//
//  Created by Penélope Araújo on 09/02/19.
//  Copyright © 2019 zapei. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    @IBAction func readButton(_ sender: Any) {
        let viewController = ViewController()
        present(viewController, animated: false, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

}
