//
//  PostDetailVC.swift
//  DaangnMarket-iOS
//
//  Created by Junho Lee on 2022/05/16.
//

import UIKit

import RxSwift
import RxCocoa
import SnapKit

final class PostDetailVC: BaseVC, Storyboarded {
    
    static var storyboard: Storyboards = .postDetail
    
    // MARK: - Properties
    
    
    // MARK: - Life Cycles
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .blue
        
        AuthService.shared.uploadPicture() { networkResult in
            switch networkResult {
            
            case .success(_):
                break;
            default: break;
            }
        }
        
        AuthService.shared.requestSignIn(email: "iOS@sopt.org", pw: "123456") { networkResult in
            switch networkResult {
            
            case .success(_):
                break;
            default: break;
            }
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
    }
    
    // MARK: - Bind
    
    // MARK: - Custom Methods
    
    
    // MARK: - UI & Layout
    
}

