import SwiftUI

struct Screen3View: View {
    @State private var timeRemaining = 1050
    @State private var timerActive = false
    @State private var timer: Timer?

    var body: some View {
        NavigationView {
            VStack(spacing: 5) {
                Text("타이머")
                    .font(.largeTitle)
                    .padding()

                Spacer()
                
                Text("\(timeRemaining)")
                    .font(.system(size: 42))
                    .padding()
                
                HStack {
                    Button(action: startTimer) {
                        Text("시작")
                            .padding()
                            .background(Color.green)
                            .foregroundColor(.white)
                            .cornerRadius(8)
                    }
                    
                    Button(action: resetTimer) {
                        Text("리셋")
                            .padding()
                            .background(Color.red)
                            .foregroundColor(.white)
                            .cornerRadius(8)
                    }
                }

                Spacer()
                
                NavigationLink(destination: ContentView()) {
                    Text("메인 화면으로 돌아가기")
                        .padding()
                        .background(Color.orange)
                        .foregroundColor(.white)
                        .cornerRadius(8)
                }
                .padding()
            }
            .navigationTitle("타이머")
        }
    }
    
    func startTimer() {
        if timerActive { return }
        
        timerActive = true
        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { _ in
            if self.timeRemaining > 0 {
                self.timeRemaining -= 1
            } else {
                self.timer?.invalidate()
                self.timerActive = false
            }
        }
    }
    
    func resetTimer() {
        timer?.invalidate()
        timeRemaining = 190
        timerActive = false
    }
}

struct Screen3View_Previews: PreviewProvider {
    static var previews: some View {
        Screen3View()
    }
}
