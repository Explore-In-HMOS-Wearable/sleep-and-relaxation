@Entry
@Component
struct BreathPage {
  breatheText: Array<ResourceStr> = [
    $r('app.string.breath_msg_01'), $r('app.string.breath_msg_02'), $r('app.string.breath_msg_02'), ''
  ];
  @State currentText: ResourceStr = '';
  @State onLoop: boolean = true;

  aboutToAppear(): void {
    this.cycleText();
  }

  private cycleText() {
    this.breatheText.forEach((element, index) => {
      setTimeout(() => {
        if (index == this.breatheText.length - 1) {
          this.cycleText()
        }
        this.currentText = element

      }, index * 5000)
    });
  }

  build() {
    Column() {
      Image($r('app.media.breath')).objectFit(ImageFit.Contain).width('20%').height('20%')
      Text(this.currentText).margin({ top: 16 }).fontColor(Color.White).fontSize(12)
    }
    .alignItems(HorizontalAlign.Center)
    .justifyContent(FlexAlign.Center)
    .width('100%')
    .height('100%')
    .backgroundColor($r('app.color.background_color'))
  }
}