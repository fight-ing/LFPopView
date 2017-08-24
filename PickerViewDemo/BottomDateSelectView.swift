//
//  BottomDateSelectView.swift
//  PickerViewDemo
//
//  Created by fei on 2017/8/23.
//  Copyright © 2017年 self. All rights reserved.
//

import UIKit

open class BottomDateSelectView: BottomSelectBasicView {

    var delegate:BottomDateSelectViewDelegate?
    let datePickerView = UIDatePicker()
    override public func setMemberVariable()  {
        super.setMemberVariable()
        
        datePickerView.frame = CGRect(x: 0, y: Button_Height, width: UIScreen.main.bounds.size.width, height: View_Height-Button_Height)
        datePickerView.minimumDate = NSDate(timeIntervalSince1970: 0) as Date
        datePickerView.maximumDate = NSDate(timeIntervalSinceNow: 0) as Date
        
        print(datePickerView.minimumDate,datePickerView.maximumDate)
        datePickerView.datePickerMode = UIDatePickerMode.date
//        datePickerView.addTarget(self, action: #selector(datePickerViewValueChanged), for: UIControlEvents.valueChanged)
        self.addSubview(datePickerView)
        
    }
    
    public override func sureButtonClicked() {
        delegate?.bottomDateSelectView(bottomView: self, didSelectDate: datePickerView.date as NSDate)
        super.sureButtonClicked()
    }
    
    
}

public protocol BottomDateSelectViewDelegate:NSObjectProtocol {
    func bottomDateSelectView(bottomView:BottomDateSelectView,didSelectDate date:NSDate)
}

