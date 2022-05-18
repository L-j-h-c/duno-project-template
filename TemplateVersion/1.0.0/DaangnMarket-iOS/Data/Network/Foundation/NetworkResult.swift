//
//  NetworkResult.swift
//  DaangnMarket-iOS
//
//  Created by Junho Lee on 2022/05/18.
//

import Foundation

enum NetworkResult<T> {
    case success(T)
    case requestErr(T)
    case pathErr
    case serverErr
    case networkFail
}
