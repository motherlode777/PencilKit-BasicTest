import SwiftUI
import PencilKit

struct ContentView: View {
    @State private var canvasView = PKCanvasView()
    
    var body: some View {
        VStack {
            ZStack {
                Color.white.ignoresSafeArea()
                PKCanvasRepresentation(canvasView: $canvasView)
            }
            Button {
                saveDrawing()
            } label: {
                Image(systemName: "square.and.arrow.down")
                    .font(.title)
            }
        }
    }
    
    func saveDrawing(){
        let image = canvasView.drawing.image(from: canvasView.drawing.bounds, scale: 1)
        
        UIImageWriteToSavedPhotosAlbum(image, nil, nil, nil)
    }
}

struct PKCanvasRepresentation: UIViewRepresentable {
    @Binding var canvasView: PKCanvasView
    
    func makeUIView(context: Context) -> PKCanvasView {
        canvasView.drawingPolicy = .anyInput
        canvasView.backgroundColor = UIColor.clear
        canvasView.tool = PKInkingTool(.pen, color: UIColor.green, width: 5)
        return canvasView
    }
    
    func updateUIView(_ uiView: PKCanvasView, context: Context) {
    }
}

#Preview {
    ContentView()
}
