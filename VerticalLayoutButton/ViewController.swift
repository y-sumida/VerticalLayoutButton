//
//  ViewController.swift
//  VerticalLayoutButton
//
//  Created by Yuki Sumida on 2017/12/13.
//  Copyright © 2017年 Yuki Sumida. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var button: VerticalLayoutButton!

    override func viewDidLoad() {
        super.viewDidLoad()

        let b = VerticalLayoutButton()
        b.setTitle("code", for: .normal)
        b.setTitleColor(UIColor.red, for: .normal)
        b.setImage(UIImage(named: "setting"), for: .normal)
        b.backgroundColor = UIColor.lightGray
        self.view.addSubview(b)
        b.translatesAutoresizingMaskIntoConstraints = false
        b.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 16).isActive = true
        b.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 20).isActive = true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func tapButton(_ sender: Any) {
    }
    
}

