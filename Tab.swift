import SwiftUI
import WebKit

struct Tab: View {
    @State private var text = ""
    @State private var progress = CGFloat(1)

    var body: some View {
        ZStack {
            VStack {
                Image(systemName: "eyeglasses")
                    .font(Font.largeTitle.bold())
                Text("Title")
                    .font(.headline)
            }.foregroundColor(.init(.quaternaryLabel))
            
            VStack {
                Progress(progress: progress)
                    .stroke(progress < 1 ? Color.pink : .clear,
                            style: .init(lineWidth: 4, lineCap: .round))
                    .frame(height: 4)
                    .cornerRadius(3)
                    .padding(.horizontal, 20)
                Web(url: $text, progress: $progress)
                    .opacity(text.isEmpty ? 0 : 1)
            }
            Tools(search: search)
        }
    }
    
    private func search(_ text: String) {
        self.text = text
    }
}
