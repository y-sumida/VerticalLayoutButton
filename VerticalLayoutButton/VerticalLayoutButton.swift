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

    override func draw(_ rect: CGRect) {
        super.draw(rect)

        self.contentVerticalAlignment = .top
        self.contentHorizontalAlignment = .left
        // アイコンとラベルを縦に並べてセンタリング
        self.titleLabel?.sizeToFit()
        let labelWidth = self.titleLabel!.frame.size.width
        let labelHeight = self.titleLabel!.frame.size.height
        let imageWidth = self.imageView?.frame.size.width ?? 0
        let imageHeight = self.imageView?.frame.size.height ?? 0

        // imageEdgeInsets
        self.imageEdgeInsets = UIEdgeInsets(top: 8, left: 8, bottom: 0, right: 0)

        // titleEdgeInsets
        self.titleEdgeInsets = UIEdgeInsets(top: imageHeight + 8, left: -1.0 * imageWidth, bottom: 0, right: 0)

        // contentEdgeInsets
        let bottomInset = (labelHeight + imageHeight) - rect.height
        self.contentEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: bottomInset, right: -1.0 * (rect.size.width - labelWidth))
    }
}
