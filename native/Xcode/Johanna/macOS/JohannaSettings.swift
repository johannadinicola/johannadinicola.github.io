import SwiftUI

struct JohannaSettings: View {
    @AppStorage("MapView.zoom")
    private var zoom: MapView.Zoom = .far

    var body: some View {
        Form {
            Picker("Map Zoom:", selection: $zoom) {
                ForEach(MapView.Zoom.allCases) { level in
                    Text(level.rawValue)
                }
            }
            .pickerStyle(.inline)
        }
        .frame(width: 300)
        .navigationTitle("Johanna Settings")
        .padding(80)
    }
}

struct JohannaSettings_Previews: PreviewProvider {
    static var previews: some View {
        JohannaSettings()
    }
}
