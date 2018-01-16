//
//  TopViewController.swift
//  VerticalLayoutButton
//
//  Created by Yuki Sumida on 2018/01/16.
//  Copyright © 2018年 Yuki Sumida. All rights reserved.
//

import UIKit

class TopViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func tapStoryBoardSample(_ sender: Any) {
        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "StoryBoardSampleViewController") as! StoryBoardSampleViewController
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
