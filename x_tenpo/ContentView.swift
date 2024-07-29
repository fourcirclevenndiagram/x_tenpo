import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            VStack {
                NavigationLink(destination: Screen1View()) {
                    Text("화면 1로 이동")
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(8)
                }
                .padding()

                NavigationLink(destination: Screen2View()) {
                    Text("화면 2로 이동")
                        .padding()
                        .background(Color.green)
                        .foregroundColor(.white)
                        .cornerRadius(8)
                }
                .padding()

                NavigationLink(destination: Screen3View()) {
                    Text("화면 3로 이동")
                        .padding()
                        .background(Color.orange)
                        .foregroundColor(.white)
                        .cornerRadius(8)
                }
                .padding()

                NavigationLink(destination: Screen4View()) {
                    Text("화면 4로 이동")
                        .padding()
                        .background(Color.red)
                        .foregroundColor(.white)
                        .cornerRadius(8)
                }
                .padding()
                
                NavigationLink(destination: Screen5View()) {
                    Text("화면 5로 이동")
                        .padding()
                        .background(Color.purple)
                        .foregroundColor(.white)
                        .cornerRadius(8)
                }
                .padding()
                
                NavigationLink(destination: Screen6View()) {
                    Text("화면 6로 이동")
                        .padding()
                        .background(Color.black)
                        .foregroundColor(.white)
                        .cornerRadius(8)
                }
                .padding()
            }
            .navigationTitle("메인 화면")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
