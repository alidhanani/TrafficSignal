//
//  MainVC.swift
//  TrafficSignal
//
//  Created by Ali Dhanani on 03/03/2022.
//

import UIKit

class MainVC: UIViewController{
    
    let txtModel: UITextField = {
        let txt = UITextField()
        txt.placeholder = "Enter Model Number"
        txt.addTarget(self, action: #selector(textFieldDidChange(_:)), for: .editingChanged)
        return txt
    }()
    
    let btnReady: UIButton = {
        let btn = UIButton(type: .system)
        btn.frame = CGRect(x: 0, y: 0, width: 121, height: 121)
        btn.backgroundColor = .white
        btn.isHidden = true
        btn.setTitle("Start Driving", for: .normal)
        btn.titleLabel?.font = UIFont.boldSystemFont(ofSize: 24)
        btn.addTarget(self, action: #selector(boardBtnTapAction), for: .touchUpInside)
        return btn
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        self.title = "Traffic Signal"
        positionDesign() // Desiging the Layout
    }
    
    @objc func boardBtnTapAction(_ sender: UIButton)
    {
        let trafficVC = TrafficVC()
        trafficVC.headerTitle = txtModel.text
        self.navigationController?.pushViewController(trafficVC, animated: true)
    }
    
    func positionDesign() {
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
        txtModel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true // Screen Center
        txtModel.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 0).isActive = true // Screen center from y access with 0 meaning moving a little to the top
    }
    
    func  AnchorForBtnReady() {
        
        btnReady.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true // Screen Center
        btnReady.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 50).isActive = true // Screen
    }

}

extension MainVC: UITextFieldDelegate  {
    @objc func textFieldDidChange(_ textField: UITextField) {
        if textField.text! == "" {
            btnReady.isHidden = true
        } else {
            btnReady.isHidden = false
        }
    }
}
