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
        button.contentVerticalAlignment = .top
        button.contentHorizontalAlignment = .left
        button.contentEdgeInsets = UIEdgeInsets(top: 8, left: 0, bottom: 10, right: -8)
        button.imageEdgeInsets = UIEdgeInsets(top: 0, left: 30, bottom: 0, right: 0)
        button.titleEdgeInsets = UIEdgeInsets(top: 20, left: -20, bottom: 0, right: 0)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

