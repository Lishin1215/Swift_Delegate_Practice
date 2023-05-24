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
    
    //初始化方法
//    convenience init(buttonCount: Int) {
//        self.init(frame: .zero)
//        createButtons(count:buttonCount)
//    }
//
//    //初始化方法
//    override init(frame: CGRect) {
//        super.init(frame: frame)
//        setUpView()
//    }
//
//    required init?(coder aDecoder: NSCoder) {
//            super.init(coder: aDecoder)
//            setUpView()
//        }
    
    init(){
        super.init(frame: .zero)
        setUpView()
        // 根據這個sectionView(self)是Top/ Bottom去放入對應的按鈕數量
        createButtons(count: dataSource?.numberOfOptions(for: self) ?? 0)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
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
        
        for _ in 0..<count {
            let button = UIButton(type: .system)
            button.backgroundColor = .clear
            buttons.append(button)
            addSubview(button)
            
            // Add constraints for buttons
            button.translatesAutoresizingMaskIntoConstraints = false
            NSLayoutConstraint.activate([
                button.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 35),
                button.topAnchor.constraint(equalTo: topAnchor, constant: 40),
                button.widthAnchor.constraint(equalTo: widthAnchor),
                button.heightAnchor.constraint(equalToConstant: 40)
            ])
            
        }
        
    }
    
    weak var dataSource: SelectionViewDataSource?
    weak var delegate: SelectionViewDelegate?
    
    
    
        
    


}

