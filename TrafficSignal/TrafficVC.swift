//
//  TrafficVC.swift
//  TrafficSignal
//
//  Created by NextAuth on 03/03/2022.
//

import UIKit

class TrafficVC: UIViewController {
    
    var currentState: TrafficState = .red
    
    // Black Frame that has the Line on it
    let stackVerticalBoard: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 10
        stackView.alignment = .fill
        stackView.distribution = .fillEqually
        return stackView
    }()
    
    let redView: UIView = {
        let view = UIView()
        view.frame = CGRect(x: 0, y: 0, width: 50, height: 100)
        view.backgroundColor = UIColor.BrightColor.red
        view.layer.cornerRadius = view.frame.size.width/2.0
        view.clipsToBounds = true
        return view
    }()
    
    let yellowView: UIView = {
        let view = UIView()
        view.frame = CGRect(x: 0, y: 0, width: 50, height: 100)
        view.backgroundColor = UIColor.DimColor.yellow
        view.layer.cornerRadius = view.frame.size.width/2.0
        view.clipsToBounds = true
        return view
    }()
    
    let greenView: UIView = {
        let view = UIView()
        view.frame = CGRect(x: 0, y: 0, width: 50, height: 50)
        view.backgroundColor = UIColor.DimColor.green
        view.layer.cornerRadius = view.frame.size.width/2.0
        view.clipsToBounds = true
        return view
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        positionDesign()
        Timer.scheduledTimer(withTimeInterval: 4, repeats: true) { (time) in
            switch self.currentState {
            case .red:
                self.currentState = .yellow
                time.fireDate.addTimeInterval(1)
                self.redView.backgroundColor = UIColor.DimColor.red
                self.yellowView.backgroundColor = UIColor.BrightColor.yellow
                self.greenView.backgroundColor = UIColor.DimColor.green
                break
            case .yellow:
                self.currentState = .green
                self.redView.backgroundColor = UIColor.DimColor.red
                self.yellowView.backgroundColor = UIColor.DimColor.yellow
                self.greenView.backgroundColor = UIColor.BrightColor.green
                break
            case .green:
                self.currentState = .red
                self.redView.backgroundColor = UIColor.BrightColor.red
                self.yellowView.backgroundColor = UIColor.DimColor.yellow
                self.greenView.backgroundColor = UIColor.DimColor.green
                break
            default:
                break
            }
            
        }
    }
    
    func positionDesign() {
        self.view.addSubview(greenView)
        self.view.addSubview(yellowView)
        self.view.addSubview(redView)
        self.view.addSubview(stackVerticalBoard)
        
        stackVerticalBoard.center = self.view.center
        
        stackVerticalBoard.translatesAutoresizingMaskIntoConstraints = false
        redView.translatesAutoresizingMaskIntoConstraints = false
        yellowView.translatesAutoresizingMaskIntoConstraints = false
        greenView.translatesAutoresizingMaskIntoConstraints = false
        
        stackVerticalBoard.addArrangedSubview(redView)
        stackVerticalBoard.addArrangedSubview(yellowView)
        stackVerticalBoard.addArrangedSubview(greenView)
        
        AnchorForStackView()
    }
    

    func AnchorForStackView() {
        // Vertical StackView
        stackVerticalBoard.heightAnchor.constraint(equalToConstant: 300).isActive = true // height 400
        stackVerticalBoard.widthAnchor.constraint(equalToConstant: 100).isActive = true // Width 300
        stackVerticalBoard.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true // Screen Center
        stackVerticalBoard.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 0).isActive = true // Screen center from y access with 0 meaning moving a little to the top
    }
    

}
