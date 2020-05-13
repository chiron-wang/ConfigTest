# ConfigTest
xcconfig test
## 基本原理
使用Xcode配置文件（.xcconfig）
如上所述，我們使用Xcode配置文件（.xcconfig）取代conditional compilation blocks，來管理構建設置（例如token、api keys，以及與後端串接使用的urls）。

Xcode配置文件(.xcconfig)是什麼，它實際上是一個基於key/value的文件，你可以透過key/value的形式存儲構建設置，類似於我們所用的dictionaries，通過使用.xcconfig文件，為每個構建定義構建參數。

* 以上內容參考自ref1

---

## 建立與設定

Create XcConfig file => Edit XcConfig => Create Configuration Staging => Create info-Staging.plist =>  Edit info-Staging.plist => Config ConfigTest Project Setting

### Create XcConfig file
1. add Config group

![image](https://github.com/chiron-wang/ConfigTest/blob/master/blogImages/xcconfig001.png)

2. name Config

![image](https://github.com/chiron-wang/ConfigTest/blob/master/blogImages/xcconfig002.png)

3. create new config file [cmd + n]

![image](https://github.com/chiron-wang/ConfigTest/blob/master/blogImages/xcconfig003.png)

4. name 『staging-Config.xcconfig』

![image](https://github.com/chiron-wang/ConfigTest/blob/master/blogImages/xcconfig004.png)

### Edit XcConfig
1. edit xcconfig

![image](https://github.com/chiron-wang/ConfigTest/blob/master/blogImages/xcconfig005.png)

```objectiveC
CT_APP_NAME = CT Config Test
CT_APPVERSION = 1.0.1
```

### Create Configuration Staging

1. create ConfigTest project (objectiveC)

2. create new Configurations 『Staging』

2.1 create

![image](https://github.com/chiron-wang/ConfigTest/blob/master/blogImages/xcconfig006.png)

2.2 name Staging

![image](https://github.com/chiron-wang/ConfigTest/blob/master/blogImages/xcconfig007.png)

3. Configuration Set => Staging use staging-Config

![image](https://github.com/chiron-wang/ConfigTest/blob/master/blogImages/xcconfig008.png)

* finish

![image](https://github.com/chiron-wang/ConfigTest/blob/master/blogImages/xcconfig009.png)

* 此設定代表要抓取『staging-Config』的xcConfig配置

### Create info-Staging.plist
1. create new 『Property List』 file

![image](https://github.com/chiron-wang/ConfigTest/blob/master/blogImages/xcconfig010.png)

2. name info-staging.plist

![image](https://github.com/chiron-wang/ConfigTest/blob/master/blogImages/xcconfig011.png)

* or copy info.plist => rename => Add files to project

3. change type to 『info.plist』

![image](https://github.com/chiron-wang/ConfigTest/blob/master/blogImages/xcconfig012.png)

### Edit info-Staging.plist

1. 新增Key AppName，Value為『$(CT_APP_NAME)』

![image](https://github.com/chiron-wang/ConfigTest/blob/master/blogImages/xcconfig013.png)

* 對應變數用『$()』錢字號括弧包住 (e.g. $CT_APP_NAME)

2. 實際取值時要用原本的Key

2.1 滑鼠右鍵 => Raw Keys & Values

![image](https://github.com/chiron-wang/ConfigTest/blob/master/blogImages/xcconfig014.png)

2.2 此時的Key值，為程式內呼叫的值 (e.g. CFBundleShortVersionString)

![image](https://github.com/chiron-wang/ConfigTest/blob/master/blogImages/xcconfig015.png)

### Config ConfigTest Project Setting
1. TARGETS => ConfigTest => Build Settings => info.plist File

2. update Staging => ConfigTest/Info-Staging.plist

![image](https://github.com/chiron-wang/ConfigTest/blob/master/blogImages/xcconfig016.png)

---

## 使用

### Run with configuration step
1. 『Alt + 滑鼠左鍵』點選ConfigTest => 選擇 Staging

![image](https://github.com/chiron-wang/ConfigTest/blob/master/blogImages/xcconfig017.png)

2. 在ViewController.m中，加入以下程式碼取得xcconfig的值

```objectivec
- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSString *name = [NSBundle.mainBundle.infoDictionary objectForKey:@"AppName"];
    NSLog(@"%@", name);
    
    UILabel *nameLabel = [UILabel new];
    nameLabel.text = name;
    
    [self.view addSubview:nameLabel];
}
```

3. 取得AppName的值『CT Config Test』

![image](https://github.com/chiron-wang/ConfigTest/blob/master/blogImages/xcconfig018.png)

### 取得xcconfig的相關語法

* object 取出，搭配as來轉型
```swift=
if let name = Bundle.main.object(forInfoDictionaryKey: "CT_APP_NAME") as? String {
   print(name)
}
```

```objectivec=
NSString *name = [NSBundle.mainBundle.infoDictionary objectForKey:@"AppName"];
```

* dictionary 取出，搭配as來轉型
```swift=
if let name = Bundle.main.infoDictionary?["CT_APP_NAME"] as? String {
   print(name)
}
```

---

## Reference

1. 如何使用Xcode Configuration 管理 iOS Apps 不同構建版本
https://bit.ly/2SVPfRu

2. How to Use Xcode Targets to Manage Development and Production Builds
https://bit.ly/2LlFHLt

3. 從程式讀取 Info.plist 的內容，比方 version & API key
https://bit.ly/2YXKmLU

4. 專案參考範例
https://github.com/chiron-wang/ConfigTest
