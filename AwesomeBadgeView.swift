import Foundation
import UIKit
import FontAwesome_swift

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
        }else{
            return nil
        }
    }
}


public class AwesomeBadgeView:UIView {
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder:aDecoder)
    }

    public init(fontStyle:FontAwesomeStyle, fontName:FontAwesome, frame:CGRect, backgroundColor:UIColor, gradient:Bool = true, foregroundColor:UIColor = .white) {
        super.init(frame: frame)
        self.showBadge(fontStyle: fontStyle, fontName: fontName, radius: frame.size.width, backgroundColor: backgroundColor, gradient: gradient,foregroundColor: foregroundColor)
    }
    
    public func showBadge(fontStyle:FontAwesomeStyle ,fontName:FontAwesome, radius:CGFloat, backgroundColor:UIColor, gradient:Bool = true, foregroundColor:UIColor = .white) {
        
        self.subviews.forEach { (view) in
            view.removeFromSuperview()
        }
        self.backgroundColor = backgroundColor
        self.clipsToBounds = true
        self.backgroundColor = .clear
        
        self.frame = CGRect(x: self.frame.origin.x, y: self.frame.origin.y, width: radius, height: radius)
        
        let boderWidth:CGFloat = radius * 0.08

        let backgroundView:UIView = UIView(frame:self.frame)
        backgroundView.backgroundColor = backgroundColor.darker(by: 20)
        backgroundView.layer.cornerRadius = radius / 2
        
        let badgeBackgroundViewFrame = CGRect(x: boderWidth, y: boderWidth,width: radius - boderWidth * 2, height: radius - boderWidth * 2)
        let badgeBackgroundView = UIView(frame: badgeBackgroundViewFrame)
        badgeBackgroundView.layer.cornerRadius = (radius - boderWidth * 2) / 2
        badgeBackgroundView.clipsToBounds = true
        
        if gradient {
            let gradient:CAGradientLayer = CAGradientLayer(layer: badgeBackgroundView.layer)
            gradient.frame = badgeBackgroundView.bounds
            gradient.colors = [
                backgroundColor.lighter(by:60)?.cgColor as Any,
                backgroundColor.cgColor  as Any,
                backgroundColor.darker(by:30)?.cgColor as Any
            ]
            gradient.cornerRadius = (radius - boderWidth * 2) / 2
            badgeBackgroundView.layer.addSublayer(gradient)
        }
        
        let imageView:UIImageView = UIImageView(frame:CGRect(x:0,y:0,width:radius - boderWidth * 2, height:radius - boderWidth * 2))
        imageView.contentMode = .center

        let iconSize = CGSize(width: radius - boderWidth * 2 - 10, height: radius - boderWidth * 2 - 10)
        let image = UIImage.fontAwesomeIcon(name: fontName, style: fontStyle, textColor: foregroundColor, size: iconSize)
        imageView.image = image
        imageView.backgroundColor = .clear
        imageView.layer.cornerRadius = (radius - boderWidth * 2) / 2
        
        badgeBackgroundView.addSubview(imageView)
        backgroundView.addSubview(badgeBackgroundView)
        self.addSubview(backgroundView)

    }
    
    
}
