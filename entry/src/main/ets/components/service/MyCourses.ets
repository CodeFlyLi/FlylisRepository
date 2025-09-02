@Component
export struct MyCourses {
  build() {
    NavDestination() {
      Column() {
        Text("我是我的课程导航页的内容")
      }
    }
  }
}

@Builder
export function MyCoursesBuilder() {
  MyCourses()
}