//
//  BottomSelectView.swift
//  PickerViewDemo
//
//  Created by fei on 2017/8/23.
//  Copyright © 2017年 self. All rights reserved.
//

import UIKit

/**
 *  底部弹出选择框
 */

open class BottomSelectView: BottomSelectBasicView,UIPickerViewDataSource,UIPickerViewDelegate {
    
    var delegate:BottomSelectViewDelegate?
    
    var pickView = UIPickerView()
    //第一列数据
    var dataArray_First = Array<SelectItemModel>()
    //第二列数据，可为空 两组数据独立无关联
    var dataArray_Second = Array<SelectItemModel>()
    
    
    
     override public func setMemberVariable()  {
        super.setMemberVariable()
        
        
        
        pickView.frame = CGRect(x: 0, y: Button_Height, width: UIScreen.main.bounds.width, height: View_Height-Button_Height)
        pickView.dataSource = self;
        pickView.delegate  = self;
        pickView.backgroundColor = UIColor.white
        pickView.showsSelectionIndicator = true;
        self.addSubview(pickView)
        
                
        let lineView1 = UIView(frame: CGRect(x: 0, y: Button_Height+65, width: self.frame.size.width, height: 0.5))
        lineView1.backgroundColor = UIColor(red: 0.85, green: 0.85, blue: 0.85, alpha: 1)
        self.addSubview(lineView1)
        
        let lineView2 = UIView(frame: CGRect(x: 0, y: Button_Height+95, width: self.frame.size.width, height: 0.5))
        lineView2.backgroundColor = UIColor(red: 0.85, green: 0.85, blue: 0.85, alpha: 1)
        self.addSubview(lineView2)
        
        pickView.reloadAllComponents()
        
                
        
        
    }
    
   override public  func sureButtonClicked() {
        
        if dataArray_Second.count > 0 {
            delegate?.bottomSelctView(selectView: self, didSelectFirstIndex: pickView.selectedRow(inComponent: 0), secondIndex: pickView.selectedRow(inComponent: 1))
        } else {
            delegate?.bottomSelctView(selectView: self, didSelectFirstIndex: pickView.selectedRow(inComponent: 0))
        }
        super.sureButtonClicked()
    }
    
    
    
    
    
    // MARK: UIPickerView DataSource
    public func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return (dataArray_First.count > 0 ? 1 : 0) + (dataArray_Second.count > 0 ? 1:0)
    }
    
    public func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return component == 0 ? dataArray_First.count : dataArray_Second.count
    }
    
    public func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
        return 30
    }
    
    public func pickerView(_ pickerView: UIPickerView, widthForComponent component: Int) -> CGFloat {
        return dataArray_Second.count > 0 ? 150 : 200;
    }
    
    public func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        let item:SelectItemModel = component == 0 ? (dataArray_First[row]):(dataArray_Second[row])
        if view == nil {
            let nview = UIView(frame: CGRect(x: 0, y: 0, width: 150, height: 30))
            
            let label = UILabel(frame: CGRect(x: 0, y: 0, width: 150, height: 30))
            label.font = UIFont.systemFont(ofSize: 15);
            label.textAlignment = NSTextAlignment.center;
            label.textColor = UIColor.init(red: 0.3, green: 0.3, blue: 0.3, alpha: 1);
            label.tag = 201
            label.text = "\(item.itemId)-\(item.itemName)"
            nview.addSubview(label)
            return nview;
        } else {
            
            let label = view?.viewWithTag(201) as! UILabel
             label.text = "\(item.itemId)-\(item.itemName)"
        }
        
        return view!;
    }
    
    
}

public protocol BottomSelectViewDelegate:NSObjectProtocol {
     func bottomSelctView(selectView:BottomSelectView ,didSelectFirstIndex index:NSInteger);
    
     func bottomSelctView(selectView:BottomSelectView ,didSelectFirstIndex index:NSInteger ,secondIndex sIndex:NSInteger);
}
