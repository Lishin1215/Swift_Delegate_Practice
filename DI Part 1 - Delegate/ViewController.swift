//
//  ViewController.swift
//  DI Part 1 - Delegate
//
//  Created by 簡莉芯 on 2023/5/24.
//

import UIKit

protocol SelectionViewDataSource: AnyObject {
    
    func numberOfOptions(for selectionView: SelectionView) -> Int
    func textForOption(at index: Int) -> String
    var underlineColor: UIColor {get} //只能取得數字，不能設定
    var optionTextColor: UIColor {get}
    var optionTextFont: UIFont {get}

    
}

@objc protocol SelectionViewDelegate: AnyObject {
    
    @objc optional func didSelectedButton(_ selectionView: SelectionView, at index: Int)

    @objc optional func shouldSelectedButton(_ selectionView: SelectionView, at index: Int) -> Bool
}


class ViewController: UIViewController, SelectionViewDataSource, SelectionViewDelegate {
    


    let selectionViewTop = SelectionView()
    let selectionViewBottom = SelectionView()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        selectionViewTop.dataSource = self
        selectionViewTop.delegate = self
        
        selectionViewBottom.dataSource = self
        selectionViewBottom.delegate = self
        
    }
    
//MARK: DataSource
    
    func numberOfOptions(for selectionView: SelectionView) -> Int{
        if selectionView == selectionViewTop{
            return 2
        } else if selectionView == selectionViewBottom{
            return 3
        }
        return 0
    }
    
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
    
    

}
