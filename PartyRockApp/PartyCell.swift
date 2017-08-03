//
//  PartyCell.swift
//  PartyRockApp
//
//  Created by Marko Poikkimäki on 2017-07-31.
//  Copyright © 2017 Marko Poikkimäki. All rights reserved.
//

import UIKit

class PartyCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
       self.setVisibility(isHidden: true)
        
    }
    
    func setVisibility(isHidden:Bool){

        if isHidden == true {
            self.videoPreviewImage.alpha = 0.0
            self.videoTitle.alpha = 0.0
        }
        else {
            
            UIView.animate(withDuration: 1.5, animations: {
                self.videoPreviewImage.alpha = 1.0
                self.videoTitle.alpha = 1.0
            })
            
        }
    }

    func updateUI(partyRock: PartyRock) {
        
        videoTitle.text = partyRock.videoTitle
        
        let url = URL(string: partyRock.imageURL)!
        
        DispatchQueue.global().async {
            do {
                let data = try Data(contentsOf: url)
                
                DispatchQueue.global().sync {
                    self.videoPreviewImage.image = UIImage(data: data)
                    self.setVisibility(isHidden: false)
                }
                
            } catch  {
                
            }
            
            
        }
        
        // TODO: set image from url 
        
    }

    @IBOutlet weak var videoPreviewImage: UIImageView!
    
    @IBOutlet weak var videoTitle: UILabel!
}
