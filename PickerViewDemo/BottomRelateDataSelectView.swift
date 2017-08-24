//
//  BottomRelateDataSelectView.swift
//  PickerViewDemo
//
//  Created by fei on 2017/8/23.
//  Copyright © 2017年 self. All rights reserved.
//

import UIKit

public class BottomRelateDataSelectView: BottomSelectBasicView,UIPickerViewDelegate,UIPickerViewDataSource {
    var delegate:BottomRelateDataSelectViewDelete?
    
    var pickView = UIPickerView()
    
    
    var dataSourceArray = Array<Dictionary<String,Array<String>>>()
    
    var currentSecondArray = Array<String>()
    
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
        
//        pickView.reloadAllComponents()
        
        
        refreshSecondData()
        
    }
    
    override public  func sureButtonClicked() {
        
        delegate?.bottomRelateDataSelectView(selectView: self, didSelectFirst: pickView.selectedRow(inComponent: 0), second: pickView.selectedRow(inComponent: 1))
        super.sureButtonClicked()
    }
    
    
    
    
    
    // MARK: UIPickerView DataSource
    public func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 2
    }
    
    public func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return component==0 ? dataSourceArray.count : currentSecondArray.count;
    }
    
    public func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
        return 30
    }
    
    public func pickerView(_ pickerView: UIPickerView, widthForComponent component: Int) -> CGFloat {
        return 150
    }
    
    public func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
//        let item:SelectItemModel = component == 0 ? (dataArray_First[row]):(dataArray_Second[row])
        var string = ""
        if component==0 {
            let dict = dataSourceArray[row];
            string = dict.keys.first!;
            

        } else {
            string = currentSecondArray[row]
        }
        
        if view == nil {
            let nview = UIView(frame: CGRect(x: 0, y: 0, width: 150, height: 30))
            
            let label = UILabel(frame: CGRect(x: 0, y: 0, width: 150, height: 30))
            label.font = UIFont.systemFont(ofSize: 15);
            label.textAlignment = NSTextAlignment.center;
            label.textColor = UIColor.init(red: 0.3, green: 0.3, blue: 0.3, alpha: 1);
            label.tag = 201
            label.text = string
            nview.addSubview(label)
            return nview;
        } else {
            
            let label = view?.viewWithTag(201) as! UILabel
            label.text = string
        }
        
        return view!;
    }
    
    
    public func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if component == 0 {
            refreshSecondData()
        }
    }
    
    func refreshSecondData() {
        let dict = dataSourceArray[pickView.selectedRow(inComponent: 0)];
        let key:String = dict.keys.first!;
        currentSecondArray = dict[key]!
        pickView .reloadComponent(1)
    }
}



public protocol BottomRelateDataSelectViewDelete:NSObjectProtocol {
    func bottomRelateDataSelectView(selectView:BottomRelateDataSelectView,didSelectFirst fIndex:NSInteger,second sIndex:NSInteger)
}

