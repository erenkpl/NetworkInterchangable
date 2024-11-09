import SwiftUI

struct ContentView: View {
    
    @ObservedObject var userListViewModel : UserListViewModel
    
    init() {
        self.userListViewModel = UserListViewModel(service: LocalService())
    }
    
    var body: some View {
        List(userListViewModel.userList, id: \.id){ user in
            VStack{
                Text(user.name)
                    .font(.title3)
                    .foregroundColor(.blue)
                    .frame(maxWidth: .infinity, alignment: .leading)
                Text(user.username)
                    .foregroundColor(.green)
                    .frame(maxWidth: .infinity, alignment: .leading)
                Text(user.email)
                    .foregroundColor(.gray)
                    .frame(maxWidth: .infinity, alignment: .leading)
            }
        }.task {
            //Async olduğu için await kullandık
            await userListViewModel.downloadUsers()
        }
    }
}
