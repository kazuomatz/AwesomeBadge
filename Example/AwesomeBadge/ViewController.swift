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
    
    //Sample Data
    let badgeData: [Dictionary<String,Any>] =  [
        ["fontName": "fa-bus-alt", "color": "4C9900", "style": AwesomeBadgeView.FontStyle.solid ],
        ["fontName": "fa-grin", "color": "FFFF00", "style": AwesomeBadgeView.FontStyle.solid ],
        ["fontName": "fa-grin-hearts", "color": "FF99CC", "style": AwesomeBadgeView.FontStyle.solid ],
        ["fontName": "fa-paw", "color": "663300", "style": AwesomeBadgeView.FontStyle.solid ],
        ["fontName": "fa-trophy", "color": "999900", "style": AwesomeBadgeView.FontStyle.solid ],
        ["fontName": "fa-stroopwafel", "color": "66B2FF", "style": AwesomeBadgeView.FontStyle.solid ],
        ["fontName": "fa-dollar-sign", "color": "006666", "style": AwesomeBadgeView.FontStyle.solid ],
        ["fontName": "fa-seedling", "color": "66CC00", "style": AwesomeBadgeView.FontStyle.solid ],
        ["fontName": "fa-bug", "color": "A0A0A0", "style": AwesomeBadgeView.FontStyle.solid ],
        ["fontName": "fa-tv", "color": "330066", "style": AwesomeBadgeView.FontStyle.solid ],
        ["fontName": "fa-lightbulb", "color": "FFFF00", "style": AwesomeBadgeView.FontStyle.solid ],
        ["fontName": "fa-book-dead", "color": "000000", "style": AwesomeBadgeView.FontStyle.solid ],
        ["fontName": "fa-gem", "color": "CC342D", "style": AwesomeBadgeView.FontStyle.solid ],
        ["fontName": "fa-user-astronaut", "color": "000033", "style": AwesomeBadgeView.FontStyle.solid ],
        ["fontName": "fa-cloud-sun", "color": "FF8000", "style": AwesomeBadgeView.FontStyle.solid ],
        ["fontName": "fa-github", "color": "000000", "style": AwesomeBadgeView.FontStyle.brands ],
        ["fontName": "fa-aws", "color": "ff9900", "style": AwesomeBadgeView.FontStyle.brands ],
        ["fontName": "fa-jenkins", "color": "000000", "style": AwesomeBadgeView.FontStyle.brands ],
        ["fontName": "fa-twitter", "color": "1da1f2", "style": AwesomeBadgeView.FontStyle.brands ],
        ["fontName": "fa-docker", "color": "007bff", "style": AwesomeBadgeView.FontStyle.brands ],
        ]
    
    @IBOutlet weak var collectionView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.collectionView.delegate = self
        self.collectionView.dataSource = self
    }
    
    private var selectedIndex:Int = 0
    
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
        badgeView.showBadge(
            fontStyle: badgeData[indexPath.item]["style"] as! AwesomeBadgeView.FontStyle,
            fontName:badgeData[indexPath.item]["fontName"] as! String ,
            radius: self.collectionView.frame.size.width / 4 - 10,
            backgroundColor: badgeData[indexPath.item]["color"] as! String,
            gradient: false)
        return cell
        
    }
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        self.selectedIndex = indexPath.item
        performSegue(withIdentifier: "presentDetail", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "presentDetail") {
            let detailViewController: DetailViewController = (segue.destination as? DetailViewController)!
            detailViewController.modalTransitionStyle = .crossDissolve
            detailViewController.badgeData = self.badgeData[selectedIndex]
        }
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

