//
//  ViewController.swift
//  DI Part 1 - Delegate
//
//  Created by 簡莉芯 on 2023/5/24.
//

import UIKit



class SelectionView: UIView {

    private var buttons: [UIButton] = []
    private var indicatorView: UIView!
    private var customView: UIView!
    
    weak var dataSource: SelectionViewDataSource?
    weak var delegate: SelectionViewDelegate?
    
    var pos: String?
    //初始化方法
//    convenience init(buttonCount: Int) {
//        self.init(frame: .zero)
//        createButtons(count:buttonCount)
//    }

//    required init?(coder aDecoder: NSCoder) {
//            super.init(coder: aDecoder)
//            setUpView()
//        }
    
    init(pos: String){
        super.init(frame: .zero)
        self.pos = pos
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    // 包含createButton()和SetView()
    func buildView(){
        // 根據這個sectionView(self)是Top/ Bottom去放入對應的按鈕數量
        createButtons(count: dataSource?.numberOfOptions(for: self) ?? 0)
        setUpView()
    }
    
    
    private func setUpView() {
        backgroundColor = .black
        
        // Create indicator view
        indicatorView = UIView()
        indicatorView.backgroundColor = .white
        addSubview(indicatorView)
        
        // Create custom view
        customView = UIView()
        addSubview(customView)
       
        // Add constraints
       translatesAutoresizingMaskIntoConstraints = false
       indicatorView.translatesAutoresizingMaskIntoConstraints = false
       customView.translatesAutoresizingMaskIntoConstraints = false
        
        // Set constraints for indicator view
        NSLayoutConstraint.activate([
            indicatorView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 35),
            indicatorView.topAnchor.constraint(equalTo: buttons[0].bottomAnchor),
            indicatorView.widthAnchor.constraint(equalToConstant: 70),
            indicatorView.heightAnchor.constraint(equalToConstant: 2)
        ])
                
        // Set constraints for custom view
        NSLayoutConstraint.activate([
            customView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15),
            customView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 15),
            customView.topAnchor.constraint(equalTo: indicatorView.bottomAnchor),
            customView.heightAnchor.constraint(equalToConstant: 50)
        ])
        
    }
    
    private func createButtons(count: Int) {
        for buttonIndex in 0..<count {
            let button = UIButton(type: .system)
            button.backgroundColor = .black
            button.setTitle(dataSource?.textForOption(at: buttonIndex), for: .normal)
            button.setTitleColor(dataSource?.optionTextColor, for: .normal)
            
            // button的identifier，幫助我們知道這是第幾個button（button.tag 就是button的標籤）
            button.tag = buttonIndex

            buttons.append(button)
            addSubview(button)
            
            // addTarget for button，在使用這按下button的時候，會執行buttonTapped function
           button.addTarget(self, action: #selector(buttonTapped(_:)), for: .touchUpInside)
                       
            
            // Add constraints for buttons
            
            // if pos == "Top" -> 寬度大
            // else if pos == "Bottom" -> 寬度小
            button.translatesAutoresizingMaskIntoConstraints = false
            if buttonIndex == 0{
               NSLayoutConstraint.activate([
                   button.leadingAnchor.constraint(equalTo: leadingAnchor),
                   button.topAnchor.constraint(equalTo: topAnchor),
                   button.widthAnchor.constraint(equalToConstant: 120),
                   button.heightAnchor.constraint(equalToConstant: 50)
               ])
           }else{
               // 拿前一個button，用前一個button的trailingAnchor去對現在這個button的leadingAnchor
               let previous_button = buttons[buttonIndex - 1]
               NSLayoutConstraint.activate([
                   button.leadingAnchor.constraint(equalTo: previous_button.trailingAnchor),
                   button.topAnchor.constraint(equalTo: topAnchor),
                   button.widthAnchor.constraint(equalToConstant: 120),
                   button.heightAnchor.constraint(equalToConstant: 50)
               ])
           }
    
        }
        
    }
    
    @objc func buttonTapped(_ sender: UIButton){
        // 用delegate?.shouldSelectedButton(...)，
        
        
        
    }
    


}

