//
//  AgreementSelectView.h
//  AgreementSelectDemo
//
//  Created by 思 彭 on 2017/5/16.
//  Copyright © 2017年 思 彭. All rights reserved.
//

#import <UIKit/UIKit.h>

/**
 按钮点击Block

 @param isSelected 按钮的选中状态
 */
typedef void(^SelectButtonClickBlock)(BOOL isSelected);

/**
 文字链接点击的Block
 */
typedef void(^TextClickBlock)(void);

@interface AgreementSelectView : UIView

@property (nonatomic, copy) SelectButtonClickBlock selectButtonBlock;
@property (nonatomic, copy) TextClickBlock textBlock;

@property (nonatomic, strong) UIColor *attributeTextColor; /**<链接文字颜色 */
@property (nonatomic, strong) UIFont *textFont; /**<文字字体大小 */
@property (nonatomic, strong) UIImage *normalButtonImage; /**<默认图片 */
@property (nonatomic, strong) UIImage *selectedButtonImage; /**<选中图片 */
@property (nonatomic, assign) CGSize selectButtonSize; /**<按钮size */
@property (nonatomic, assign) CGFloat textLabelLeftMargin; /**<文字左边到按钮的距离 */
@property (nonatomic, copy) NSString *text; /**<text字符串 */
@property (nonatomic, copy) NSString *attributeText; /**<需要设置富文本的字符串 */

// init方法
- (instancetype)initWithAgreementSelectViewFrame: (CGRect)frame
                                            text: (NSString *)text
                                        textFont:(UIFont *)textFont
                              attributeTextColor: (UIColor *)attributeTextColor
                               normalButtonImage: (UIImage *)normalButtonImage
                             selectedButtonImage: (UIImage *)selectedButtonImage
                                selectButtonSize: (CGSize)selectButtonSize
                             textLabelLeftMargin: (CGFloat)textLabelLeftMargin;

@end
