//
//  VideoVC.swift
//  PartyRockApp
//
//  Created by Marko Poikkimäki on 2017-07-31.
//  Copyright © 2017 Marko Poikkimäki. All rights reserved.
//

import UIKit

class VideoVC: UIViewController {
    
    @IBOutlet weak var webView: UIWebView!
    
   
    private var _partyRock : PartyRock!
    
    var partyRock: PartyRock {
        get {
            return _partyRock
        }
        set {
            _partyRock = newValue
        }
    }
    
    @IBOutlet weak var videoLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        videoLabel.text = partyRock.videoTitle
        
        webView.loadHTMLString(partyRock.videoURL, baseURL: nil)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
