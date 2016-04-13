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
    @IBOutlet weak var likeButton: UIButton!
    var photoDetail: Photo!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("PhotoDetails:")
//        print(photoDetail)
        if let photoDetail = self.photoDetail{
            print("hi")
            print(photoDetail)
//            self.userPhoto.image = UIImage(data: data!)
            self.likes.text = String(self.photoDetail.likes)
            self.username.text = self.photoDetail.username
//            self.date.text = photoDetail.date
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    

}