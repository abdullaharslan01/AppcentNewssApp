//
//  ANImageView.swift
//  AppcentNewsApp
//
//  Created by abdullah on 11.05.2024.
//

import UIKit

class ANImageView: UIImageView {
    
    private var imageDownloadTask: URLSessionDataTask?

    let placeholderImage = UIImage(named: ANImages.placeHolder)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

    private func configure(){
        layer.cornerRadius      = 5
        clipsToBounds           = true
        image                   = placeholderImage
        translatesAutoresizingMaskIntoConstraints = false
    }
    
    
    func downloadImage(from urlString: String) {
        guard let url = URL(string: urlString) else {return}
        
        imageDownloadTask = URLSession.shared.dataTask(with: url, completionHandler: {[weak self] data, response, error in
            guard let self = self else {return}
            
            if error != nil {return}
            
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {return}
            
            guard let data = data else {return}
            
            guard let image = UIImage(data: data) else {return}
            
            DispatchQueue.main.async {
                self.image = image
            }
            
        }

        )
        imageDownloadTask?.resume()
        
        
        
    }
    
    func cancelDownloading(){
        imageDownloadTask?.cancel()
        imageDownloadTask = nil
    }
    
}
