//
//  ViewController.swift
//  tumblr
//
//  Created by Tina Chen on 2/27/16.
//  Copyright © 2016 tinachen. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var contentView: UIView!
    @IBOutlet weak var bubbleView: UIImageView!
    @IBOutlet var buttons: [UIButton]!
    
    var fadeTransition: FadeTransition!
    var homeViewController: UIViewController!
    var searchViewController: UIViewController!
    var accountViewController: UIViewController!
    var trendingViewController: UIViewController!
    var composeViewController: UIViewController!
    var viewContollers: [UIViewController]!
    var selectedIndex: Int!
    var bubbleOriginalCenter: CGPoint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        selectedIndex = 0
        homeViewController = storyboard.instantiateViewControllerWithIdentifier("homeViewController")
        searchViewController = storyboard.instantiateViewControllerWithIdentifier("searchViewController")
        accountViewController = storyboard.instantiateViewControllerWithIdentifier("accountViewController")
        trendingViewController = storyboard.instantiateViewControllerWithIdentifier("trendingViewController")
        composeViewController = storyboard.instantiateViewControllerWithIdentifier("composeViewController")
        viewContollers = [homeViewController, searchViewController, accountViewController, trendingViewController]
        bubbleView.hidden = true
        bubbleOriginalCenter = bubbleView.center
        buttons[selectedIndex].selected = true
        didPressTab(buttons[selectedIndex])
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func didPressTab(sender: UIButton) {
        let previousIndex = selectedIndex
        selectedIndex = sender.tag
        buttons[previousIndex].selected = false
        
        let previousVC = viewContollers[previousIndex]
        previousVC.willMoveToParentViewController(nil)
        previousVC.view.removeFromSuperview()
        previousVC.removeFromParentViewController()
        
        sender.selected = true
        
        let vc = viewContollers[selectedIndex]
        addChildViewController(vc)
        vc.view.frame = contentView.bounds
        contentView.addSubview(vc.view)
        vc.didMoveToParentViewController(self)
        
        if selectedIndex != 1 {
            bubbleView.hidden = false
            UIView.animateWithDuration(0.5, delay: 0, options: [.Repeat, .Autoreverse], animations: { () -> Void in
                self.bubbleView.center.y = self.bubbleOriginalCenter.y - 5
                }, completion: nil)
        } else {
            bubbleView.hidden = true
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
        fadeTransition.duration = 0.5
    }
    
}

