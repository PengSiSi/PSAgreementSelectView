//
//  AgreementSelectView.m
//  AgreementSelectDemo
//
//  Created by 思 彭 on 2017/5/16.
//  Copyright © 2017年 思 彭. All rights reserved.
//

#import "AgreementSelectView.h"

@interface AgreementSelectView ()

@property (nonatomic, strong) UIButton *selectButton;
@property (nonatomic, strong) UILabel *textLabel;

@end

@implementation AgreementSelectView

- (instancetype)initWithAgreementSelectViewFrame: (CGRect)frame
                                            text: (NSString *)text
                                        textFont:(UIFont *)textFont
                              attributeTextColor: (UIColor *)attributeTextColor
                               normalButtonImage: (UIImage *)normalButtonImage
                             selectedButtonImage: (UIImage *)selectedButtonImage
                                selectButtonSize: (CGSize)selectButtonSize
                             textLabelLeftMargin: (CGFloat)textLabelLeftMargin {
    if (self = [super initWithFrame:frame]) {
        
        [self initialize];
        self.textFont = textFont ? : [UIFont systemFontOfSize:14];
        self.attributeTextColor = attributeTextColor ? : [UIColor orangeColor];
        self.selectButtonSize = selectButtonSize.width > 0 && selectButtonSize.height > 0 ? selectButtonSize: CGSizeMake(20, 20);
        self.selectedButtonImage = selectedButtonImage ? : [UIImage imageNamed:@"f_hs_activities_-approval_batch_choose_pressed"];
        self.normalButtonImage = normalButtonImage ? : [UIImage imageNamed:@"f_hs_activities_-approval_batch_choose"];
        self.textLabelLeftMargin = self.textLabelLeftMargin ? : 5;
        self.text = text ? : @"我已阅读并同意<<好业宝平台服务协议>> <<好业宝禁售产品协议>>";
        [self createSubViews];
    }
    return self;
}

#pragma mark - Initialize

- (void)initialize {
    
    self.textFont = [UIFont systemFontOfSize:14];
    self.attributeTextColor = [UIColor orangeColor];
    self.selectButtonSize = CGSizeMake(20, 20);
    self.normalButtonImage = [UIImage imageNamed:@"f_hs_activities_-approval_batch_choose"];
    self.selectedButtonImage = [UIImage imageNamed:@"f_hs_activities_-approval_batch_choose_pressed"];
}

#pragma mark - 设置界面

- (void)createSubViews {
    self.selectButton = [UIButton buttonWithType:UIButtonTypeCustom];
    self.selectButton.frame = CGRectMake(10, 0,self.selectButtonSize.width, self.selectButtonSize.height);
    [self.selectButton setImage:self.normalButtonImage forState:UIControlStateNormal];
    [self.selectButton setImage:self.selectedButtonImage forState:UIControlStateSelected];
    [self.selectButton addTarget:self action:@selector(selectButtonDidClick:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:self.selectButton];
    self.textLabel = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMaxX(self.selectButton.frame) + self.textLabelLeftMargin, CGRectGetMinY(self.selectButton.frame) - 2, self.frame.size.width - 40, self.frame.size.height)];
    self.textLabel.text = self.text;
//    [self setAttributeWithLabel:self.textLabel string:self.textLabel.text attributeTextColor:self.attributeTextColor];
    self.textLabel.numberOfLines = 0;
    self.textLabel.font = self.textFont;
    [self addSubview:self.textLabel];
    
    // 文字添加手势
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(textTap:)];
    self.textLabel.userInteractionEnabled = YES;
    [self.textLabel addGestureRecognizer:tap];
}

#pragma mark - Private Method

- (void)selectButtonDidClick: (UIButton *)button {
    
    button.selected = !button.selected;
    !self.selectButtonBlock ? : self.selectButtonBlock(button.selected);
}

- (void)textTap: (UITapGestureRecognizer *)tap {
    
    !self.textBlock ? : self.textBlock();
}

#pragma mark - 设置富文本

- (void)setAttributeWithLabel: (UILabel *)label string: (NSString *)string attributeTextColor: (UIColor *)attributeTextColor {
    
    NSMutableAttributedString *attributeString = [[NSMutableAttributedString alloc]initWithString:string];
    NSMutableDictionary *dict = [NSMutableDictionary dictionary];
    dict[NSForegroundColorAttributeName] = self.attributeTextColor;
    dict[NSFontAttributeName] = self.textFont;
    
    // 寻找子串attribute在string的range
    NSRange range = [string rangeOfString:self.attributeText];
    [attributeString addAttributes:dict range:range];
    label.attributedText = attributeString;
}

#pragma mark - Setter

- (void)setAttributeText:(NSString *)attributeText {
    
    _attributeText = attributeText;
    [self setAttributeWithLabel:self.textLabel string:self.textLabel.text attributeTextColor:self.attributeTextColor];
}

@end
