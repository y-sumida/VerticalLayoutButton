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

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
    }

    override func draw(_ rect: CGRect) {
        super.draw(rect)

        self.contentVerticalAlignment = .top
        self.contentHorizontalAlignment = .left

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
        let baseHeight = (labelHeight + imageHeight).rounded(.up)

        var imageLeftInset:CGFloat = 0.0
        var labelLeftInset:CGFloat = 0.0
        var contentTopInset: CGFloat = 0.0
        var contentBottomInset: CGFloat = 0.0
        var contentLeftInset: CGFloat = 0.0
        var contentRightInset: CGFloat = 0.0

        var contentWidth: CGFloat = 0.0

        switch (imageWidth, labelWidth) {
        case (let imageWidth, let labelWidth) where imageWidth < labelWidth:
            imageLeftInset = diffWidth / 2
            labelLeftInset = -1.0 * imageWidth
            contentWidth = labelWidth
        case (let imageWidth, let labelWidth) where imageWidth >= labelWidth:
            labelLeftInset = -1.0 * (labelWidth + diffWidth / 2)
            contentWidth = imageWidth
        case (_, _):
            break
        }

        if baseWidth < rect.width {
            contentLeftInset = (rect.width - contentWidth) / 2
            contentRightInset = -1.0 * contentLeftInset
        } else {
            contentLeftInset = horizontalMargin
            contentRightInset = -1.0 * (rect.width - contentWidth) + horizontalMargin
        }

        if baseHeight < rect.height {
            contentTopInset = (rect.height - baseHeight) / 2
            contentBottomInset = contentTopInset
        } else {
            contentTopInset = verticalMargin
            contentBottomInset = baseHeight - rect.height + verticalMargin
        }

        self._imageEdgeInsets = UIEdgeInsets(top: 0, left: imageLeftInset, bottom: 0, right: 0)
        super.imageEdgeInsets = self._imageEdgeInsets

        self._titleEdgeInsets = UIEdgeInsets(top: imageHeight, left: labelLeftInset, bottom: 0, right: 0)
        super.titleEdgeInsets = self._titleEdgeInsets

        self._contentEdgeInsets = UIEdgeInsets(top: contentTopInset, left: contentLeftInset, bottom: contentBottomInset, right: contentRightInset)
        super.contentEdgeInsets = self._contentEdgeInsets
    }
}
