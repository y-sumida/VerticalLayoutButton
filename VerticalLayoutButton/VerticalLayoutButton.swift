//
//  VerticalLayoutButton.swift
//  VerticalLayoutButton
//
//  Created by Yuki Sumida on 2017/12/13.
//  Copyright © 2017年 Yuki Sumida. All rights reserved.
//

import UIKit

final class VerticalLayoutButton: UIButton {
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

        var layoutedSize: CGSize = CGSize.zero

        if imageSize.width < labelSize.width {
            imageLeftInset = diffWidth / 2
            labelLeftInset = -1.0 * imageSize.width
            layoutedSize = CGSize(width: labelSize.width, height: (labelSize.height + imageSize.height).rounded(.up))
        } else {
            labelLeftInset = -1.0 * (labelSize.width + diffWidth / 2)
            layoutedSize = CGSize(width: imageSize.width, height: (labelSize.height + imageSize.height).rounded(.up))
        }

        var contentLeftInset: CGFloat = 0.0
        var contentRightInset: CGFloat = 0.0
        let defaultWidth = (labelSize.width + imageSize.width).rounded(.up)
        if defaultWidth < rect.width {
            contentLeftInset = (rect.width - layoutedSize.width) / 2
            contentRightInset = -1.0 * contentLeftInset
        } else if layoutedSize.width <= rect.width {
            contentLeftInset = horizontalMargin
            contentRightInset = -1.0 * (rect.width - layoutedSize.width) + horizontalMargin
        } else {
            // TODO refactor
            imageLeftInset = 0.0
            labelLeftInset = 0.0
        }

        var contentTopInset: CGFloat = 0.0
        var contentBottomInset: CGFloat = 0.0
        if layoutedSize.height < rect.height {
            contentTopInset = (rect.height - layoutedSize.height) / 2
            contentBottomInset = contentTopInset
        } else {
            contentTopInset = verticalMargin
            contentBottomInset = layoutedSize.height - rect.height + verticalMargin
        }

        self._imageEdgeInsets = UIEdgeInsets(top: 0, left: imageLeftInset, bottom: 0, right: 0)
        super.imageEdgeInsets = self._imageEdgeInsets

        self._titleEdgeInsets = UIEdgeInsets(top: imageSize.height, left: labelLeftInset, bottom: 0, right: 0)
        super.titleEdgeInsets = self._titleEdgeInsets

        self._contentEdgeInsets = UIEdgeInsets(top: contentTopInset, left: contentLeftInset, bottom: contentBottomInset, right: contentRightInset)
        super.contentEdgeInsets = self._contentEdgeInsets
    }
}
