//
//  ViewController.swift
//  TextLayoutDemo
//
//  Created by Gao on 24/06/2017.
//  Copyright © 2017 leave. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = color(216,216,216)

        func getAlabel(attributedString:NSAttributedString) -> UILabel {

            let label = UILabel()
            label.attributedText = attributedString
            label.numberOfLines = 0
            label.backgroundColor = color(148, 233, 124, alpha: 0.45)
            return label
        }

        func attribtuedString(from text:String, fontSize:CGFloat, lineHeightMultiple:CGFloat) -> NSAttributedString {
            let font = UIFont.systemFont(ofSize: fontSize)
            let style = NSMutableParagraphStyle()
            let finalHeight = ceilToPixel(font.lineHeight * lineHeightMultiple)
            style.lineSpacing = finalHeight - font.lineHeight
            return NSAttributedString(string: text, attributes: [
                NSFontAttributeName: font,
                NSForegroundColorAttributeName: UIColor.black,
                NSParagraphStyleAttributeName: style
                ])
        }

        let text = "Hello World\nI’m so\nhungry"

        let labels = [
            (15, 1.2),
            (30, 1.2),
            (80, 1.5)
            ].map { (fontSize:CGFloat, m: CGFloat) -> UILabel in
            let attributedString = attribtuedString(from: text, fontSize: fontSize, lineHeightMultiple: m)
            return getAlabel(attributedString: attributedString)
        }


        // layout

        labels.enumerated().forEach { (index, label) in
            self.view.addSubview(label)
            label.translatesAutoresizingMaskIntoConstraints = false
            let top = label.topAnchor.constraint(equalTo: self.view.topAnchor)
            let left = label.leftAnchor.constraint(equalTo: self.view.leftAnchor)
            self.view.addConstraints([top,left])
            switch index {
            case 0: top.constant = 0
            case 1: top.constant = 80
            case 2: top.constant = 250
            case _: ()
            }
        }



    }


    override var prefersStatusBarHidden: Bool {
        return true
    }
}

func color(_ r: CGFloat, _ g: CGFloat, _ b: CGFloat, alpha: CGFloat = 1 ) -> UIColor {
    return UIColor(red: r/255, green: g/255, blue: b/255, alpha: alpha)

}

func ceilToPixel(_ f:CGFloat) -> CGFloat {
    return ceil(f * 2) / 2
}
