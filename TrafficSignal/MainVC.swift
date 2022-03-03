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
        btn.setTitle("Ready", for: .normal)
        btn.titleLabel?.font = UIFont.boldSystemFont(ofSize: 40)
        return btn
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        positionDesign() // Desiging the Layout
        // Do any additional setup after loading the view.
    }
    
    func positionDesign() {
        
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
        
        AnchorForTextField()
        AnchorForBtnReady()
    }

    
    func  AnchorForTextField() {
        //label title
        txtModel.heightAnchor.constraint(equalToConstant: 20).isActive = true // height 20
        txtModel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 5).isActive = true // making distance of 5 from the left screen
        txtModel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -5).isActive = true // making distance of 5 from the right screen
        txtModel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true // making it screen center by x axis
        txtModel.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 100).isActive = true // having adistance of 8 from the imageView
    }
    
    func  AnchorForBtnReady() {
        //label title
        btnReady.heightAnchor.constraint(equalToConstant: 20).isActive = true // height 20
        btnReady.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 5).isActive = true // making distance of 5 from the left screen
        btnReady.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -5).isActive = true // making distance of 5 from the right screen
        btnReady.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true // making it screen center by x axis
        btnReady.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 100).isActive = true // having adistance of 8 from the imageView
    }


}

