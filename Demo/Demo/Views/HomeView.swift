import SwiftUI

struct Car: Identifiable, Hashable {
    let id = UUID().uuidString
    let name: String
    let make: String
    
    var description: String {
        return "\(make) \(name)"
    }
}

struct Manufacturer: Identifiable, Hashable {
    let id = UUID().uuidString
    let name: String
    let country: String
    
    var description: String {
        return "\(country) \(name)"
    }
}


struct HomeView: View {
    
    @Binding var email: String
    
    @State private var navigationPath = [Car]()
    @State private var showFullStack = false
    
    let cars: [Car] = [
        .init(name: "Swift", make: "Maruti"),
        .init(name: "Camry", make: "Toyota"),
        .init(name: "Fortuner", make: "Toyota"),
        .init(name: "Ertiga", make: "Maruti")
    ]
    
    let manufacturers: [Manufacturer] = [
        .init(name: "Suzuki", country: "Japan"),
        .init(name: "Toyota", country: "Japan"),
        .init(name: "Ford", country: "USA"),
        .init(name: "Audi", country: "Germany"),
    ]
    
    var body: some View {
        NavigationStack(path: $navigationPath) {
            Text(email)
            VStack {
                List {
                    Section("Cars") {
                        ForEach(cars) { car in
                            NavigationLink(value: car) {
                                Text(car.name)
                            }
                        }
                    }
                    
                    Section("Manufacturers") {
                        ForEach(manufacturers) { manufacturer in
                            NavigationLink(value: manufacturer) {
                                Text(manufacturer.name)
                            }
                        }
                    }
                }
                .navigationDestination(for: Car.self) { car in
                    VStack {
                        Text(car.description)
                        
                        Button(action: {
                            navigationPath = []
                        }, label: {
                            Text("Pop to root")
                        })
                    }
                }
                .navigationDestination(for: Manufacturer.self) { manufacturer in
                    Text(manufacturer.description)
                }
                
                Button(action: {
                    showFullStack.toggle()
                    if showFullStack {
                        navigationPath = cars
                    } else {
                        navigationPath = [cars[0], cars[3]]
                    }
                }, label: {
                    Text("View all")
                })
            }
        }
    }
}

#Preview {
    HomeView(email: .constant("sss"))
}
