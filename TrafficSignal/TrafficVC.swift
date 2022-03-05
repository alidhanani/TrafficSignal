//
//  TrafficVC.swift
//  TrafficSignal
//
//  Created by Ali Dhanani on 03/03/2022.
//

import UIKit

class TrafficVC: UIViewController {
    
    var currentState: TrafficState?
    var headerTitle: String?
    
    // Black Frame that has the Line on it
    let stackVerticalBoard: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 10
        stackView.alignment = .fill
        stackView.distribution = .fillEqually
        return stackView
    }()
    
    let signalView: [UIView] = {
        var views: [UIView] = []
        for i in 0..<3 {
            let view = UIView()
            view.frame = CGRect(x: 0, y: 0, width: 50, height: 95)
            view.backgroundColor = UIColor.BrightColor.red
            view.layer.cornerRadius = view.frame.size.height/2.0
            view.clipsToBounds = true
            views.append(view)
        }
        return views
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        positionDesign()
        self.title = headerTitle
        initalSignalBy(Red: self.signalView[0], Yellow: self.signalView[1], Green: self.signalView[2])
        timeScheduleOnTrafficLightBy(Red: self.signalView[0], Yellow: self.signalView[1], Green: self.signalView[2])
    }
    
    func initalSignalBy(Red red: UIView, Yellow yellow: UIView, Green green:UIView) {
        currentState = .red
        red.backgroundColor = UIColor.BrightColor.red
        yellow.backgroundColor = UIColor.DimColor.yellow
        green.backgroundColor = UIColor.DimColor.green
    }
    
    func timeScheduleOnTrafficLightBy(Red red: UIView, Yellow yellow: UIView, Green green:UIView) {
        Timer.scheduledTimer(withTimeInterval: 4, repeats: true) { (time) in
            switch self.currentState {
            case .red:
                self.currentState = .yellow
                time.fireDate.addTimeInterval(1)
                red.backgroundColor = UIColor.DimColor.red
                yellow.backgroundColor = UIColor.BrightColor.yellow
                green.backgroundColor = UIColor.DimColor.green
                break
            case .yellow:
                self.currentState = .green
                red.backgroundColor = UIColor.DimColor.red
                yellow.backgroundColor = UIColor.DimColor.yellow
                green.backgroundColor = UIColor.BrightColor.green
                break
            case .green:
                self.currentState = .red
                red.backgroundColor = UIColor.BrightColor.red
                yellow.backgroundColor = UIColor.DimColor.yellow
                green.backgroundColor = UIColor.DimColor.green
                break
            case .none:
                break
            }
            
        }
    }
    
    func positionDesign() {
        for signal in signalView {
            self.view.addSubview(signal)
        }
        self.view.addSubview(stackVerticalBoard)
        
        stackVerticalBoard.center = self.view.center
        stackVerticalBoard.translatesAutoresizingMaskIntoConstraints = false
        for signal in signalView {
            signal.translatesAutoresizingMaskIntoConstraints = false
        }
        
        for signal in signalView {
            stackVerticalBoard.addArrangedSubview(signal)
        }
        
        AnchorForStackView()
    }
    

    func AnchorForStackView() {
        // Vertical StackView
        stackVerticalBoard.heightAnchor.constraint(equalToConstant: 300).isActive = true // height 300
        stackVerticalBoard.widthAnchor.constraint(equalToConstant: 100).isActive = true // Width 100
        stackVerticalBoard.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true // Screen Center
        stackVerticalBoard.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 0).isActive = true // Screen center from y access with 0 meaning moving a little to the top
    }
    

}
