//
//  TabIcon.swift
//  Food Delivery
//
//  Created by Loic HACHEME on 26/09/2023.
//

import SwiftUI

struct TabIcon: View {
    var icon: UIImage
      var size: CGSize = CGSize(width: 30, height: 30)

      // Based on https://stackoverflow.com/a/32303467
      var roundedIcon: UIImage {
          let rect = CGRect(origin: CGPoint(x: 0, y: 0), size: self.size)
          UIGraphicsBeginImageContextWithOptions(self.size, false, 1)
          defer {
              // End context after returning to avoid memory leak
              UIGraphicsEndImageContext()
          }

          UIBezierPath(
              roundedRect: rect,
              cornerRadius: self.size.height
              ).addClip()
          icon.draw(in: rect)
          return UIGraphicsGetImageFromCurrentImageContext()!
      }

      var body: some View {
          Image(uiImage: roundedIcon.withRenderingMode(.alwaysOriginal))
          
      }
}

struct TabIcon_Previews: PreviewProvider {
    static var previews: some View {
        TabIcon(icon: UIImage(systemName: "pencil")!)
    }
}
