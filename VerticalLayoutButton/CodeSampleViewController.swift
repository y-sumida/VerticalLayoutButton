//
//  CodeSampleViewController.swift
//  VerticalLayoutButton
//
//  Created by Yuki Sumida on 2018/01/16.
//  Copyright © 2018年 Yuki Sumida. All rights reserved.
//

import UIKit

class CodeSampleViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        addSampleButtons()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    func addSampleButtons() {
        let button1 = createButton(label: "Button", fontSize: 20.0)
        self.view.addSubview(button1)
        button1.translatesAutoresizingMaskIntoConstraints = false
        button1.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        button1.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 42).isActive = true

    }

    func createButton(label: String?="Button", fontSize: CGFloat=15, image:String?="setting") -> VerticalLayoutButton {
        let defaultColor = UIColor(red: 0, green: 0.48, blue: 1, alpha: 1)
        let hilightedColor = UIColor(red: 0, green: 0.48, blue: 1, alpha: 0.4)
        let button = VerticalLayoutButton()
        if let label = label {
            button.setTitle(label, for: .normal)
            button.titleLabel?.font = UIFont.systemFont(ofSize: fontSize)
            button.setTitleColor(defaultColor, for: .normal)
            button.setTitleColor(hilightedColor, for: .highlighted)
        }
        if let image = image {
            button.setImage(UIImage(named: image)?.withRenderingMode(.alwaysTemplate), for: .normal)
            button.tintColor = defaultColor
        }
        button.backgroundColor = UIColor(red: 0.84, green: 0.84, blue: 0.84, alpha: 1)

        return button
    }
}
