//
//  StoryBoardSampleViewController.swift
//  VerticalLayoutButton
//
//  Created by Yuki Sumida on 2017/12/13.
//  Copyright © 2017年 Yuki Sumida. All rights reserved.
//

import UIKit

class StoryBoardSampleViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()

        let b = VerticalLayoutButton()
        b.contentEdgeInsets = UIEdgeInsets(top: 100, left: 20, bottom: 30, right:200)
        b.titleEdgeInsets = UIEdgeInsets(top: 10, left: 30, bottom: 20, right:100)
        b.imageEdgeInsets = UIEdgeInsets(top: 20, left: 100, bottom: 10, right:50)
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

