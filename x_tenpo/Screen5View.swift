import SwiftUI

struct Screen5View: View {
    @State private var inputNumber: String = ""
    @State private var numbers: [NumberEntry] = []
    @State private var alertMessage: String? = nil
    @State private var selectedDate: Date = Date()
    @State private var showListView: Bool = false
    
    var dateFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateStyle = .short
        formatter.locale = Locale(identifier: "ko_KR")
        return formatter
    }
    
    var body: some View {
        VStack(spacing: 20) {
            HStack {
                DatePicker("날짜 선택", selection: $selectedDate, displayedComponents: .date)
                    .datePickerStyle(CompactDatePickerStyle())
                    .padding([.leading, .trailing], 20)
                
                Button(action: decrementDate) {
                    Text("전날 날짜로 적용")
                        .padding()
                        .background(Color.red)
                        .foregroundColor(.white)
                        .cornerRadius(8)
                }
                .padding(.trailing, 20)
                
                Button(action: applyDate) {
                    Text("날짜 적용")
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(8)
                }
            }
            
            HStack {
                TextField("숫자를 입력하세요", text: $inputNumber)
                    .padding()
                    .background(Color.gray.opacity(0.2))
                    .cornerRadius(8)
                    .onReceive(inputNumber.publisher.collect()) {
                        self.inputNumber = String($0.prefix(while: { $0.isNumber }))
                    }
                    .padding([.leading, .trailing], 30)
                
                Button(action: addNumber) {
                    Text("숫자 추가")
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(8)
                }
                .padding(.trailing, 20)
            }
            
            Button(action: { showListView = true }) {
                Text("리스트 보기")
                    .padding()
                    .background(Color.green)
                    .foregroundColor(.white)
                    .cornerRadius(8)
            }
            .padding()
            
            NavigationLink(destination: ContentView()) {
                Text("메인 화면으로")
                    .padding()
                    .background(Color.purple)
                    .foregroundColor(.white)
                    .cornerRadius(8)
            }
            .padding()
        }
        .alert(isPresented: .constant(alertMessage != nil), content: {
            Alert(title: Text("정보"), message: Text(alertMessage ?? ""), dismissButton: .default(Text("확인")) {
                alertMessage = nil
            })
        })
        .navigationTitle("화면 5")
        .sheet(isPresented: $showListView) {
            NumberListView(numbers: numbers)
        }
        .padding()
    }
    
    func applyDate() {
        // Function to apply the selected date (Currently does nothing extra)
    }
    
    func decrementDate() {
        if let newDate = Calendar.current.date(byAdding: .day, value: -1, to: selectedDate) {
            selectedDate = newDate
        }
    }
    
    func addNumber() {
        if let number = Int(inputNumber) {
            let formattedDate = dateFormatter.string(from: selectedDate)
            if let index = numbers.lastIndex(where: { $0.number == number && $0.date == formattedDate }) {
                alertMessage = "숫자 \(number)은(는) 마지막으로 \(formattedDate)에 \(index + 1)번째로 추가되었습니다."
            }
            numbers.append(NumberEntry(date: formattedDate, number: number))
        }
        inputNumber = ""
    }
}

struct Screen5View_Previews: PreviewProvider {
    static var previews: some View {
        Screen5View()
    }
}
