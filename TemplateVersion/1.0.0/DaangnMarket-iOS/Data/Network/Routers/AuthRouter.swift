//
//  AuthRouter.swift
//  DaangnMarket-iOS
//
//  Created by Junho Lee on 2022/05/18.
//

import Foundation
import Alamofire

enum AuthRouter {
    case requestSignUp(email: String, name: String, pw: String)
    case requestSignIn(email: String, pw: String)
    case upload(image: UIImage)
}

extension AuthRouter: BaseRouter {
    
    var header: HeaderType {
        switch self {
        case .upload:
            return .multiPart
        default: return .default
        }
    }
    
    var path: String {
        switch self {
        case .requestSignUp:
            return "/auth/signup"
        case .requestSignIn:
            return "/auth/"
        case .upload:
            return "/feed"
        default: return ""
        }
    }
    
    var method: HTTPMethod {
        switch self {
        case .requestSignUp, .requestSignIn:
            return .post
        default: return .post
        }
    }
    
    var parameters: RequestParams {
        switch self {
        case .requestSignUp(let email, let name, let pw):
            let body: [String : Any] = [
                "email": email,
                "name": name,
                "password": pw
            ]
            return .requestParameters(body)
        case .requestSignIn(let email, let pw):
            let body: [String : Any] = [
                "email": email,
                "password": pw
            ]
            return .requestParameters(body)
        default:
            return .requestPlain
        }
    }
    
    var multipart: MultipartFormData {
        switch self {
        case .upload(let image):
            let multiPart = MultipartFormData()
            
            let images = UIImage(systemName: "photo")
            
            let contentStr = "안녕하세요"
            let userNameStr = "안현주친구"
            let profileURL = "https://thesopt.s3.ap-northeast-2.amazonaws.com/sample-profile-picture.png"
            
            let content = contentStr.data(using: .utf8) ?? Data()
            let userprofile = profileURL.data(using: .utf8) ?? Data()
            let userName = userNameStr.data(using: .utf8) ?? Data()
            let imageData = images?.pngData() ?? Data()
            
            multiPart.append(content, withName: "content")
            multiPart.append(userName, withName: "userName")
            multiPart.append(userprofile, withName: "userProfileImage")
            multiPart.append(imageData, withName: "image", fileName: "profileImage.png", mimeType: "image/png")
            
            return multiPart
        default: return MultipartFormData()
        }
    }
}
