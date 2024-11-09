import SwiftUI
import Foundation

// Published var olduğu için herhangi bi değişiklikte sayfayı yenilemek için.
class UserListViewModel : ObservableObject {
    @Published var userList = [UserViewModel]()
    @Published var resource = ""
    
    // let webService = Webservice()
    // UserViewModel oluşturulurken hangi service'i kullanabileceğimizi seçebilicez.
    private var service : NetworkService
    init(service: NetworkService) {
        self.service = service
    }
    
    // Download fonksiyonunu kullanabilmek için async olması gerekli
    func downloadUsers() async {
        
        if service.type == "Webservice" {
            resource = Constants.Urls.usersExtensions
        }
        else {
            resource = Constants.Paths.baseUrl
        }
        
        // Herhangi bir hatadan dolayı çökmemesi için try-catch kullandık.
        do {
            // Kendi oluşturduğumuz constant dosyasından urlyi seçiyoruz.
            let users = try await service.download(Constants.Urls.usersExtensions)
            DispatchQueue.main.async {
                // Userları UserViewModel'e çevirmek için
                self.userList = users.map(UserViewModel.init)
            }
        } catch {
            print(error)
        }
        
    }
}

struct UserViewModel {
    
    let user : User
    
    // Computed Variable
    var id : Int {
        user.id
    }
    
    var name : String {
        user.name
    }
    
    var username : String {
        user.username
    }
    
    var email : String {
        user.email
    }
    
} 
