//
//  cellTableViewCell.swift
//  repCount
//
//  Created by Anton Samuilov on 21/10/2020.
//

import UIKit

class cellTableViewCell: UITableViewCell {

    var actionBlock: (() -> Void)? = nil

    @IBOutlet weak var label: UILabel!
    
    @IBOutlet weak var cellView: UIView!
    @IBOutlet weak var weightLabel: UILabel!
    
    @IBOutlet weak var setsLabel: UILabel!
    @IBOutlet weak var repsLabel: UILabel!
    
}


//extension UIView {
//    func addShadow(){
//        self.layer.shadowColor = UIColor.black.cgColor
//        self.layer.shadowOpacity = 0.5
//        self.layer.shadowRadius = 2.0
//        self.layer.shadowOffset = CGSize(width: 1.0,height: 1.0)
//    }
//}

//extension UITableViewCell {
//    func addShadow(backgroundColor: UIColor = .white, cornerRadius: CGFloat = 12, shadowRadius: CGFloat = 5, shadowOpacity: Float = 0.1, shadowPathInset: (dx: CGFloat, dy: CGFloat), shadowPathOffset: (dx: CGFloat, dy: CGFloat)) {
//        layer.cornerRadius = cornerRadius
//        layer.masksToBounds = true
//        layer.shadowColor = UIColor.black.cgColor
//        layer.shadowOffset = CGSize(width: 0.0, height: 0.0)
//        layer.shadowRadius = shadowRadius
//        layer.shadowOpacity = shadowOpacity
//        layer.shadowPath = UIBezierPath(roundedRect: bounds.insetBy(dx: shadowPathInset.dx, dy: shadowPathInset.dy).offsetBy(dx: shadowPathOffset.dx, dy: shadowPathOffset.dy), byRoundingCorners: .allCorners, cornerRadii: CGSize(width: cornerRadius, height: cornerRadius)).cgPath
//        layer.shouldRasterize = true
//        layer.rasterizationScale = UIScreen.main.scale
//        
//        let whiteBackgroundView = UIView()
//        whiteBackgroundView.backgroundColor = backgroundColor
//        whiteBackgroundView.layer.cornerRadius = cornerRadius
//        whiteBackgroundView.layer.masksToBounds = true
//        whiteBackgroundView.clipsToBounds = false
//        
//        whiteBackgroundView.frame = bounds.insetBy(dx: shadowPathInset.dx, dy: shadowPathInset.dy)
//        insertSubview(whiteBackgroundView, at: 0)
//    }
//}


