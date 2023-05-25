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
    
    //SelectionView --> 按下button的那個SelectionView
    //at index --> 按下的是第幾個button
    @objc optional func didSelectedButton(_ selectionView: SelectionView, at index: Int)

    @objc optional func shouldSelectedButton(_ selectionView: SelectionView, at index: Int) -> Bool
}


class ViewController: UIViewController, SelectionViewDataSource, SelectionViewDelegate {
    

    // pos -> position
    let selectionViewTop = SelectionView(pos: "Top")
    let selectionViewBottom = SelectionView(pos: "Bottom")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        selectionViewTop.dataSource = self
        selectionViewTop.delegate = self
        
        selectionViewBottom.dataSource = self
        selectionViewBottom.delegate = self
        
        // 確定建立dataSource後再建立畫面
        selectionViewTop.buildView()
        selectionViewBottom.buildView()
        
        view.addSubview(selectionViewTop)
        view.addSubview(selectionViewBottom)
        
        
        // Add constraints
        selectionViewTop.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            selectionViewTop.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            selectionViewTop.topAnchor.constraint(equalTo: view.topAnchor, constant: 100),
            selectionViewTop.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            selectionViewTop.heightAnchor.constraint(equalToConstant: 200)
        ])

        selectionViewBottom.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([selectionViewBottom.leadingAnchor.constraint(equalTo: view.leadingAnchor), selectionViewBottom.topAnchor.constraint(equalTo: selectionViewTop.bottomAnchor), selectionViewBottom.trailingAnchor.constraint(equalTo: view.trailingAnchor), selectionViewBottom.heightAnchor.constraint(equalToConstant: 200)])
        
        
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
    
//MARK: Delegate
    
    var colorArray = [UIColor.red, UIColor.yellow, UIColor.blue]
    
//conform to protocol
    //點擊button但未執行完畢
    @objc func shouldSelectedButton(_ selectionView: SelectionView, at index: Int) -> Bool {
        
        //判斷可不可以"更改selectionView的顏色"，可以的話return true, 不行則return false
        //在“操作下面的view"時，且"上面view為黃色"時 -->不能變色
        if (selectionView == selectionViewBottom) && (selectionViewTop.backgroundColor == .yellow) {
            return false
        } else {
            return true //跳到didSelect，執行變色
        }
        
}
    //選擇button執行完畢
    @objc func didSelectedButton(_ selectionView: SelectionView, at index: Int) {
        
        //1. 更改selectionView的背景顏色
        selectionView.customView.backgroundColor = colorArray[index] //依據button的index(sender tag)去改變顏色
        

        //2. 此時重新設定indicaterView的位置，跟著button的x位置
        UIView.animate(withDuration: 0.3) {
            // indicator新的位置(x)會是 按下的那個button(buttons[sender.tag])的位置(x)
            selectionView.indicatorView.frame.origin.x = selectionView.buttons[index].frame.origin.x
        }

    }
    
    

}
