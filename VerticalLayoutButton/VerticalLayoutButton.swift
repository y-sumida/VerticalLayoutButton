//
//  VerticalLayoutButton.swift
//  VerticalLayoutButton
//
//  Created by Yuki Sumida on 2017/12/13.
//  Copyright © 2017年 Yuki Sumida. All rights reserved.
//

import UIKit

class VerticalLayoutButton: UIButton {
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        resetInsets()
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        resetInsets()
    }

    override func draw(_ rect: CGRect) {
        super.draw(rect)
        // 制約で幅高さが決まってない場合imageとlabelによってrectが決まる
        // 幅高さ指定がある場合は、image/labelと関係なくrectが決まる

        self.contentVerticalAlignment = .top
        self.contentHorizontalAlignment = .left

        // アイコンとラベルを縦に並べてセンタリング
        var labelWidth: CGFloat = 0.0
        var labelHeight: CGFloat = 0.0
        if let _ = self.titleLabel?.text {
            self.titleLabel?.sizeToFit()
            labelWidth = self.titleLabel?.frame.size.width ?? 0
            labelHeight = self.titleLabel?.frame.size.height ?? 0
        }

        var imageWidth: CGFloat = 0.0
        var imageHeight: CGFloat = 0.0
        if let _ = self.imageView?.image {
            imageWidth = self.imageView?.frame.size.width ?? 0
            imageHeight = self.imageView?.frame.size.height ?? 0
        }
        let diffWidth = abs(imageWidth - labelWidth)

        let baseWidth = (labelWidth + imageWidth).rounded(.up)

        var imageLeftInset:CGFloat = 0.0
        var labelLeftInset:CGFloat = 0.0
        var contentTopInset: CGFloat = 0.0
        var contentBottomInset: CGFloat = 0.0
        var contentLeftInset: CGFloat = 0.0
        var contentRightInset: CGFloat = 0.0

        switch (imageWidth, labelWidth) {
        case (0, _), (_, 0):
            // タイトル、アイコンが揃ってなかったら何もしない
            return
        case (let imageWidth, let labelWidth) where imageWidth < labelWidth:
            imageLeftInset = diffWidth / 2
            labelLeftInset = -1.0 * imageWidth
            if baseWidth < rect.width {
                contentLeftInset = (rect.size.width - labelWidth) / 2
                contentRightInset = -1.0 * contentLeftInset
            } else {
                contentLeftInset = 0
                contentRightInset = -1.0 * (rect.size.width - labelWidth)
            }
        case (let imageWidth, let labelWidth) where imageWidth >= labelWidth:
            labelLeftInset = -1.0 * (labelWidth + diffWidth / 2)
            if baseWidth < rect.width {
                contentLeftInset = (rect.size.width - imageWidth) / 2
                contentRightInset = -1.0 * contentLeftInset
            } else {
                contentLeftInset = 0
                contentRightInset = -1.0 * (rect.size.width - imageWidth)
            }
        case (_, _):
            break
        }

        // 高さ制約ありの場合の対応
        if (labelHeight + imageHeight) < rect.height {
            contentTopInset = (rect.height - (labelHeight + imageHeight)) / 2
            contentBottomInset = (rect.height - (labelHeight + imageHeight)) / 2
        } else {
            contentTopInset = 0
            contentBottomInset = (labelHeight + imageHeight) - rect.height
        }

        // imageEdgeInsets
        self.imageEdgeInsets = UIEdgeInsets(top: 0, left: imageLeftInset, bottom: 0, right: 0)

        // titleEdgeInsets
        self.titleEdgeInsets = UIEdgeInsets(top: imageHeight, left: labelLeftInset, bottom: 0, right: 0)

        // contentEdgeInsets
        self.contentEdgeInsets = UIEdgeInsets(top: contentTopInset, left: contentLeftInset, bottom: contentBottomInset, right: contentRightInset)
    }

    private func resetInsets() {
        self.contentEdgeInsets = UIEdgeInsets.zero
        self.titleEdgeInsets = UIEdgeInsets.zero
        self.imageEdgeInsets = UIEdgeInsets.zero
    }
}
