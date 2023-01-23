//
//  CalendarViewController.swift
//  Task-Ranger
//
//  Created by ericzero on 1/22/23.
//

import UIKit
import SnapKit

class CalendarViewController: UIViewController {
    
    lazy var addTaskLbl: UILabel = {
        let addTaskLbl  = UILabel()
        addTaskLbl.numberOfLines = 1
        addTaskLbl.font = UIFont.systemFont(ofSize: 20, weight: .semibold)
        addTaskLbl.textAlignment = .center
        addTaskLbl.text = "Add Task"
        addTaskLbl.textColor = .white
        return addTaskLbl
    }()
    
    lazy var backView: UIView = {
        let backView = UIView()
        backView.backgroundColor = .white
        return backView
    }()
    
    lazy var startLbl: UILabel = {
        let startLbl = UILabel()
        startLbl.text = "Start"
        startLbl.textColor = UIColor(named: "baseBlueColor")
        startLbl.font = .systemFont(ofSize: 14, weight: .medium)
        return startLbl
    }()
    
    lazy var endLbl: UILabel = {
        let endLbl = UILabel()
        endLbl.text = "Ends"
        endLbl.textColor = UIColor(named: "baseBlueColor")
        endLbl.font = .systemFont(ofSize: 14, weight: .medium)
        return endLbl
    }()
    
    let startBtnBorderColor = UIColor(red: 238/255, green: 245/255, blue: 253/255, alpha: 1)
    
    lazy var startBtn: UIButton = {
        let startBtn = UIButton(type: .system)
        startBtn.setTitle("Start", for: .normal)
        startBtn.setImage(UIImage(named: "Vector1"), for: .normal)
        startBtn.clipsToBounds = true
        startBtn.layer.cornerRadius = 10
        startBtn.layer.borderWidth = 1
        startBtn.layer.borderColor = startBtnBorderColor.cgColor
        startBtn.addTarget(self, action: #selector(startBtnTapped), for: .touchUpInside)
        return startBtn
    }()
    
    lazy var endBtn: UIButton = {
        let endBtn = UIButton(type: .system)
        endBtn.setTitle("Ends", for: .normal)
        endBtn.setImage(UIImage(named: "Vector1"), for: .normal)
        endBtn.layer.cornerRadius = 10
        endBtn.layer.borderWidth = 1
        endBtn.layer.borderColor = startBtnBorderColor.cgColor
        endBtn.addTarget(self, action: #selector(endsBtnTapped), for: .touchUpInside)
        return endBtn
    }()
    
    var isStartBtnSelected = false
    var isEndBtnSelected = false
   
    @objc func startBtnTapped(){
        if !isStartBtnSelected {
            startBtn.backgroundColor = UIColor(named: "CalendarBtnColor")
            endBtn.backgroundColor = .white
            isStartBtnSelected = true
            isEndBtnSelected = false
        } else {
            startBtn.backgroundColor = .white
            isStartBtnSelected = false
        }
    }
    
    @objc func endsBtnTapped(){
        if !isEndBtnSelected {
            endBtn.backgroundColor = UIColor(named: "CalendarBtnColor")
            startBtn.backgroundColor = .white
            isEndBtnSelected = true
            isStartBtnSelected = false
        } else {
            endBtn.backgroundColor = .white
            isEndBtnSelected = false
        }
    }


    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(named: "baseBlueColor")
        setUp()
    }
    
    func setUp(){
        view.addSubview(addTaskLbl)
        view.addSubview(backView)
        backView.addSubview(startLbl)
        backView.addSubview(endLbl)
        backView.addSubview(startBtn)
        backView.addSubview(endBtn)
        
        addTaskLbl.snp.makeConstraints { make in
            make.top.equalTo(80)
            make.centerX.equalToSuperview()
        }
        
        backView.snp.makeConstraints { make in
            make.left.equalToSuperview()
            make.right.equalToSuperview()
            make.bottom.equalToSuperview()
            make.height.equalTo(view.snp.height).multipliedBy(0.75)
        }
        
        backView.layer.cornerRadius = 50
        backView.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        
        startLbl.snp.makeConstraints { make in
            make.top.equalTo(33)
            make.left.equalTo(21)
        }
        
        endLbl.snp.makeConstraints { make in
            make.top.equalTo(33)
            //make.right.equalTo(-21)
            make.left.equalTo(endBtn.snp.left)
        }
        
        startBtn.snp.makeConstraints { make in
            make.top.equalTo(startLbl.snp.bottom).offset(5)
            make.left.equalTo(21)
            make.height.equalTo(48)
            make.width.equalTo(160)
        }
        
        endBtn.snp.makeConstraints { make in
            make.top.equalTo(endLbl.snp.bottom).offset(5)
            make.right.equalTo(-21)
            make.height.equalTo(48)
            make.width.equalTo(160)
        }
    }

}
