# PSAgreementSelectView
勾选遵守协议视图

---

![image](https://github.com/PengSiSi/PSAgreementSelectView/blob/master/screenShot.png)

---
```objc
- (void)viewDidLoad {
    [super viewDidLoad];
    
    AgreementSelectView *selectView = [[AgreementSelectView alloc]initWithAgreementSelectViewFrame:CGRectMake(10, 100, 300, 40) text: nil textFont:nil attributeTextColor:[UIColor orangeColor] normalButtonImage:nil selectedButtonImage:nil selectButtonSize:CGSizeMake(20, 20) textLabelLeftMargin:10];
    
    // 需要设置富文本的字符串
    selectView.attributeText = @"<<好业宝平台服务协议>> <<好业宝禁售产品协议>>";
    [self.view addSubview:selectView];
    selectView.selectButtonBlock = ^(BOOL isSelected) {
        if (isSelected == YES) {
            NSLog(@"选中");
        } else {
            NSLog(@"没有勾选,请先勾选哟!!!");
        }
    };
    selectView. textBlock = ^{
        NSLog(@"点击了文字链接哟!!!");
    };
}
```

---

## 期待
* 如果在使用过程中遇到BUG，希望你能Issues我，谢谢（或者尝试下载最新的代码看看BUG修复没有);
* 如果在使用过程中发现功能不够用，希望你能Issues我，我非常想为这个框架增加更多好用的功能，谢谢.





