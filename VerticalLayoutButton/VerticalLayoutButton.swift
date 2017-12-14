//
//  VerticalLayoutButton.swift
//  VerticalLayoutButton
//
//  Created by Yuki Sumida on 2017/12/13.
//  Copyright © 2017年 Yuki Sumida. All rights reserved.
//

import UIKit

class VerticalLayoutButton: UIButton {
    override var intrinsicContentSize: CGSize {
        let size = super.intrinsicContentSize
        let adjustedWidth = size.width + contentEdgeInsets.left + contentEdgeInsets.right
        let adjustedHeight = size.height + contentEdgeInsets.top + contentEdgeInsets.bottom

        return CGSize(width: adjustedWidth, height: adjustedHeight)
    }
}
