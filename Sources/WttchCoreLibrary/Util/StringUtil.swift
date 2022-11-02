//
//  File.swift
//  
//
//  Created by Wttch on 2022/11/2.
//

import Foundation
import CryptoKit

extension String {
    /// 字符串utf8编码的sha1字符串
    /// - Parameter uppercase: sha1结果是否大写，默认小写
    /// - Returns: 字符串的utf8编码sha1字符串
    func sha1(_ uppercase: Bool = false) -> String {
        return self.data(using: .utf8)!.sha1(uppercase)
    }
}
