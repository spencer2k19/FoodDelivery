//
//  CartRepositoryImpl.swift
//  Food Delivery
//
//  Created by Loic HACHEME on 26/10/2023.
//

import Foundation
import CoreData
import Alamofire
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
    
    func addOrder(with data: [String: Any]) async throws {
        do {
            
            //add order api
            var request = GenericRequest()
            request.method = .post
            request.path = ApiConstants.ORDERS_URL
            request.parameters = data
            request.encoding = JSONEncoding.default
            let _: EmptyData = try await ApiRequest.request(request)
            
            
            //remove all data in CoreData
            let fetchRequest:NSFetchRequest<NSFetchRequestResult> = NSFetchRequest(entityName: entityName)
            let deleteRequest = NSBatchDeleteRequest(fetchRequest: fetchRequest)
            try container.viewContext.execute(deleteRequest)
            save()
           
        } catch let error {
            throw error
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
    
    func increaseFoodQuantity(foodId: Int64) throws {
        do {
            let savedFoods = try getFoods()
            if let foodEntity = savedFoods.first(where: {$0.id == foodId}) {
                // Update a current food entity
                foodEntity.quantity += 1
                save()
            }
        } catch let error {
           throw error
        }
       
    }
    
    func removeFoodFromCart(foodId: Int64) throws {
        do {
            let savedFoods = try getFoods()
            if let food = savedFoods.first(where: {$0.id == foodId}) {
                if food.quantity  == 1 {
                    container.viewContext.delete(food)
                } else {
                    food.quantity -= 1
                }
                save()
            }
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
    
   
  
    
}
