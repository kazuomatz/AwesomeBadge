//
//  DetailViewController.swift
//  AwesomeBadge
//
//  Created by kazuomatz on 2019/01/17.
//  Copyright © 2019 kazuomatz. All rights reserved.
//

import Foundation
import UIKit
import FontAwesome_swift

//MARK:- UIColor Extention
extension UIColor {
    func lighter(by percentage:CGFloat=30.0) -> UIColor? {
        return self.adjust(by: abs(percentage) )
    }
    func darker(by percentage:CGFloat=30.0) -> UIColor? {
        return self.adjust(by: -1 * abs(percentage) )
    }
    func adjust(by percentage:CGFloat=30.0) -> UIColor? {
        var r:CGFloat=0, g:CGFloat=0, b:CGFloat=0, a:CGFloat=0;
        if(self.getRed(&r, green: &g, blue: &b, alpha: &a)){
            return UIColor(red: min(r + percentage/100, 1.0),
                           green: min(g + percentage/100, 1.0),
                           blue: min(b + percentage/100, 1.0),
                           alpha: a)
        }
        else{
            return nil
        }
    }
    convenience init(hex: String, alpha: CGFloat) {
        let v = hex.map { String($0) } + Array(repeating: "0", count: max(6 - hex.count, 0))
        let r = CGFloat(Int(v[0] + v[1], radix: 16) ?? 0) / 255.0
        let g = CGFloat(Int(v[2] + v[3], radix: 16) ?? 0) / 255.0
        let b = CGFloat(Int(v[4] + v[5], radix: 16) ?? 0) / 255.0
        self.init(red: r, green: g, blue: b, alpha: min(max(alpha, 0), 1))
    }
    
    convenience init(hex: String) {
        self.init(hex: hex, alpha: 1.0)
    }
}

//MARK:- UIColor Extention
public class AwesomeBadgeView:UIView {
    
    //MARK:- Font Style Enum
    public enum FontStyle: String {
        case solid = "solid"
        case regular = "regular"
        case brands = "brands"
    }
    
    
    //MARK:- Initializers
    required init?(coder aDecoder: NSCoder) {
        super.init(coder:aDecoder)
    }
    
    public init(fontStyle:FontStyle, fontName:String, frame:CGRect, backgroundColor:String, gradient:Bool = true, foregroundColor:String = "ffffff") {
        super.init(frame: frame)
        self.drawBadge(fontStyle: fontStyle, fontName: fontName, radius: frame.size.width, backgroundColor: backgroundColor, gradient: gradient,foregroundColor: foregroundColor)
    }
    
    
    //MARK:- genarate BadgeView
    public func drawBadge(fontStyle:FontStyle ,fontName:String, radius:CGFloat, backgroundColor:String, gradient:Bool = true, foregroundColor:String = "ffffff") {
        
        // clear all subviews.
        self.subviews.forEach { (view) in
            view.removeFromSuperview()
        }
        
        self.backgroundColor = UIColor(hex: backgroundColor)
        self.clipsToBounds = true
        self.backgroundColor = .clear
        self.frame = CGRect(x: self.frame.origin.x, y: self.frame.origin.y, width: radius, height: radius)
        
        // Border(Badge Eddge)
        let boderWidth:CGFloat = radius * 0.08
        let backgroundView:UIView = UIView(frame:self.frame)
        
        // Border(Badge Eddge) Color is 20% Darker
        backgroundView.backgroundColor = UIColor(hex: backgroundColor).darker(by: 20)
        backgroundView.layer.cornerRadius = radius / 2
        
        // Badge Background View
        let badgeBackgroundViewFrame = CGRect(x: boderWidth, y: boderWidth,width: radius - boderWidth * 2, height: radius - boderWidth * 2)
        let badgeBackgroundView = UIView(frame: badgeBackgroundViewFrame)
        badgeBackgroundView.layer.cornerRadius = (radius - boderWidth * 2) / 2
        badgeBackgroundView.clipsToBounds = true
        badgeBackgroundView.backgroundColor = UIColor(hex: backgroundColor)
        
        // add Geradient Layer (if needs)
        if gradient {
            let color = UIColor(hex: backgroundColor)
            let gradientLayer:CAGradientLayer = CAGradientLayer(layer: badgeBackgroundView.layer)
            gradientLayer.frame = badgeBackgroundView.bounds
            gradientLayer.colors = [
                color.lighter(by:60)?.cgColor as Any,
                color.cgColor  as Any,
                color.darker(by:30)?.cgColor as Any
            ]
            gradientLayer.cornerRadius = (radius - boderWidth * 2) / 2
            badgeBackgroundView.layer.addSublayer(gradientLayer)
        }
        
        // Generate Image from FontAwesome
        let iconSize = CGSize(width: radius - boderWidth * 4, height: radius - boderWidth * 4)
        let imageView:UIImageView = UIImageView(frame:CGRect(x:0,y:0,width:radius - boderWidth * 2, height:radius - boderWidth * 2))
        imageView.contentMode = .center
        
        let faFontName = FontAwesomeIcons[fontName]
        if  faFontName != nil {
            let image = UIImage.fontAwesomeIcon(name: FontAwesome(rawValue: faFontName!)!, style: FontAwesomeStyle(rawValue: fontStyle.rawValue)!, textColor: UIColor(hex:foregroundColor), size: iconSize)
            imageView.image = image
            imageView.backgroundColor = .clear
            imageView.layer.cornerRadius = (radius - boderWidth * 2) / 2
        }
        badgeBackgroundView.addSubview(imageView)
        backgroundView.addSubview(badgeBackgroundView)
        self.addSubview(backgroundView)
    }
}

