import SwiftUI
import Foundation

class LocalService : NetworkService {
    
    var type : String = "Localservice"
    
    func download(_ resource: String) async throws -> [User] {
        
        guard let path = Bundle.main.path(forResource: resource, ofType: "json") else {
            fatalError("Resource not found!")
        }
        
        // url'den değil de localdeki user.json dosyasından okudu.
        let data = try Data(contentsOf: URL(filePath: path))
        
        return try JSONDecoder().decode([User].self, from: data)
    }
    
}
