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
    
    @IBOutlet weak var returnBtn: UIButton!
    @IBOutlet weak var giftBtn: UIButton!
    @IBOutlet weak var goodBtn: UIButton!
    
    var live : YKCell!
    var playerView : UIView!
    var ijkPlayer : IJKMediaPlayback!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        if !self.ijkPlayer.isPlaying() {
            ijkPlayer.prepareToPlay()
        }
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setBgImgV()
        
        setPlayerView()
        
        bringBtnsToFont()
    }
    
    func setPlayerView() {
        playerView = UIView(frame: view.bounds)
        view.addSubview(playerView)
        
        ijkPlayer = IJKFFMoviePlayerController(contentURLString: live.url, with: nil)
        let pv = ijkPlayer.view!
        pv.frame = playerView.bounds
        pv.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        ijkPlayer.scalingMode = .aspectFill
        playerView.addSubview(pv)
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
    
    func bringBtnsToFont(){
        view.bringSubview(toFront: returnBtn)
        view.bringSubview(toFront: giftBtn)
        view.bringSubview(toFront: goodBtn)
    }
    
    @IBAction func returnClick(_ sender: Any) {
        ijkPlayer.shutdown()
        
        navigationController?.popViewController(animated: true)
        navigationController?.setNavigationBarHidden(false, animated: true)
    }
    
    @IBAction func giftClick(_ sender: Any) {
        let duration = 3.0
        let car = UIImageView(image: #imageLiteral(resourceName: "porsche"))

        car.frame = CGRect(x: 0, y: 0, width: 0, height: 0)
        view.addSubview(car)
        
        let carWidth : CGFloat = 250
        let carHeight : CGFloat = 125
        
        UIView.animate(withDuration: duration, animations: { 
            car.frame = CGRect(x: self.view.center.x - carWidth/2, y: self.view.center.y - carHeight/2, width: carWidth, height: carHeight)
        })
        
        DispatchQueue.main.asyncAfter(deadline: .now() + duration) { 
            UIView.animate(withDuration: duration, animations: { 
                car.alpha = 0.0
            }, completion: { (true) in
                car.removeFromSuperview()
            })
        }
        
        let layerFw = CAEmitterLayer()
        view.layer.addSublayer(layerFw)
        emmitParticles(from: giftBtn.center, emitter: layerFw, in: view)
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 6) { 
            layerFw.removeFromSuperlayer()
        }
    }
    
    @IBAction func goodClick(_ sender: Any) {
        let heart = DMHeartFlyView(frame: CGRect(x: 0, y: 0, width: 40, height: 40))
        heart.center = CGPoint(x: goodBtn.frame.origin.x, y: goodBtn.frame.origin.y)
        view.addSubview(heart)
        heart.animate(in: view)
        
        //爱心按钮 大小的关键帧动画
        let btnAnimate = CAKeyframeAnimation(keyPath: "transform.scale")
        btnAnimate.values = [1.0, 0.7, 0.5, 0.3, 0.5, 0.7, 1.0]
        btnAnimate.keyTimes = [0.0, 0.1, 0.2, 0.3, 0.4, 0.5, 0.6, 0.7, 0.8, 0.9, 1.0]
        btnAnimate.duration = 0.2
        goodBtn.layer.add(btnAnimate, forKey: "SHOW")
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
