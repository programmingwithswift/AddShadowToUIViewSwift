//
//  ViewController.swift
//  ShadowView
//
//  Created by ProgrammingWithSwift on 2019/12/04.
//  Copyright © 2019 ProgrammingWithSwift. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addSubview(self.newView())
    }
    
    private func newView() -> UIView {
        let view = UIView(frame: CGRect(x: 100,
                                        y: 100,
                                        width: 100,
                                        height: 100))
        view.backgroundColor = .blue
        view.layer.shadowOffset = CGSize(width: 10,
                                         height: 10)
        view.layer.shadowRadius = 5
        view.layer.shadowOpacity = 0.3
        view.layer.shadowPath = self.customShadowPath(viewLayer: view.layer,
                                                      shadowHeight: 5).cgPath
        
        return view
    }
    
    private func customShadowPath(viewLayer layer: CALayer,
                                  shadowHeight: CGFloat) -> UIBezierPath {
        let layerX = layer.bounds.origin.x
        let layerY = layer.bounds.origin.y
        let layerWidth = layer.bounds.size.width
        let layerHeight = layer.bounds.size.height
        
        let path = UIBezierPath()
        path.move(to: CGPoint.zero)
        
        path.addLine(to: CGPoint(x: layerX + layerWidth,
                                 y: layerY))
        path.addLine(to: CGPoint(x: layerX + layerWidth,
                                 y: layerHeight + 20))
        
        path.addCurve(to: CGPoint(x: 0,
                                  y: layerHeight),
                      controlPoint1: CGPoint(x: layerX + layerWidth,
                                             y: layerHeight),
                      controlPoint2: CGPoint(x: layerX,
                                             y: layerHeight))
        
        return path
    }
}

/*
 
 
 view.layer.shadowOffset = CGSize(width: 10,
                                  height: 10)
 view.layer.shadowRadius = 5
 view.layer.shadowOpacity = 0.3
 view.layer.shadowPath = CGPath(rect: view.bounds,
                                transform: nil)
 
 */

/*
 
 
 .shadowPath: Specifying an explicit path usually improves rendering performance
 
 Without using shadowPath the layer will use the standard shadow path. If you set a
 shadowPath the layer will draw a shadow based on that path.
 
 Using shadowPath will allow you to have create a shadow with a different shape to the
 layers shape. One can use this to nice effect. Another nice feature of shadowPath is that it will usually
 improve rendering performance.

 
 */
