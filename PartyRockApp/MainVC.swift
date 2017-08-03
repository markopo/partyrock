//
//  ViewController.swift
//  PartyRockApp
//
//  Created by Marko Poikkimäki on 2017-07-31.
//  Copyright © 2017 Marko Poikkimäki. All rights reserved.
//

import UIKit

class MainVC: UIViewController , UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    
    var partyRocks = [PartyRock]()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
            
            let WhreTheSunGoes = PartyRock(imageURL: "https://www.wavefm.com.au/images/stories/2015/04/redfoo.jpg",
                                           videoURL: iframeHtml(url : "https://www.youtube.com/embed/TrVLu9p65a0"),
                                           videoTitle: "Where the sun goes")
            
            partyRocks.append(WhreTheSunGoes)
 
            let NewThang = PartyRock(imageURL: "http://www.billboard.com/files/styles/article_main_image/public/media/redfoo-press-2015-billboard-650.jpg",
                                     videoURL: iframeHtml(url: "https://www.youtube.com/embed/xGiBiHocSZM"),
                                     videoTitle: "New Thang")
        
            partyRocks.append(NewThang)
        
            let LetsGetRidi = PartyRock(imageURL: "http://www.videostatic.com/sites/default/files/styles/post/public/redfoo_sun.jpg?itok=4jYLVrrU",
                                        videoURL: iframeHtml(url: "https://www.youtube.com/embed/CdLhdrNgGu4"),
                                        videoTitle: "Let's Get Ridiculous")
        
        
            partyRocks.append(LetsGetRidi)
        
            let WhreTheSunGoes2 = PartyRock(imageURL: "http://madamenoire.com/wp-content/uploads/2015/06/LMFAO-Redfoo-SkyBlu.jpg",
                                       videoURL: iframeHtml(url : "https://www.youtube.com/embed/TrVLu9p65a0"),
                                       videoTitle: "Where the sun goes")
        
            partyRocks.append(WhreTheSunGoes2)

        
            let WhreTheSunGoes3 = PartyRock(imageURL: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSbOG7BRySumXIm47xzgOdRsavJPlGezTv2tycxIx2pYuaz4EQe",
                                       videoURL: iframeHtml(url : "https://www.youtube.com/embed/TrVLu9p65a0"),
                                       videoTitle: "Where the sun goes")
        
            partyRocks.append(WhreTheSunGoes3)

        
            tableView.delegate = self
            tableView.dataSource = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func iframeHtml(url:String) -> String {
        return "<iframe width=\"560\" height=\"315\" src=\"\(url)\" frameborder=\"0\" allowfullscreen></iframe>"
    }
    
   
    func tableView(_ tableView: UITableView,
                   cellForRowAt indexPath:IndexPath) -> UITableViewCell {
        
        if let cell = tableView.dequeueReusableCell(withIdentifier: "PartyCell", for:indexPath) as? PartyCell {
            
            
            let partyRock = partyRocks[indexPath.row]
            
            cell.updateUI(partyRock: partyRock)
            
            return cell
            
        }
        else {
            return UITableViewCell()
        }
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section:Int) -> Int {
        return partyRocks.count
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)  {
    
        let partyRock = partyRocks[indexPath.row]
        
        performSegue(withIdentifier: "VideoVC", sender: partyRock)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?){
        
        if let destination = segue.destination as? VideoVC {
            
            if let party = sender as? PartyRock {
                
                destination.partyRock = party
                
            }
            
        }
        
    }
 
    
    
}

