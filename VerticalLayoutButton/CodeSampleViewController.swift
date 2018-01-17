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

        let button2 = createButton(label: "B", fontSize: 15.0)
        self.view.addSubview(button2)
        button2.translatesAutoresizingMaskIntoConstraints = false
        button2.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        button2.topAnchor.constraint(equalTo: button1.bottomAnchor, constant: 20).isActive = true

        let button3 = createButton(label: "Button", fontSize: 9.0)
        self.view.addSubview(button3)
        button3.translatesAutoresizingMaskIntoConstraints = false
        button3.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        button3.topAnchor.constraint(equalTo: button2.bottomAnchor, constant: 20).isActive = true

        let button4 = createButton(label: "Button", fontSize: 15.0)
        self.view.addSubview(button4)
        button4.translatesAutoresizingMaskIntoConstraints = false
        button4.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        button4.topAnchor.constraint(equalTo: button3.bottomAnchor, constant: 20).isActive = true
        button4.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor, constant: 30).isActive = true
        button4.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor, constant: -30).isActive = true

        let button5 = createButton(label: "Button", fontSize: 15.0)
        self.view.addSubview(button5)
        button5.translatesAutoresizingMaskIntoConstraints = false
        button5.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        button5.topAnchor.constraint(equalTo: button4.bottomAnchor, constant: 20).isActive = true
        button5.widthAnchor.constraint(equalToConstant: 30).isActive = true

        let button6 = createButton(image: nil)
        self.view.addSubview(button6)
        button6.translatesAutoresizingMaskIntoConstraints = false
        button6.topAnchor.constraint(equalTo: button5.bottomAnchor, constant: 20).isActive = true
        button6.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor, constant: 164).isActive = true

        let button7 = createButton(label: nil)
        self.view.addSubview(button7)
        button7.translatesAutoresizingMaskIntoConstraints = false
        button7.topAnchor.constraint(equalTo: button6.bottomAnchor, constant: 20).isActive = true
        button7.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor, constant: 164).isActive = true
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
