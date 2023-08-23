//
//  HomeViewController.swift
//  UserFlow
//
//  Created by Yogesh Patel on 16/11/21.
//

import UIKit

class HomeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        configuration()
    }
    
}

extension HomeViewController{
    
    func configuration(){
        addButtons()
    }
    
    func addButtons(){
        let logout = UIBarButtonItem(title: "Logout", style: .plain, target: self, action: #selector(logoutTapped))
        navigationItem.rightBarButtonItem = logout
    }
    
    @objc
    func logoutTapped(){
        UserDefaults.standard.removeObject(forKey: "emailKey")//remove kiya
        print(UserDefaults.standard.value(forKey: "emailKey"))
        
        
        let window = (UIApplication.shared.connectedScenes.first!.delegate as! SceneDelegate).window
        if let loginViewController = self.storyboard?.instantiateViewController(withIdentifier: "LoginViewController") as? LoginViewController{
            let loginNavigationController = UINavigationController(rootViewController: loginViewController)
            window?.rootViewController = loginNavigationController
            window?.makeKeyAndVisible()
        }
        
    }
}
