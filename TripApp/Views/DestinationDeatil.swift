
import SwiftUI


struct DestinationDeatil: View{
    
    @ObservedObject var destinationDetailViewModel = DestinationDetailViewModel()
    
    var body: some View{
        
        if let detail = destinationDetailViewModel.detail {
            ViewOfNavigationLink(deatils: detail )
        }else {
            ProgressView()
                .onAppear{
                    destinationDetailViewModel.getDetails()
                }
        }
    }
}

struct DestinationDeatil_Previews: PreviewProvider {
    static var previews: some View {
        DestinationDeatil()
    }
}
