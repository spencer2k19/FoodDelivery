//
//  BaseViewModel.swift
//  Food Delivery
//
//  Created by Loic HACHEME on 05/10/2023.
//

import Foundation

class BaseViewModel: ObservableObject {
    @Published var busyForObject: [String: Bool] = [:]
    @Published var isBusy = false
    @Published var errorWrapper: ErrorWrapper? = nil
    
    func setBusyForObject(for key: String, value: Bool) async {
        await MainActor.run(body: {
            busyForObject[key] = value
        })
    }
    
    func setBusy(value: Bool) async {
        await MainActor.run(body: {
            errorWrapper = nil
            isBusy = value
        })
    }
    
    func setError(error: Error, _ guidance: String = "") async {
        await MainActor.run(body: {
            errorWrapper = ErrorWrapper(error: error, guidance: guidance)
        })
    }
    
    func isBusyForObject(for key: String) -> Bool {
        return busyForObject[key] ?? false
    }
}
