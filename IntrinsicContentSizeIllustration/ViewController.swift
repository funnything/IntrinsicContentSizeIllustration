//
//  ViewController.swift
//  IntrinsicContentSizeIllustration
//
//  Created by Yosaku Toyama on 2018/11/19.
//  Copyright © 2018年 DeNA. All rights reserved.
//

import Cartography
import Then
import UIKit

class ViewController: UIViewController {
    let palette = Palette()

    override func loadView() {
        super.loadView()

        let leftView = UIView().then {
            $0.backgroundColor = palette.nextColor()
            view.addSubview($0)
            constrain($0) { v in
                let sv = v.superview!
                v.leading == sv.leading
                v.top == sv.top
                v.bottom == sv.bottom
            }
        }

        let rightView = UIView().then {
            $0.backgroundColor = palette.nextColor()
            view.addSubview($0)
            constrain($0, leftView) { v, leftView in
                let sv = v.superview!
                v.leading == leftView.trailing
                v.trailing == sv.trailing
                v.top == sv.top
                v.bottom == sv.bottom
                v.width == leftView.width
            }
        }

        constructContentView(leftView, creator: { GoodPaddingLabel() })
        constructContentView(rightView, creator: { BadPaddingLabel() })
    }

    func constructContentView(_ superview: UIView, creator: () -> UILabel) {
        let stackView = UIStackView().then {
            $0.axis = .vertical
            $0.alignment = .center
            $0.spacing = 8
            superview.addSubview($0)
            constrain($0) { v in
                let sv = v.superview!
                v.center == sv.center
            }
        }

        _ = creator().then {
            $0.text = "okipu"
            $0.backgroundColor = palette.nextColor()
            stackView.addArrangedSubview($0)
        }

        _ = creator().then {
            $0.text = "bbzn"
            $0.backgroundColor = palette.nextColor()
            stackView.addArrangedSubview($0)
        }

        _ = creator().then {
            $0.text = "okipu"
            $0.backgroundColor = palette.nextColor()
            stackView.addArrangedSubview($0)
        }
    }
}

class GoodPaddingLabel: UILabel {
    let padding: UIEdgeInsets = UIEdgeInsets(top: 16, left: 16, bottom: 16, right: 16)

    override func drawText(in rect: CGRect) {
        super.drawText(in: rect.inset(by: padding))
    }

    override var intrinsicContentSize: CGSize {
        var contentSize = super.intrinsicContentSize
        contentSize.height += padding.top + padding.bottom
        contentSize.width += padding.left + padding.right
        return contentSize
    }
}

class BadPaddingLabel: UILabel {
    let padding: UIEdgeInsets = UIEdgeInsets(top: 8, left: 8, bottom: 8, right: 8)
    
    override func drawText(in rect: CGRect) {
        super.drawText(in: rect.inset(by: padding))
    }
}
