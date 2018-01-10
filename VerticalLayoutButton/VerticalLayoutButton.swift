//
//  VerticalLayoutButton.swift
//  VerticalLayoutButton
//
//  Created by Yuki Sumida on 2017/12/13.
//  Copyright © 2017年 Yuki Sumida. All rights reserved.
//

import UIKit

class VerticalLayoutButton: UIButton {
    private var _contentEdgeInsets: UIEdgeInsets = UIEdgeInsets.zero
    private var _titleEdgeInsets: UIEdgeInsets = UIEdgeInsets.zero
    private var _imageEdgeInsets: UIEdgeInsets = UIEdgeInsets.zero
    var verticalMargin: CGFloat = 0.0
    var horizontalMargin: CGFloat = 0.0

    override var contentEdgeInsets: UIEdgeInsets {
        get {
            return _contentEdgeInsets
        }
        set {
            // ignore user settings
        }
    }
    override var titleEdgeInsets: UIEdgeInsets {
        get {
            return _titleEdgeInsets
        }
        set {
            // ignore user settings
        }
    }
    override var imageEdgeInsets: UIEdgeInsets {
        get {
            return _imageEdgeInsets
        }
        set {
            // ignore user settings
        }
    }

    override func draw(_ rect: CGRect) {
        super.draw(rect)

        self.contentVerticalAlignment = .top
        self.contentHorizontalAlignment = .left

        self.titleLabel?.sizeToFit()
        let labelSize = self.titleLabel?.frame.size ?? CGSize.zero
        let imageSize = self.imageView?.frame.size ?? CGSize.zero

        let diffWidth = abs(imageSize.width - labelSize.width)

        var imageLeftInset:CGFloat = 0.0
        var labelLeftInset:CGFloat = 0.0
        var contentTopInset: CGFloat = 0.0
        var contentBottomInset: CGFloat = 0.0
        var contentLeftInset: CGFloat = 0.0
        var contentRightInset: CGFloat = 0.0

        var contentWidth: CGFloat = 0.0

        if imageSize.width < labelSize.width {
            imageLeftInset = diffWidth / 2
            labelLeftInset = -1.0 * imageSize.width
            contentWidth = labelSize.width
        } else {
            labelLeftInset = -1.0 * (labelSize.width + diffWidth / 2)
            contentWidth = imageSize.width
        }

        let contentFitSize = CGSize(width: (labelSize.width + imageSize.width).rounded(.up), height: (labelSize.height + imageSize.height).rounded(.up))
        if contentFitSize.width < rect.width {
            contentLeftInset = (rect.width - contentWidth) / 2
            contentRightInset = -1.0 * contentLeftInset
        } else {
            contentLeftInset = horizontalMargin
            contentRightInset = -1.0 * (rect.width - contentWidth) + horizontalMargin
        }

        if contentFitSize.height < rect.height {
            contentTopInset = (rect.height - contentFitSize.height) / 2
            contentBottomInset = contentTopInset
        } else {
            contentTopInset = verticalMargin
            contentBottomInset = contentFitSize.height - rect.height + verticalMargin
        }

        self._imageEdgeInsets = UIEdgeInsets(top: 0, left: imageLeftInset, bottom: 0, right: 0)
        super.imageEdgeInsets = self._imageEdgeInsets

        self._titleEdgeInsets = UIEdgeInsets(top: imageSize.height, left: labelLeftInset, bottom: 0, right: 0)
        super.titleEdgeInsets = self._titleEdgeInsets

        self._contentEdgeInsets = UIEdgeInsets(top: contentTopInset, left: contentLeftInset, bottom: contentBottomInset, right: contentRightInset)
        super.contentEdgeInsets = self._contentEdgeInsets
    }
}
