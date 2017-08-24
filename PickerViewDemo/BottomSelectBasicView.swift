//
//  BottomSelectBasicView.swift
//  PickerViewDemo
//
//  Created by fei on 2017/8/23.
//  Copyright © 2017年 self. All rights reserved.
//

import UIKit

open class BottomSelectBasicView: UIView {
    
    let Button_Width:CGFloat = 60
    let Button_Height:CGFloat = 40
    let Space_Width:CGFloat = 10
    
    let View_Height:CGFloat = 200
    
    
    var backControl = UIControl();
    
    
    //第一列附加标题，Default ""
    var firstAddString = ""
    //第二列附加标题，Default ""
    var secondAddString = ""
    //确定
    var sureButton = UIButton(type: UIButtonType.custom)
    //取消
    var cancelButton = UIButton(type: UIButtonType.custom)
    //点击背景消失 Default true
    var canTouchDisappear = true
    //按钮标题颜色，默认灰色darkGray
    var buttonTitleColor = UIColor.darkGray
    //view背景色，默认白色white
    var viewBackGroundColor = UIColor.white
    
    
    public func showWithAnimation(animate:Bool) {
        setMemberVariable();
        
        
        backControl.alpha = 0;
        
        UIView.animate(withDuration: 0.2, animations: {
            self.frame = CGRect(x: 0, y: UIScreen.main.bounds.height-self.View_Height, width: UIScreen.main.bounds.width, height: self.View_Height)
            self.backControl.alpha = 1;
        }) { (finished) in
            
        }
    }
    
    public func setMemberVariable() {
        self.frame = CGRect(x: 0, y: UIScreen.main.bounds.height, width: UIScreen.main.bounds.width, height: View_Height)
        
        sureButton.frame = CGRect(x: self.frame.size.width-Button_Width-Space_Width, y: 0, width: Button_Width, height: Button_Height)
        sureButton .setTitle("确定", for: UIControlState.normal)
        sureButton.setTitleColor(buttonTitleColor, for: UIControlState.normal)
        sureButton.addTarget(self, action: #selector(sureButtonClicked), for: UIControlEvents.touchUpInside)
        sureButton.titleLabel?.font = UIFont.systemFont(ofSize: 14)
        self.addSubview(sureButton)
        
        cancelButton.frame = CGRect(x: Space_Width, y: 0, width: Button_Width, height: Button_Height)
        cancelButton .setTitle("取消", for: UIControlState.normal)
        cancelButton.setTitleColor(buttonTitleColor, for: UIControlState.normal)
        cancelButton.addTarget(self, action: #selector(cancelButtonClicked), for: UIControlEvents.touchUpInside)
        cancelButton.titleLabel?.font = UIFont.systemFont(ofSize: 14)
        self.addSubview(cancelButton)
        
        self.backgroundColor = self.viewBackGroundColor
        
        
        
        backControl = UIControl(frame: UIScreen.main.bounds)
        backControl.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.4)
        backControl.addSubview(self)
        
        UIApplication.shared.keyWindow?.addSubview(backControl);
        UIApplication.shared.keyWindow?.bringSubview(toFront: backControl)
        backControl.isUserInteractionEnabled = true;
        if canTouchDisappear {
            let tap = UITapGestureRecognizer.init(target: self, action: #selector(tapGesture))
            backControl.addGestureRecognizer(tap)
        }

        
        let lineView = UIView(frame: CGRect(x: 0, y: Button_Height-0.5, width: self.frame.size.width, height: 0.5))
        lineView.backgroundColor = UIColor(red: 0.85, green: 0.85, blue: 0.85, alpha: 1)
        self.addSubview(lineView)
    }

    public func sureButtonClicked() {
        
        
        hideWithAnimation(animate: true)
    }
    
    func cancelButtonClicked()  {
        hideWithAnimation(animate: true)
    }
    
    public func hideWithAnimation(animate:Bool) {
        UIView.animate(withDuration: 0.2, animations: {
            self.frame = CGRect(x: 0, y: UIScreen.main.bounds.height, width: UIScreen.main.bounds.width, height: self.View_Height)
            self.backControl.alpha = 0
        }) { (finished) in
            self .removeFromSuperview()
            self.backControl.removeFromSuperview()
        }
    }
    
    func tapGesture() {
        hideWithAnimation(animate: true)
    }
    

}
