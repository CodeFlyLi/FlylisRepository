import { My } from './My'
import { Index } from './Index'
import { ShortVideo } from '../components/business/ShortVideo'


@Entry
@Component
struct Tabbar {
  @State currentIndex: number = -1

  @Builder
  tabBuilder(title: string, targetIndex: number,) {
    Column() {
      Text(title)
        .fontColor(this.currentIndex === targetIndex ? '#1698CE' : '#6B6B6B')
    }
  }

  build() {
    Column() {

      Tabs({ barPosition: BarPosition.End }) {
        TabContent() {
          Index()
        }.tabBar(this.tabBuilder('首页', 0))

        TabContent() {
          ShortVideo()
        }.tabBar(this.tabBuilder('视频', 1))

        TabContent() {
        }.tabBar(this.tabBuilder('音乐', 2))

        TabContent() {
          My()
        }.tabBar(this.tabBuilder('我的', 3))
      }
      .scrollable(false)
      .animationDuration(0)
      .backgroundColor('#F1F3F5')
      .onChange((index: number) => {
        this.currentIndex = index
      })
    }.width('100%')
  }
}

