import { LiveStreamContent } from '../components/business/LiveStreamContent';
import { Recommend } from '../components/business/Recommend';
import { FilmTelevision } from '../components/business/FilmTelevision';
import { NewJourney } from '../components/business/NewJourney';
import { Meme } from '../components/business/Meme';
import { Knowledge } from '../components/business/Knowledge';
import { Emotions } from '../components/business/Emotions';
import { Animation } from '../components/business/Animation';
import { ShortVideo } from '../components/business/ShortVideo';
import { Hot } from '../components/business/Hot';
import { Music } from '../components/business/Music';

//FilmTelevision NewJourney Meme Music Knowledge Emotions Animation
// 类：能够通过构造函数快速创建多个实例。能够通过继承来扩展功能，还能添加方法。
export class TabTitles {
  id: string;
  title: string;
  page?: CustomComponent;

  // aa: string;

  constructor(id: string, title: string, page?: CustomComponent) {
    this.id = id;
    this.title = title;
    this.page = page;
  }
}

@Entry
@Component
export struct Index {
  @State currentIndex: number = 0; // 记录当前选中的 Tab 索引
  private scroller: Scroller = new Scroller(); // 创建 Scroller 实例
  TabTitlesList: Array<TabTitles> = [
    new TabTitles("0", "直播"), new TabTitles("1", "推荐"),
    new TabTitles("2", "热门"), new TabTitles("3", "影视"),
    new TabTitles("4", "新征程"), new TabTitles("5", "鬼畜"),
    new TabTitles("6", "音乐"), new TabTitles("7", "知识"),
    new TabTitles("8", "情感"), new TabTitles("9", "短视频"),
    new TabTitles("10", "动画"), new TabTitles("11", "        ")
  ];

  build() {
    Navigation() {
      Column() {
        // 搜索栏 Row（保持不变）
        Row({ space: 5 }) {
          Image($r(`app.media.ktfly`)).objectFit(ImageFit.Auto).width(60).height(60)
          TextInput({ placeholder: `harmonyOS` }).width("60%").textOverflow(90)
          Image($r(`app.media.Game`)).objectFit(ImageFit.Auto).width(30).height(40)
          Image($r(`app.media.Message`)).objectFit(ImageFit.Auto).width(30).height(30).padding(4)
        }.margin({ left: 10, bottom: 10 }).justifyContent(FlexAlign.Center)

        // 关键：Stack 让“更多”按钮悬浮在 Tabs 上方
        Stack({ alignContent: Alignment.TopEnd }) {
          // Tabs 占满 100% 宽度
          Tabs({ barPosition: BarPosition.Start }) {
            ForEach(this.TabTitlesList, (item: TabTitles) => {
              // TabContent 内容（保持不变）
              if (item.id == "0") {
                TabContent() {
                  LiveStreamContent()
                }.tabBar(item.title)
              } else if (item.id == "1") {
                TabContent() {
                  Recommend()
                }.tabBar(item.title)
              } else if (item.id == "2") {
                TabContent() {
                  Hot()
                }.tabBar(item.title)
              } else if (item.id == "3") {
                TabContent() {
                  FilmTelevision()
                }.tabBar(item.title)
              } else if (item.id == "4") {
                TabContent() {
                  NewJourney()
                }.tabBar(item.title)
              } else if (item.id == "5") {
                TabContent() {
                  Meme()
                }.tabBar(item.title)
              } else if (item.id == "6") {
                TabContent() {
                  Music()
                }.tabBar(item.title)
              } else if (item.id == "7") {
                TabContent() {
                  Knowledge()
                }.tabBar(item.title)
              } else if (item.id == "8") {
                TabContent() {
                  Emotions()
                }.tabBar(item.title)
              } else if (item.id == "9") {
                TabContent() {
                  ShortVideo()
                }.tabBar(item.title)
              } else if (item.id == "10") {
                TabContent() {
                  Animation()
                }.tabBar(item.title)
              } else if (item.id == "11") {
                TabContent() {
                  Animation()
                }.tabBar(item.title)
              } else {
                TabContent() {
                  Button("敬请期待开发中")
                }.tabBar(item.title)
              }
            }, (item: TabTitles) => item.title)
          }
          .scrollable(true) // 启用滚动并绑定 Scroller
          .barMode(BarMode.Scrollable)
          .barBackgroundColor("#F1F3F5")
          .width('100%')


          // 悬浮的“更多”按钮
          Image($r("app.media.gengduo"))
            .width(40)
            .height(40)
            .objectFit(ImageFit.Auto)
            .margin({ top: 5, right: 10 })
            .backgroundColor("#F1F3F5")
            .onClick(() => {
              // 更多按钮点击事件
              console.info("点击了更多按钮");
            })
        }
        .width('100%')
      }
      .width("100%")
      .justifyContent(FlexAlign.Center)
      .alignItems(HorizontalAlign.Center)
    }.mode(NavigationMode.Auto)
  }
}