# TVmaze

1. **Running the App**  
You may need to reset package caches (File/Packages/ Reset Package Caches) or reinstall packages:
 **File/Add Packages...** 
- Here you need to specify the repository uri "https://github.com/realm/realm-swift.git"
- Click **Add Package** and select **Realm** and **RealmSwift** libraries. 
 
2. **Architecture**  
- The app is built using the **MVVM** design pattern.  
- **SwiftUI** framework is used for UI implementation. The views use binding properties to update the state of data with ViewModels and persistence layer.  
- The ViewModels use **dependency injection** to work with the network layer. As the network layer conforms to a **protocol** it can be tested using a mock when implementing **unit** tests.
- The data is persisted using **Realm**.  
- No external library is used to manage REST API calls, paging or image loading. The idea is to use **as few third-party libraries as possible** to not overload the app binary.  

3. **Features**    
- Implementation of **favorites** feature including saving a favorite, deleting a favorite, and search of favorites.  
- **Cache** managed with Realm.  
- **Unit tests** implemented with XCTest framework.  

4. **Versions**  
- iOS 15.5
- Xcode 13.4.1 


