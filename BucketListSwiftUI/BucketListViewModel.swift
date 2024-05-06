//
//  BucketListViewModel.swift
//  BucketListSwiftUI
//
//  Created by Tatiana on 9/2/23.
//

import Foundation

class BucketListViewModel: ObservableObject {
    @Published var listItems: [BucketListItemModel] = [BucketListItemModel(name: "See the ocean"), BucketListItemModel(name: "Buy a house"), BucketListItemModel(name: "Visit Japan"), BucketListItemModel(name: "Visit Japan222")]
    
    // MARK: - CRUD functions
    func createItem(name: String) {
        let newItem = BucketListItemModel(name: name)
        listItems.append(newItem)
        saveToPersistenceStore()
    }
    
    func toggleIsCompleted(item: BucketListItemModel) {
        guard let index = listItems.firstIndex(of: item) else { return }
        listItems[index].isCompleted.toggle()
        saveToPersistenceStore()
    }
    
    func deleteItem(index: IndexSet) {
        listItems.remove(atOffsets: index)
        saveToPersistenceStore()
    }
    
    // MARK: Persistence
    func createPersistenseStore() -> URL {
        let url = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        let fileURL = url[0].appendingPathComponent("BucketList.json")
        return fileURL
    }
    
    func saveToPersistenceStore() {
        do {
            let data = try JSONEncoder().encode(listItems)
            try data.write(to: createPersistenseStore())
        } catch {
            print("Error while saving the list items111")
        }
    }

    // new comment1
    
    func loadFromPersistenceStore() {
        do {
            let data = try Data(contentsOf: createPersistenseStore())
            listItems = try JSONDecoder().decode([BucketListItemModel].self, from: data)
        } catch {
            print("Error while saving")
        }
    }
}
