import SwiftUI
import WebKit

struct Screen6View: View {
    var body: some View {
        NavigationView {
            WebView(url: URL(string: "https://www.naver.com")!)
                .navigationTitle("네이버")
        }
    }
}

struct WebView: NSViewRepresentable {
    let url: URL

    func makeNSView(context: Context) -> WKWebView {
        let webView = WKWebView()
        let request = URLRequest(url: url)
        webView.load(request)
        return webView
    }

    func updateNSView(_ nsView: WKWebView, context: Context) {
        // Update the view if needed
    }
}

struct Screen6View_Previews: PreviewProvider {
    static var previews: some View {
        Screen6View()
    }
}
