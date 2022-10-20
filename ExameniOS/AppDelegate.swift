//
//  AppDelegate.swift
//  ExameniOS
//
//  Created by Rodrigo Sánchez on 18/10/22.
//

import UIKit
import Firebase
@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        FirebaseApp.configure()
        self.window = UIWindow(frame: UIScreen.main.bounds)
        self.window! .backgroundColor = UIColor(red: 35/255, green: 34/255, blue: 34/255, alpha:1)
        self.window!.makeKeyAndVisible()
        
        let mainStoryboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        

        let navigationController = mainStoryboard.instantiateViewController(withIdentifier: "viewController") as! ViewController
        let mainPageNav = UINavigationController(rootViewController: navigationController)
        self.window?.rootViewController = mainPageNav
        
        //logomask
        navigationController.view.layer.mask = CALayer()
        navigationController.view.layer.mask?.contents = UIImage(named: "retro_apple")!.cgImage
        navigationController.view.layer.mask?.bounds = CGRect(x:0, y:0, width: 60, height: 60)
        navigationController.view.layer.mask?.anchorPoint = CGPoint (x: 0.5, y: 0.5)
        navigationController.view.layer.mask?.position = CGPoint (x: navigationController.view.frame.width / 2, y: navigationController.view.frame.height / 2)
        //logo mask background view
        let maskBigView = UIView(frame: navigationController.view.frame)
        maskBigView.backgroundColor = UIColor.white
        navigationController.view.addSubview(maskBigView)
        navigationController.view.bringSubviewToFront(maskBigView)
        
        //logo mask animation
        let transformAnimation = CAKeyframeAnimation (keyPath: "bounds")
        transformAnimation.duration = 0.5
        transformAnimation.beginTime = CACurrentMediaTime() + 1
        
        let initalBounds = NSValue(cgRect: (navigationController.view.layer.mask?.bounds)!)
        let secondBounds = NSValue(cgRect: CGRect(x: 0, y: 0, width: 50, height: 50))
        let finalBounds = NSValue(cgRect: CGRect(x: 0, y: 0, width: 2000, height: 2000))
        
        transformAnimation.values = [initalBounds, secondBounds, finalBounds]
        transformAnimation.keyTimes = [0, 0.5, 1]
        transformAnimation.timingFunctions = [CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut), CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)]
        transformAnimation.isRemovedOnCompletion = false
        transformAnimation.fillMode = CAMediaTimingFillMode.forwards
        navigationController.view.layer.mask?.add(transformAnimation, forKey: "maskAnimation")
        
        UIView.animate(withDuration: 0.1, delay: 1.35, options: UIView.AnimationOptions.curveEaseIn,
                       animations: {
            maskBigView.alpha = 0.0
        },
                       completion: {finished in
            maskBigView.removeFromSuperview()
        })
        
        
        
        UIView.animate(withDuration: 0.25,
                       delay: 1.3,
                       options: UIView.AnimationOptions(),
                       animations: {
            self.window!.rootViewController!.view.transform = CGAffineTransform(scaleX: 1.05, y: 1.05)
            
            
        },
                       completion: {finished in
            UIView.animate(withDuration: 0.3,
                           delay: 0.0,
                           options : UIView.AnimationOptions.curveEaseInOut,
                           animations: {
                self.window!.rootViewController!.view.transform = CGAffineTransform.identity
            },
                           completion: nil
            )
        })
        
        
        return true
    }
    
    // MARK: UISceneSession Lifecycle
    
    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }
    
    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }
    
    
}

