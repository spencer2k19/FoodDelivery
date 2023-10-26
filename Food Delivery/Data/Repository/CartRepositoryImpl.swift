//
//  CartRepositoryImpl.swift
//  Food Delivery
//
//  Created by Loic HACHEME on 26/10/2023.
//

import Foundation
import CoreData

class CartRepositoryImpl: CartRepository {
    
    private let container: NSPersistentContainer
    private let containerName = "CartContainer"
    private let entityName = "FoodEntity"
    static let instance = CartRepositoryImpl()
    
    
    private init() {
        container = NSPersistentContainer(name: containerName)
        container.loadPersistentStores { _, error in
            if let error = error {
                print("Error loading core data: \(error)")
            }
        }
    }
    
    private func save()   {
        do {
            try container.viewContext.save()
        } catch let error {
           print("Error saving to core data: \(error)")
        }
    }
    
    func getFoods() throws -> [FoodEntity]  {
        let request = NSFetchRequest<FoodEntity>(entityName: entityName)
        do {
            return try container.viewContext.fetch(request)
        } catch {
            throw error
        }
    }
    
    func addFoodToCart(food: Food) throws  {
        do {
            let savedFoods = try getFoods()
            if let foodEntity = savedFoods.first(where: {$0.id == Int64(food.id ?? 0)}) {
                // Update a current food entity
                foodEntity.quantity += 1
            } else {
                // Create a new Food entity
                let entity = FoodEntity(context: container.viewContext)
                entity.id = Int64(food.id ?? 0)
                entity.currency = food.currency ?? ""
                entity.image = food.image ?? ""
                entity.name = food.name ?? ""
                entity.price = food.price ?? 0.0
                entity.quantity = 1
                entity.restaurantId = Int64(food.restaurant ?? 0)
            }
            save()
        } catch let error {
            throw error
        }
    }
    
   
    func removeFoodFromCart(food: FoodEntity) {
        if food.quantity  == 1 {
            container.viewContext.delete(food)
        } else {
            food.quantity -= 1
        }
        save()
    }
    
    
}
