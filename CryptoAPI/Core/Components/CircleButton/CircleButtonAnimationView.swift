//
//  CircleButtonAnimationView.swift
//  CryptoAPI
//
//  Created by macOS on 06/05/2024.
//

import SwiftUI

struct CircleButtonAnimationView: View {
    //State: được sử dụng để theo dõi trạng thái nội bộ của 1 view cụ thể
    //Binding: được sử dụng để truyền giá trị từ một view cha xuống 1 view con và theo dõi sự thay đổi của giá trị đó
   // @State private var animate: Bool = false
    @Binding var animate: Bool
    var body: some View {
        Circle()
            .stroke(lineWidth: 5.0)
            .scale(animate ? 1.0 : 0.0)
            .opacity(animate ? 0.0 : 1.0)
        //easeOut: hiệu ứng diễn ra nhanh chóng rồi chậm dần lại
            .animation(animate ? Animation.easeOut(duration: 1.0) : .none)
            .onAppear {
                animate.toggle()
            }
    }
}

struct CircleButtonAnimationView_Previews: PreviewProvider {
    static var previews: some View {
        CircleButtonAnimationView(animate: .constant(false))
            .foregroundColor(.red)
            .frame(width: 100, height: 100)
    }
}
