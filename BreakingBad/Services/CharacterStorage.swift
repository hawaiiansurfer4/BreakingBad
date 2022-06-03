////
////  CharacterStorage.swift
////  BreakingBad
////
////  Created by Sean Murphy on 6/1/22.
////
//
//import UIKit
//import CoreData
//
//struct Simple {
//    @FetchRequest(
//        entity: CharacterModel.entity(),
//        sortDescriptors: []
//    ) var characters: FetchedResults<CharacterModel>
//}
//
//class CharacterStorage: NSObject, ObservableObject {
//    var characters = CurrentCharacter<[CharacterModel], Never>([])
//    var characterFetchController: NSFetchedResultsController<CharacterModel>
//    
//    static let shared: CharacterStorage = CharacterStorage()
//    
//    private override init() {
//        characterFetchController = NSFetchedResultsController {
//        fetchRequest: CharacterModel.FetchRequest()
//        managedObjectContext: PersistenceController.shared.container.viewConte
//        }
//    }
//}
//
//enum MemoryError: Error {
//    case memoryFull
//    case notSaved
//}
//
//class Memory: WebService {
//    var characterListModel = [CharacterModel]()
//    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
//    func save<T>(_ characters: Resource<T>, completion: @escaping(Result<T, MemoryError>) -> Void) {
//        URLSession.shared.dataTask(with: characters.url) { data, resp, error in
//            guard let safeData = data, error == nil else {
//                completion(.failure(.notSaved))
//                return
//            }
//            
//            let result = try? JSONDecoder().decode(T.self, from: safeData)
//            if let result = result {
//                DispatchQueue.main.async {
//                    completion(.success(result))
//                }
//            } else {
//                completion(.failure(.memoryFull))
//            }
//        }.resume()
//        
//        let entity = NSEntityDescription.entity(forEntityName: "CharacterModel", in: context)
//        let newCharacter = CharacterModel(entity: entity!, insertInto: context)
//        for i in T.self {
//            var occupationCombined = ""
//            newCharacter.name = i.name
//            newCharacter.nickname = i.nickname
//            newCharacter.status = i.status
//            for j in i.occupation {
//                occupationCombined += j + ", "
//            }
//            newCharacter.occupation = occupationCombined
//            if let imageString = try? String(contentsOf: i.img) {
//                newCharacter.imageURL = imageString
//            }
//            print(newCharacter)
//            characterListModel.append(newCharacter)
//            print(characterListModel)
//        }
//        do {
//            try context.save()
//        } catch {
//            print("Could not save")
//        }
//    }
//    
//    func loadCharacters() {
//        
//    }
//}
