import SwiftUI

struct Screen1View: View {
    @State private var rotateSquare = false
    @State private var moveCircle = false

    var body: some View {
        NavigationView {
            VStack(spacing: 20) {
                Text("화면 1")
                    .font(.largeTitle)
                    .padding()

                Spacer()

                ZStack {
                    Rectangle()
                        .fill(Color.blue)
                        .frame(width: 500, height: 50)
                        .rotationEffect(.degrees(rotateSquare ? 360 : 0))
                        .onAppear() {
                            withAnimation(Animation.linear(duration: 2).repeatForever(autoreverses: false)) {
                                self.rotateSquare.toggle()
                            }
                        }

                    Circle()
                        .fill(Color.red)
                        .frame(width: 100, height: 10)
                        .offset(y: moveCircle ? 200 : -500)
                        .onAppear() {
                            withAnimation(Animation.easeInOut(duration: 2).repeatForever(autoreverses: true)) {
                                self.moveCircle.toggle()
                            }
                        }
                }
                .frame(height: 200)

                Spacer()

                NavigationLink(destination: ContentView()) {
                    Text("메인 화면으로 돌아가기")
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(36)
                }
                .padding()
            }
            .navigationTitle("화면 1")
        }
    }
}

struct Screen1View_Previews: PreviewProvider {
    static var previews: some View {
        Screen1View()
    }
}
