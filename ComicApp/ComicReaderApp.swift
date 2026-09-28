import SwiftUI
import WebKit

private let comicURL = URL(string: "https://8.133.243.109/")!

@main
struct ComicReaderApp: App {
    var body: some Scene {
        WindowGroup {
            ComicWebView()
                .ignoresSafeArea()
        }
    }
}

struct ComicWebView: UIViewRepresentable {
    func makeUIView(context: Context) -> WKWebView {
        let configuration = WKWebViewConfiguration()
        configuration.allowsInlineMediaPlayback = true
        configuration.defaultWebpagePreferences.allowsContentJavaScript = true

        let webView = WKWebView(frame: .zero, configuration: configuration)
        webView.allowsBackForwardNavigationGestures = true
        webView.scrollView.contentInsetAdjustmentBehavior = .never
        webView.load(URLRequest(url: comicURL))
        return webView
    }

    func updateUIView(_ webView: WKWebView, context: Context) {}
}
