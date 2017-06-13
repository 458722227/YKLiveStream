//
//  PlayViewController.swift
//  YKLiveStream
//
//  Created by Ben on 17/6/13.
//  Copyright © 2017年 szd. All rights reserved.
//

import UIKit

class PlayViewController: UIViewController {
    @IBOutlet weak var bgImgV: UIImageView!
    @IBOutlet weak var loadingLab: UILabel!
    
    var live : YKCell!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setBgImgV()
    }
    
    func setBgImgV() {
        let imgUrl = URL(string: live.portrait)
        bgImgV.kf.setImage(with: imgUrl)
        
        //模糊效果
        let blurEffect = UIBlurEffect(style: .light)
        let effectView = UIVisualEffectView(effect: blurEffect)
        effectView.frame = bgImgV.bounds
        bgImgV.addSubview(effectView)
    }
    
    @IBAction func returnClick(_ sender: Any) {
        navigationController?.popViewController(animated: true)
        navigationController?.setNavigationBarHidden(false, animated: true)
    }
    @IBAction func giftClick(_ sender: Any) {
    }
    @IBAction func goodClick(_ sender: Any) {
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
