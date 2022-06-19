
import SwiftUI


struct DestinationDeatil: View{
    
    var id: Int
    
    @ObservedObject var destinationDetailViewModel = DestinationDetailViewModel()
    
    var body: some View{
        
        if let detail = destinationDetailViewModel.detail {
            ViewOfNavigationLink(deatils: detail )
        }else {
            ProgressView()
                .onAppear{
                    destinationDetailViewModel.getDetails(destinationId: id)
                }
        }
    }
}

struct DestinationDeatil_Previews: PreviewProvider {
    static var previews: some View {
        var id = 1
        DestinationDeatil(id: id)
    }
}
