@Builder
export function ButtonIcon(resource: Resource) {
  Image(resource).width('25%').height('50%').objectFit(ImageFit.Contain).margin({ left: 8 })
}