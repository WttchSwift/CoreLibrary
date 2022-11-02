//
//  SwiftUIView.swift
//  
//
//  Created by Wttch on 2022/11/2.
//

import SwiftUI

class WebLoader: ObservableObject {
    @Published var cacheFileName: String? = nil
    
    func downloadImage(urlStr: String) {
        let url = URL(string: urlStr)!
        let fileName = FileCache.cachePath + "/" + urlStr.sha1()
        let fileManager = FileManager.default
        
        if !fileManager.fileExists(atPath: fileName) {
            fileManager.createFile(atPath: fileName, contents: nil)
        }
        
        let fileHandler = FileHandle(forWritingAtPath: fileName)
        
        let task = URLSession.shared.dataTask(with: url) {
            (data, response, error) in
            guard let data = data else { return }
            fileHandler?.write(data)
            self.cacheFileName = urlStr
        }
        NSLog("开始下载\(urlStr)")
        task.resume()
    }
}

struct WebImage: View {
    @State var state: String = "未下载"
    @State var webLoader: WebLoader
    var url: String
    var urlSha1: String
    
    init( url: String) {
        self.url = url
        self.urlSha1 = url.sha1()
        self.webLoader = WebLoader()
        self.webLoader.downloadImage(urlStr: self.url)
    }
    
    var body: some View {
        VStack {
            if let fileName = self.webLoader.cacheFileName {
                Image(nsImage: NSImage(contentsOfFile: fileName)!)
            } else {
                Text("\(state)")
            }
        }
    }
    
    
}

struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        WebImage(url: "https://icon.jx3box.com/icon/2589.png")
            .frame(width: 120, height: 120)
    }
}
