//
//  ViewController.swift
//  piedra-papel-tijera
//
//  Created by Akel Barbosa on 9/06/22.
//

import UIKit

class ViewController: UIViewController {
    
    private let titleApp: UILabel = {
        let titleApp = UILabel()
        titleApp.text = "Piedra Papel Tijera"
        titleApp.textAlignment = .center
        titleApp.font = UIFont.boldSystemFont(ofSize: 40)
        
        
        titleApp.translatesAutoresizingMaskIntoConstraints = false
        return titleApp
    }()
    
    private let stackViewMain: UIStackView = {
        let stackView = UIStackView()
        stackView.distribution = .equalSpacing
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        return stackView
    }()
    
    private let iconSelectedLabel: UILabel  = {
        let titleApp = UILabel()
        titleApp.text = "🤔"
        titleApp.font = UIFont.boldSystemFont(ofSize: 40)
    
        titleApp.translatesAutoresizingMaskIntoConstraints = false
        return titleApp
    }()
    
    private let iconSelectedCpuLabel: UILabel  = {
        let titleApp = UILabel()
        titleApp.text = "🤖"
        titleApp.font = UIFont.boldSystemFont(ofSize: 40)
        
        titleApp.translatesAutoresizingMaskIntoConstraints = false
        return titleApp
    }()
    
    private let iconSelectedVSLabel: UILabel  = {
        let titleApp = UILabel()
        titleApp.text = "VS"
        titleApp.font = UIFont.boldSystemFont(ofSize: 30)
        
        titleApp.translatesAutoresizingMaskIntoConstraints = false
        return titleApp
    }()
    
    
    private let showResult: UILabel = {
        let label = UILabel()
        label.text = "The winner is ..."
        
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    
    private let optionStackView: UIStackView = {
        
        let stackView = UIStackView()
        stackView.distribution = .equalSpacing
        stackView.isHidden = false
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        return stackView
    }()
    
    
    private let playAgain: UIButton = {
        
        var configuration = UIButton.Configuration.filled()
        configuration.title = "Play again"

        let button = UIButton(type: .system)
        button.configuration = configuration
        button.isHidden = true
        button.translatesAutoresizingMaskIntoConstraints = false
        
        return button
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        view.addSubview(titleApp)
        view.addSubview(stackViewMain)
        view.addSubview(showResult)
        view.addSubview(optionStackView)
        view.addSubview(playAgain)
        
        
        NSLayoutConstraint.activate([
            titleApp.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor, constant: 10),
            titleApp.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -12),
            titleApp.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 12),
            titleApp.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            stackViewMain.topAnchor.constraint(equalTo: titleApp.bottomAnchor, constant: 10),
            stackViewMain.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            stackViewMain.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            stackViewMain.widthAnchor.constraint(equalToConstant: 300),
            stackViewMain.heightAnchor.constraint(equalToConstant: 60),
            
            showResult.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            showResult.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            
            optionStackView.bottomAnchor.constraint(equalTo: view.layoutMarginsGuide.bottomAnchor),
            optionStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            optionStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            optionStackView.widthAnchor.constraint(equalToConstant: 300),
            optionStackView.heightAnchor.constraint(equalToConstant: 100),
            
            playAgain.bottomAnchor.constraint(equalTo: view.layoutMarginsGuide.bottomAnchor),
            playAgain.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant:  30),
            playAgain.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            playAgain.heightAnchor.constraint(equalToConstant: 60),
            
            
        ])
        
        [iconSelectedLabel, iconSelectedVSLabel, iconSelectedCpuLabel].forEach { icons in
            stackViewMain.addArrangedSubview(icons)
        }
        
        
        ["👊🏼", "🤚🏼", "✌🏼"].forEach { icon in
                  
            let button = UIButton(type: .system, primaryAction: UIAction(title: icon, handler: { text in
                self.touchedButton(text: text.title)
                
            }))
            
            button.setTitle(icon, for: .normal)
            button.titleLabel?.font = UIFont.systemFont(ofSize: 50)
            button.layer.cornerRadius = 13
            button.layer.shadowColor = UIColor.black.cgColor
            button.layer.shadowOpacity = 0.2
            button.layer.shadowOffset = .zero
            button.layer.shadowRadius = 10
     

            optionStackView.addArrangedSubview(button)
        }
        
        playAgain.addTarget(self, action: #selector(playbuton), for: .touchUpInside)
        
    }
    
    func touchedButton (text: String) {
        iconSelectedLabel.text = text
        optionStackView.isHidden = true
        playAgain.isHidden = false
        showResult.text = self.getWinner(optionSelected: text)
        
    }
    
    @objc func playbuton () {
        playAgain.isHidden = true
        optionStackView.isHidden = false
        iconSelectedLabel.text = "🤔"
        iconSelectedCpuLabel.text = "🤖"
        showResult.text = "The winner is ..."
    }
    
    
    func getWinner (optionSelected: String) -> String{
        
        let optionsCpu = ["👊🏼", "🤚🏼", "✌🏼"]
        let option = optionsCpu.randomElement()
        iconSelectedCpuLabel.text = option
        switch optionSelected {
        case "👊🏼":
            switch option {
            case "👊🏼":
                return "Tie"
            case "🤚🏼":
                return "The CPU is Winner"
            case "✌🏼":
                return "You win"
            default:
                return "Error"
                
            }
            
            
        case "🤚🏼":
            switch option {
            case "👊🏼":
                return "You Win"
            case "🤚🏼":
                return "Tie"
            case "✌🏼":
                return "You Lose, The CPU win"
            default:
                return "Error"
                
            }
            
        case "✌🏼":
            switch option {
            case "👊🏼":
                return "You Lose, The CPU win"
            case "🤚🏼":
                return "You win"
            case "✌🏼":
                return "Tie"
            default:
                return "Error"
                
            }
        default:
            return "Error"
            
        }
    
    }


}

