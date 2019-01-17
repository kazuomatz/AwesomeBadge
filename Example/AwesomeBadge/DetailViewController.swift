//
//  DetailViewController.swift
//  AwesomeBadge
//
//  Created by kazuomatz on 2019/01/17.
//  Copyright © 2019 kazuomatz. All rights reserved.
//

import UIKit
import AwesomeBadge

class DetailViewController: UIViewController {
    
    public var badgeData:Dictionary<String,Any>?
    @IBOutlet weak var containerView:UIView!
    
    //MARK:- View life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        var rect = self.containerView.frame
        rect.origin.x = 0
        rect.origin.y = 0
        
        let badgeView = AwesomeBadgeView(
            fontStyle: badgeData?["style"] as! AwesomeBadgeView.FontStyle,
            fontName: badgeData?["fontName"] as! String,
            frame: rect,
            backgroundColor:badgeData?["color"] as! String
        )
        self.containerView.addSubview(badgeView)
    }
    
    //MARK:- Dismiss View Controller
    @IBAction func onClose(_ sender: Any) {
        self.dismiss(animated: true)
    }
}
