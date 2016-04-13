//
//  PhotoDetailsViewController.swift
//  Photos
//
//  Created by Amy Wong on 4/10/16.
//  Copyright © 2016 iOS DeCal. All rights reserved.
//

import UIKit

class PhotoDetailsViewController: UIViewController {
    
    @IBOutlet weak var userPhoto: UIImageView!
    @IBOutlet weak var username: UILabel!
    @IBOutlet weak var date: UILabel!
    @IBOutlet weak var likes: UILabel!
    var photoDetail: Photo!
    
    @IBOutlet weak var likeButton: UIButton!
    var numLikes : Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let photoDetail = self.photoDetail{
            let url = NSURL(string: photoDetail.url)
            let data = NSData(contentsOfURL: url!)
            self.userPhoto.image = UIImage(data: data!)
            userPhoto = UIImageView(frame:CGRectMake(0, 0, 100, 100))
            self.likes.text = String(self.photoDetail.likes)
            if photoDetail.liked {
                likeButton.setTitle("♥", forState: .Normal)
            } else {
                likeButton.setTitle("♡", forState: .Normal)
                
            }
            self.numLikes = self.photoDetail.likes
            self.username.text = self.photoDetail.username
            self.date.text = parseDate(self.photoDetail.date)
            setButton()
        }
    }
    
    func setButton() {
        likeButton.addTarget(self, action: "likeAction", forControlEvents: .TouchUpInside)
        likeButton.layer.cornerRadius = 0.5 * likeButton.bounds.size.width
        likeButton.layer.borderColor = UIColor.redColor().CGColor as CGColorRef
        likeButton.layer.borderWidth = 2.0
        likeButton.clipsToBounds = true
        likeButton.backgroundColor = UIColor.whiteColor()
    }
    
    func likeAction(){
        photoDetail.liked = !photoDetail.liked
        if photoDetail.liked {
            likeButton.setTitle("♥", forState: .Normal)
            self.likes.text = String(numLikes + 1)
            self.photoDetail.likes = self.photoDetail.likes + 1
        } else {
            likeButton.setTitle("♡", forState: .Normal)
            self.likes.text = String(numLikes)
        }
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func parseDate(postDate: String) -> String {
        let date = NSDate(timeIntervalSince1970: NSTimeInterval(Int(postDate)!))
        let dateFormatter = NSDateFormatter()
        dateFormatter.dateFormat = "EEEE, MMMM dd, yyyy"
        return dateFormatter.stringFromDate(date)
    }

}