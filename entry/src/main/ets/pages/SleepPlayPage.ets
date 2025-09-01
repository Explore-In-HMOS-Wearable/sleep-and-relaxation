import { router } from '@kit.ArkUI'
import { DataModel } from '../model/DataModel'

@Entry
@Component
struct SleepPlayPage {
  @State image: Resource | null = null;
  @State currentText: ResourceStr = $r('app.string.waiting_msg')
  @State onLoop: boolean = false

  aboutToAppear(): void {
    const temp = router.getParams() as DataModel
    this.image = temp.image
  }

  build() {
    Column({ space: 10 }) {
      Image(this.image).objectFit(ImageFit.Contain)
        .width('20%')
        .height('20%')

      Text(this.currentText).fontColor(Color.White).fontSize(12)

      if (this.onLoop) {
        Image($r('app.media.pause'))
          .objectFit(ImageFit.Contain)
          .width('10%')
          .height('10%')
          .onClick(
            () => {
              this.onLoop = !this.onLoop
              this.currentText = $r('app.string.waiting_msg')
            }
          )
      } else {
        Image($r('app.media.play'))
          .objectFit(ImageFit.Contain)
          .width('10%')
          .height('10%')
          .onClick(
            () => {
              this.onLoop = !this.onLoop
              this.currentText = $r('app.string.listen_relax');
            }
          )
      }
    }
    .alignItems(HorizontalAlign.Center)
    .justifyContent(FlexAlign.Center)
    .width('100%')
    .height('100%')
    .backgroundColor($r('app.color.background_color'))
  }
}


