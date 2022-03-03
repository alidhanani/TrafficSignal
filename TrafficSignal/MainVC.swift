//
//  ViewController.swift
//  TrafficSignal
//
//  Created by NextAuth on 03/03/2022.
//

import UIKit

class MainVC: UIViewController {
    
    let txtModel: UITextField = {
        let txt = UITextField()
        txt.placeholder = "Enter Model Number"
        return txt
    }()
    
    let btnReady: UIButton = {
        let btn = UIButton(type: .system)
        btn.frame = CGRect(x: 0, y: 0, width: 121, height: 121)
        btn.backgroundColor = .white
        btn.setTitle("Start Driving", for: .normal)
        btn.titleLabel?.font = UIFont.boldSystemFont(ofSize: 24)
        btn.addTarget(self, action: #selector(boardBtnTapAction), for: .touchUpInside)
        return btn
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        self.navigationController?.isNavigationBarHidden = false
        positionDesign() // Desiging the Layout
        // Do any additional setup after loading the view.
    }
    
    @objc func boardBtnTapAction(_ sender: UIButton)
    {
        self.navigationController?.pushViewController(TrafficVC(), animated: true)
    }
    
    func positionDesign() {
//        let navBar = UINavigationBar(frame: CGRect(x: 0, y: 0, width: view.frame.size.width, height: 44))
//        self.view.addSubview(navBar)
        // Adding the Label and Image to the parent view
        self.view.addSubview(txtModel)
        self.view.addSubview(btnReady)
        
//        // Center
        txtModel.center = self.view.center
        btnReady.center = self.view.center
//
//        // enable auto layout
        txtModel.translatesAutoresizingMaskIntoConstraints = false
        btnReady.translatesAutoresizingMaskIntoConstraints = false
        
//        let navItem = UINavigationItem(title: "SomeTitle")
//
//        navBar.setItems([navItem], animated: false)
        
        AnchorForTextField()
        AnchorForBtnReady()
    }

    
    func  AnchorForTextField() {
        txtModel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true // Screen Center
        txtModel.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 0).isActive = true // Screen center from y access with 0 meaning moving a little to the top
    }
    
    func  AnchorForBtnReady() {
        
        btnReady.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true // Screen Center
        btnReady.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 50).isActive = true // Screen
    }


}

