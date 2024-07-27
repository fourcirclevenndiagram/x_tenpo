import SwiftUI

struct NumberListView: View {
    let numbers: [NumberEntry]
    @Environment(\.dismiss) private var dismiss

    var body: some View {
        VStack {
            Text("숫자 리스트")
                .font(.largeTitle)
                .padding()

            List(numbers) { entry in
                HStack {
                    Text("날짜: \(entry.date)")
                    Spacer()
                    Text("숫자: \(entry.number)")
                }
                .padding()
            }
            .listStyle(InsetListStyle())
            .frame(minWidth: 400, minHeight: 300)
            
            Button("닫기") {
                dismiss()
            }
            .padding()
            .background(Color.blue)
            .foregroundColor(.white)
            .cornerRadius(8)
        }
        .padding()
    }
}

struct NumberListView_Previews: PreviewProvider {
    static var previews: some View {
        NumberListView(numbers: [NumberEntry(date: "2023-01-01", number: 123), NumberEntry(date: "2023-01-02", number: 456)])
    }
}
