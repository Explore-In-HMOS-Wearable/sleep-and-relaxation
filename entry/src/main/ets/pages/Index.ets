import { router } from '@kit.ArkUI'
import { ButtonIcon } from '../components/ButtonIcon'


@Entry
@Component
struct Index {
  listItems: Array<ResourceStr> = [
    $r('app.string.type_01'), $r('app.string.type_02'), $r('app.string.type_03')
  ]

  build() {
    Column() {
      List({ space: 15 }) {
        ForEach(this.listItems, (item: string, id: number) => {
          ListItem() {
            Row({ space: 8 }) {
              if (id == 0) {
                ButtonIcon($r('app.media.breath'))
              } else if (id == 1) {
                ButtonIcon($r('app.media.sleep'))
              } else if (id == 2) {
                ButtonIcon($r('app.media.meditation'))
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
              router.pushUrl({
                url: 'pages/BreathPage',
              })
            } else if (id == 1) {
              router.pushUrl({
                url: 'pages/SleepPage',
              })
            } else if (id == 2) {
              router.pushUrl({
                url: 'pages/MeditationPage',
              })
            }
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