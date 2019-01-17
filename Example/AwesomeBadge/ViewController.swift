//
//  ViewController.swift
//  AwesomeBadge
//
//  Created by kazuomatz on 2019/01/16.
//  Copyright © 2019 kazuomatz. All rights reserved.
//

import UIKit
import AwesomeBadge


//import FontAwesome_swift

class ViewController: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
    
    let badgeData: [Dictionary<String,Any>] =  [
        ["fontName": "arrowAltCircleUp", "color": UIColor.black ],
        ["fontName": "addressBook", "color":  UIColor.yellow ],
        ["fontName": "addressBook", "color": UIColor.green ],
        ["fontName": "addressBook", "color": UIColor.green ],
        ["fontName": "addressBook", "color": UIColor.green ],
        ["fontName": "addressBook", "color": UIColor.green ],
        ["fontName": "addressBook", "color": UIColor.green ],
        ["fontName": "addressBook", "color": UIColor.green ]
        ]
    
    @IBOutlet weak var collectionView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.collectionView.delegate = self
        self.collectionView.dataSource = self
        
        let radius:CGFloat = 200
        let frame = CGRect(x: CGFloat(UIScreen.main.bounds.size.width / 2.0 - radius / 2.0),
                           y: CGFloat(UIScreen.main.bounds.size.height / 2.0 - radius / 2.0),
                           width: radius,
                           height: radius
        )
        
        let badgeView = AwesomeBadgeView(
            fontStyle: .solid,
            fontName: .addressBook,
            frame: frame,
            backgroundColor: .black)
        self.view.addSubview(badgeView)
        //self.collectionView.isHidden = true
        
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if section == 0 {
            return badgeData.count
        }
        else {
            return 0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell:UICollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "BadgeCell", for: indexPath)
        let badgeView:AwesomeBadgeView = cell.viewWithTag(1) as! AwesomeBadgeView
        badgeView.showBadge(fontStyle: .solid, fontName:badgeData[indexPath.item]["fontName"] as! FontAwesome , radius: self.collectionView.frame.size.width / 4 - 10, backgroundColor: badgeData[indexPath.item]["color"] as! UIColor)
        return cell
        
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let returnSize = CGSize(width: self.collectionView.frame.size.width / 4 - 5 , height: self.collectionView.frame.size.width / 4 - 5 );
        return returnSize
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 5.0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 5.0
    }
    
    
}

