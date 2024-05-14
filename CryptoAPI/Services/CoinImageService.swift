//
//  CoinImageService.swift
//  CryptoAPI
//
//  Created by macOS on 11/05/2024.
//

import Foundation
import SwiftUI
import Combine

class CoinImageService {
    
    @Published var image: UIImage? = nil
    private var imageSuncription: AnyCancellable?
    private let coin: CoinModel
    private let fileManager = LocalFileManager.instance
    private let folderName = "coin_image"
    private let imageName: String
    
    init(coin: CoinModel){
        self.coin = coin
        self.imageName = coin.id
        getCoinImage()
        
    }
    private func getCoinImage(){
        if let saveImage = fileManager.getImage(imageName: coin.id, folderName: folderName) {
            image = saveImage
            print("Retrieved image from File Manager!")
        } else {
            downloadCoinImage()
            print("Downloading image now!")
        }
    }
    private func downloadCoinImage(){
        print("Downloading image now")
        guard let url = URL(string: coin.image) else {return}
        
        // Đăng ký closure để xử lý hoàn thành và nhận giá trị từ publisher
        imageSuncription =  NetwokingManager.download(url: url)
            .tryMap({ (data) -> UIImage? in
                return UIImage(data: data)
            })
            //.decode(type: [CoinModel].self, decoder: JSONDecoder())
            .sink(receiveCompletion: NetwokingManager.handleCompletion, receiveValue: { [weak self] (returnedImage) in
                // Xử lý giá trị nhận được từ publisher
                // Gán giá trị nhận được cho thuộc tính allCoins của đối tượng self
                guard let self = self, let downloadImage = returnedImage else {return}
                self.image = downloadImage
                self.imageSuncription?.cancel()
                self.fileManager.saveImage(image: downloadImage, imageName: self.imageName, folderName: self.folderName)
            })
    }
    
}

