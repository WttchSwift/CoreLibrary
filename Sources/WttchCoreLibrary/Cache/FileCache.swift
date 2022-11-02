//
//  File.swift
//  
//
//  Created by Wttch on 2022/11/2.
//

import Foundation

class FileCache {
    private static var basePath : String?
    
    public static var cachePath: String {
        get {
            guard let path = basePath else {
                NSLog("cache路径未初始化, 进行初始化!")
                let tmpRoot = NSTemporaryDirectory() as String
                // 由于没有应用所以会到临时根目录，先加一个自定义名称
                let basePath: String = tmpRoot + "wttch_cache"
                let fileManager = FileManager.default
                if !fileManager.fileExists(atPath: basePath) {
                    do {
                        try fileManager.createDirectory(atPath: basePath, withIntermediateDirectories: true)
                        NSLog("已创建cache文件夹.")
                    } catch {
                        NSLog("创建cache文件夹失败:\(error)")
                    }
                }
                NSLog("cache路径已初始化: \(basePath)")
                self.basePath = basePath
                return basePath
            }
            
            return basePath!
        }
    }
}
