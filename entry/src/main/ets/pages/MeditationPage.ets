import { router } from '@kit.ArkUI'
import { ButtonIcon } from '../components/ButtonIcon'
import { DataModel } from '../model/DataModel'

@Entry
@Component
struct MeditationPage {
  sleepText: Array<ResourceStr> = [
    $r('app.string.med_msg_01'), $r('app.string.med_msg_02'), $r('app.string.med_msg_03')
  ]
  @State parameter: Resource = $r('app.media.sleepSoundsImage')

  build() {
    Column() {
      List({ space: 10 }) {
        ForEach(this.sleepText, (item: string, id: number) => {
          ListItem() {
            Row({ space: 2 }) {
              if (id == 0) {
                ButtonIcon($r('app.media.meditationImage1'))
              } else if (id == 1) {
                ButtonIcon($r('app.media.meditationImage2'))
              } else if (id == 2) {
                ButtonIcon($r('app.media.meditationImage3'))
              }
              Text(item).fontColor(Color.White).fontSize(12)
            }
            .width('60%')
            .height('25%')
            .alignItems(VerticalAlign.Center)
            .justifyContent(FlexAlign.Start)
            .backgroundColor($r('app.color.background_color'))
            .borderRadius(10)
          }.alignSelf(ItemAlign.Center).onClick(() => {
            if (id == 0) {
              this.parameter = $r('app.media.meditationImage1')
            } else if (id == 1) {
              this.parameter = $r('app.media.meditationImage2')

            } else if (id == 2) {
              this.parameter = $r('app.media.meditationImage3')
            }

            const paramObject: DataModel = {
              id: 0,
              image: this.parameter
            }
            router.pushUrl({
              url: 'pages/MeditationPlayPage',
              params: paramObject
            })
          })
        }, (item: string, id: number) => `${item}_${id}`)
      }
      .width('100%')
      .height('55%')
      .scrollBar(BarState.Off)
      .alignListItem(ListItemAlign.Center)
      .alignSelf(ItemAlign.Center)
    }
    .height('100%')
    .width('100%')
    .alignItems(HorizontalAlign.Center)
    .justifyContent(FlexAlign.Center)
    .backgroundColor(Color.White)
  }
}