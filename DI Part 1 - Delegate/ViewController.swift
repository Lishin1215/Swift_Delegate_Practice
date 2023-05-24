//
//  ViewController.swift
//  DI Part 1 - Delegate
//
//  Created by 簡莉芯 on 2023/5/24.
//

import UIKit

protocol SelectionViewDataSource: AnyObject {
    
    var numberOfOptions: Int {get}
    func textForOption(at index: Int) -> String
    var underlineColor: UIColor {get}
    var optionTextColor: UIColor {get}
    var optionTextFont: UIFont {get}

}

@objc protocol SelectionViewDelegate: AnyObject {
    
    @objc optional func didSelectedButton(_ selectionView: SelectionView, at index: Int)

    @objc optional func shouldSelectedButton(_ selectionView: SelectionView, at index: Int) -> Bool
}


class ViewController: UIViewController, SelectionViewDataSource, SelectionViewDelegate {
    
    var numberOfOptions: Int = 2
    
    func textForOption(at index: Int) -> String {
        if index == 0 {
            return "Red"
        } else if index == 1 {
            return "Yellow"
        } else {
            return "Blue"
        }
    }
    
    var underlineColor: UIColor = .white
    
    var optionTextColor: UIColor = .white
    
    var optionTextFont: UIFont = UIFont.systemFont(ofSize: 18)
    

    let selectionView = SelectionView()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        selectionView.dataSource = self
        selectionView.delegate = self
        
    }
    

    

}
