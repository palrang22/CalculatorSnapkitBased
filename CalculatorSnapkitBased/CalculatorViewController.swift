//
//  CalculatorViewController.swift
//  CalculatorSnapkitBased
//
//  Created by 김승희 on 6/25/24.
//

import UIKit
import SnapKit

class CalculatorViewController: UIViewController {
    
    var numLabel = UILabel()
    var logics = Logics()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        configNumLabel()
        configStackView()
    }
    
    @objc func buttonTapped(_ sender: UIButton){
        if let buttontitle = sender.titleLabel?.text {
            numLabel.text = logics.tapButton(buttontitle)
        }
    }
    
    func configNumLabel() {
        view.backgroundColor = .black
        numLabel.textColor = .white
        numLabel.text = "0"
        numLabel.textAlignment = .right
        numLabel.font = .boldSystemFont(ofSize: 60)
        view.addSubview(numLabel)
        
        numLabel.snp.makeConstraints {
            $0.top.equalToSuperview().offset(200)
            $0.leading.equalToSuperview().offset(30)
            $0.trailing.equalToSuperview().offset(-30)
            $0.height.equalTo(100)
        }
    }
    
    func makeHorizontalStackView(_ views: [UIView]) -> UIStackView {
        let horizontalButtonStack = UIStackView(arrangedSubviews: views)
        horizontalButtonStack.axis = .horizontal
        horizontalButtonStack.backgroundColor = .black
        horizontalButtonStack.spacing = 10
        horizontalButtonStack.distribution = .fillEqually
        return horizontalButtonStack
    }
    
    func configStackView() {
        let buttonTitles : [[String]] = [
        ["7", "8", "9", "+"],
        ["4", "5", "6", "-"],
        ["1", "2", "3", "*"],
        ["AC", "0", "=", "/"]]
        
        let verticalButtonStack = UIStackView()
        verticalButtonStack.axis = .vertical
        verticalButtonStack.backgroundColor = .black
        verticalButtonStack.spacing = 10
        verticalButtonStack.distribution = .fillEqually
        view.addSubview(verticalButtonStack)
        
        verticalButtonStack.snp.makeConstraints{
            $0.width.equalTo(350)
            $0.top.equalTo(numLabel.snp.bottom).offset(60)
            $0.centerX.equalToSuperview()
        }
        
        for i in buttonTitles {
            let button = i.map{String($0)}
            var horizontalButtonArr = [UIView]()
            button.forEach{ j in horizontalButtonArr.append(makeButtons(titleValue: j, action: #selector(buttonTapped) , backgroundColor: configButtonColor(j)))}
            let stack = makeHorizontalStackView(horizontalButtonArr)
            verticalButtonStack.addArrangedSubview(stack)
        }
    }
    
    func makeButtons(titleValue: String, action: Selector, backgroundColor: UIColor) -> UIButton {
        let button = UIButton()
        button.setTitle(titleValue, for: .normal)
        button.titleLabel?.font = .boldSystemFont(ofSize: 30)
        button.backgroundColor = backgroundColor
        button.layer.cornerRadius = 40
        button.snp.makeConstraints{
            $0.height.equalTo(80)
            $0.width.equalTo(80)
        }
        button.addTarget(self, action: action, for: .touchUpInside)
        return button
    }
    
    func configButtonColor(_ titleValue: String) -> UIColor {
        switch titleValue {
        case "+", "-", "*", "/", "=", "AC" :
            return .orange
        default:
            return UIColor(red: 58/255, green: 58/255, blue: 58/255, alpha: 1.0)
        }
    }
}
