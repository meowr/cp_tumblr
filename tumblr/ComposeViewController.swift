//
//  ComposeViewController.swift
//  tumblr
//
//  Created by Tina Chen on 2/27/16.
//  Copyright © 2016 tinachen. All rights reserved.
//

import UIKit

class ComposeViewController: UIViewController {
    @IBOutlet weak var chatView: UIImageView!
    @IBOutlet weak var quoteView: UIImageView!
    @IBOutlet weak var textView: UIImageView!
    @IBOutlet weak var videoView: UIImageView!
    @IBOutlet weak var photoView: UIImageView!
    @IBOutlet weak var linkView: UIImageView!
    
    var hidden: CGFloat!
    var topRow: CGFloat!
    var bottomRow: CGFloat!
    var hiddenTop: CGFloat!
    
    var fadeTransition: FadeTransition!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        hidden = CGFloat(660)
        topRow = CGFloat(166)
        bottomRow = CGFloat(284)
        hiddenTop = CGFloat (-100)

    }
    override func viewWillAppear(animated: Bool) {
        chatView.center.y = hidden
        quoteView.center.y = hidden
        textView.center.y = hidden
        videoView.center.y = hidden
        photoView.center.y = hidden
        linkView.center.y = hidden
    }
    
    override func viewDidAppear(animated: Bool) {
        UIView.animateWithDuration(0.3, delay: 0, options: [.CurveEaseOut], animations: { () -> Void in
            self.photoView.center.y = self.topRow
            }, completion: nil)
        UIView.animateWithDuration(0.3, delay: 0.1, options: [.CurveEaseOut], animations: { () -> Void in
            self.textView.center.y = self.topRow            }, completion: nil)
        UIView.animateWithDuration(0.3, delay: 0.2, options: [.CurveEaseOut], animations: { () -> Void in
            self.quoteView.center.y = self.topRow
            }, completion: nil)
        UIView.animateWithDuration(0.3, delay: 0.3, options: [.CurveEaseOut], animations: { () -> Void in
            self.chatView.center.y = self.bottomRow
            }, completion: nil)
        UIView.animateWithDuration(0.3, delay: 0.4, options: [.CurveEaseOut], animations: { () -> Void in
            self.linkView.center.y = self.bottomRow            }, completion: nil)
        UIView.animateWithDuration(0.3, delay: 0.5, options: [.CurveEaseOut], animations: { () -> Void in
            self.videoView.center.y = self.bottomRow
            }, completion: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func onNevermind(sender: AnyObject) {
        UIView.animateWithDuration(0.3, delay: 0, options: [.CurveEaseIn], animations: { () -> Void in
            self.photoView.center.y = self.hiddenTop
            }, completion: nil)
        UIView.animateWithDuration(0.3, delay: 0.1, options: [.CurveEaseIn], animations: { () -> Void in
            self.textView.center.y = self.hiddenTop       }, completion: nil)
        UIView.animateWithDuration(0.3, delay: 0.2, options: [.CurveEaseIn], animations: { () -> Void in
            self.quoteView.center.y = self.hiddenTop
            }, completion: nil)
        UIView.animateWithDuration(0.3, delay: 0.3, options: [.CurveEaseIn], animations: { () -> Void in
            self.chatView.center.y = self.hiddenTop
            }, completion: nil)
        UIView.animateWithDuration(0.3, delay: 0.4, options: [.CurveEaseIn], animations: { () -> Void in
            self.linkView.center.y = self.hiddenTop           }, completion: nil)
        UIView.animateWithDuration(0.3, delay: 0.5, options: [.CurveEaseIn], animations: { () -> Void in
            self.videoView.center.y = self.hiddenTop
            }, completion: nil)
        delay(0.8) { () -> () in
            self.dismissViewControllerAnimated(true, completion: nil)
        }
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Access the ViewController that you will be transitioning too, a.k.a, the destinationViewController.
        var destinationViewController = segue.destinationViewController
        
        // Set the modal presentation style of your destinationViewController to be custom.
        destinationViewController.modalPresentationStyle = UIModalPresentationStyle.Custom
        
        // Create a new instance of your fadeTransition.
        fadeTransition = FadeTransition()
        
        // Tell the destinationViewController's  transitioning delegate to look in fadeTransition for transition instructions.
        destinationViewController.transitioningDelegate = fadeTransition
        
        // Adjust the transition duration. (seconds)
        fadeTransition.duration = 1.0
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
