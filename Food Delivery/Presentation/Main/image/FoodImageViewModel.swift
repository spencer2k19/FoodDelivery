//
//  FoodImageViewModel.swift
//  Food Delivery
//
//  Created by Loic HACHEME on 19/10/2023.
//

import Foundation
import SwiftUI


class FoodImageViewModel: BaseViewModel {
    
    @Published var image:UIImage? = nil
    private var useCase = UserUseCase()
    
    private var path: String = ""
    
    required init(imageName: String) {
        super.init()
        self.path = ApiConstants.ASSETS_URL + "/\(imageName)"
        Task { [weak self] in
            try? await self?.downloadImageData()
        }
        
    }
    
    private func downloadImageData() async throws {
        do {
            await setBusy(value: true)
            let data = try await useCase.downloadFile(path: path)
            await setBusy(value: false)
            await MainActor.run(body: {
              self.image = UIImage(data: data)
            })
        } catch let error {
            await setBusy(value: false)
            print(error)
        }
    }
}
