import SwiftUI

struct Screen4View: View {
    @State private var color = Color.white

    var body: some View {
        NavigationView {
            VStack(spacing: 20) {
                Text("랜덤 색상 생성기")
                    .font(.largeTitle)
                    .padding()

                Spacer()
                
                Rectangle()
                    .fill(color)
                    .frame(width: 200, height: 600)
                    .cornerRadius(12)
                    .shadow(radius: 10)

                Button(action: generateRandomColor) {
                    Text("색상 변경")
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(8)
                }

                Spacer()
                
                NavigationLink(destination: ContentView()) {
                    Text("메인 화면으로 돌아가기")
                        .padding()
                        .background(Color.purple)
                        .foregroundColor(.white)
                        .cornerRadius(8)
                }
                .padding()
            }
            .navigationTitle("랜덤 색상")
        }
    }
    
    func generateRandomColor() {
        let red = Double.random(in: 0.6...0.8)
        let green = Double.random(in: 0.5...1.0)
        let blue = Double.random(in: 0.3...0.7)
        color = Color(red: red, green: green, blue: blue)
    }
}

struct Screen4View_Previews: PreviewProvider {
    static var previews: some View {
        Screen4View()
    }
}
