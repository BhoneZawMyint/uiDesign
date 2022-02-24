//
//  Extension.swift
//  uiDesign
//
//  Created by Macbook on 2/23/22.
//

import Foundation
import UIKit

extension UIView {
    func addDashBorder() {
        let color = UIColor.black.cgColor

        let shapeLayer:CAShapeLayer = CAShapeLayer()

        let frameSize = self.frame.size
        let shapeRect = CGRect(x: 0, y: 0, width: frameSize.width, height: frameSize.height)

        shapeLayer.bounds = shapeRect
        shapeLayer.name = "DashBorder"
        shapeLayer.position = CGPoint(x: frameSize.width/2, y: frameSize.height/2)
        shapeLayer.fillColor = UIColor.clear.cgColor
        shapeLayer.strokeColor = color
        shapeLayer.lineWidth = 1.5
        shapeLayer.lineJoin = .round
        shapeLayer.lineDashPattern = [2,4]
        shapeLayer.path = UIBezierPath(roundedRect: shapeRect, cornerRadius: 0).cgPath
        self.layer.masksToBounds = false
        self.layer.addSublayer(shapeLayer)
    }
}
