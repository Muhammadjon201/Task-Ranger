//
//  OnboardingCollectionViewCell.swift
//  Task-Ranger
//
//  Created by ericzero on 1/21/23.
//

import UIKit
import SnapKit

class OnboardingCollectionViewCell: UICollectionViewCell {
    
    lazy var onboardImg: UIImageView = {
        let onboardImg = UIImageView()
        onboardImg.contentMode = .scaleAspectFill
        return onboardImg
    }()
    
    lazy var onboardTitle: UILabel = {
        let onboardTitle  = UILabel()
        onboardTitle.numberOfLines = 1
        onboardTitle.font = UIFont.systemFont(ofSize: 20, weight: .ultraLight)
        onboardTitle.textAlignment = .center
        return onboardTitle
    }()
    
    lazy var onboardDescription: UILabel = {
        let onboardDescription  = UILabel()
        onboardDescription.numberOfLines = 0
        onboardDescription.font = UIFont.systemFont(ofSize: 15, weight: .thin)
        onboardDescription.textAlignment = .center
        return onboardDescription
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.backgroundColor = .white
        setUp()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setUp(){
        contentView.addSubview(onboardImg)
        contentView.addSubview(onboardTitle)
        contentView.addSubview(onboardDescription)
        
        onboardImg.snp.makeConstraints { make in
            make.top.equalTo(contentView).offset(50)
            make.centerX.equalToSuperview()
            make.width.equalToSuperview().multipliedBy(0.7)
            make.height.equalTo(onboardImg.snp.width).multipliedBy(0.7)
        }
        
        onboardTitle.snp.makeConstraints { make in
            make.top.equalTo(onboardImg.snp.bottom).offset(50)
            make.centerX.equalTo(contentView)
            
        }
        
        onboardDescription.snp.makeConstraints { make in
            make.top.equalTo(onboardTitle.snp.bottom).offset(50)
            make.left.equalTo(contentView).offset(10)
            make.right.equalTo(contentView).offset(-10)
            //make.bottom.equalTo(contentView).offset(-10)
        }
        
    }
    
    func updateCell(data: Onboarding){
        onboardImg.image = data.image
        onboardTitle.text = data.title
        onboardDescription.text = data.description
    }
    
}
