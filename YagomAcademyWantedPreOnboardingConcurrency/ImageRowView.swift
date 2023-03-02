//
//  ImageCell.swift
//  YagomAcademyWantedPreOnboardingConcurrency
//
//  Created by Kyu Yeol Jeong on 2023/03/02.
//

import UIKit

class ImageRowView: UIView {
    
    @IBOutlet private weak var imageView: UIImageView!
    @IBOutlet private weak var progressView: UIProgressView!
    
    var imageURL: URL!
    private var defaultImage: UIImage!
    private var session: URLSession!
    
    @IBAction func loadImage(_ sender: Any) {
        if defaultImage == nil {
            defaultImage = imageView.image
        }
        imageView.image = defaultImage
        progressView.setProgress(0, animated: false)
        
        if session == nil {
            session = URLSession(configuration: URLSessionConfiguration.ephemeral, delegate: self, delegateQueue: OperationQueue.main)
        }
        let request = URLRequest(url: imageURL)
        let task = session.downloadTask(with: request)
        task.resume()
    }
}

extension ImageRowView: URLSessionDownloadDelegate {

    func urlSession(_ session: URLSession, downloadTask: URLSessionDownloadTask, didWriteData bytesWritten: Int64, totalBytesWritten: Int64, totalBytesExpectedToWrite: Int64) {
        let value = Float(totalBytesWritten/totalBytesExpectedToWrite)
        progressView.setProgress(value, animated: false)
    }
    
    func urlSession(_ session: URLSession, downloadTask: URLSessionDownloadTask, didFinishDownloadingTo location: URL) {
        guard let data: NSData = NSData(contentsOf: location) else {
            return
        }
        guard data.length > 0 else {
            return
        }
        guard let image = UIImage(data: data as Data) else {
            return
        }
        imageView.image = image
    }
}
