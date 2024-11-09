import SwiftUI
import Foundation

struct Constants {
    
    struct Paths {
        static let baseUrl = "users.json"
    }
    
    struct Urls {
        // Oluştuğu anda silinmediği için her yerden rahatlıkla ulaşılabilecek
        static let baseUrl = "https://raw.githubusercontent.com/atilsamancioglu/UsersJSONPlaceHolder/refs/heads/main"
        // birden fazla extension olduğu projelerde daha kolay tanımlayabilmek için baseurl kullanılmalı
        static let usersExtensions = "\(baseUrl)/users.json"
    }
}
