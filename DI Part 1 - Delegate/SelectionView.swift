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
    convenience init(buttonCount: Int) {
        self.init(frame: .zero)
        createButtons(count:buttonCount)
    }
    
    //初始化方法
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpView()
    }
    
    required init?(coder aDecoder: NSCoder) {
            super.init(coder: aDecoder)
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
        
        
    }
    
    private func createButtons(count: Int) {
        
        for _ in 0..<count {
            let button = UIButton(type: .system)
            button.backgroundColor = .clear
            buttons.append(button)
            addSubview(button)
        }
        
        // Add constraints for buttons
        
        
    }
    
    weak var dataSource: SelectionViewDataSource?
    
    
    
        
    


}

