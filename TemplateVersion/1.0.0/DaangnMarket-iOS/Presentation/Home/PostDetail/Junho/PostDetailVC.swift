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
        AuthService.shared.uploadPicture(email: "", name: "", pw: "") { networkResult in
            switch networkResult {
                
            case .success:
                print("성공")
            case .requestErr(let status):
                print(status)

            case .pathErr:
                print("pathERRR")
            case .serverErr:
                print("serverE")
            case .networkFail:
                print("fail")
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

