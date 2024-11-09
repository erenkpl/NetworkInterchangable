import SwiftUI
import Foundation

enum NetworkError : Error {
    case invalidUrl
    case invalidServerResponse
}

class Webservice : NetworkService {
    
    var type : String = "Webservice"
    
    func download(_ resource: String) async throws -> [User] {
        
        // Url'yi oluşturabiliyorsan devam et yoksa yanlış url diye hata ver
        guard let url = URL(string: resource) else {
            throw NetworkError.invalidUrl
        }
        
        // Async olduğu için await kullandık.
        let (data, response) = try await URLSession.shared.data(from: url)
        
        // Httpresponse'u alabiliyorsak ve sunucudan gerçekten cevap geldiyse devam et yoksa hata ver
        guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
                throw NetworkError.invalidServerResponse
        }
        
        // Veriyi decode ediyoruz
        return try JSONDecoder().decode([User].self, from: data)
    }
}
