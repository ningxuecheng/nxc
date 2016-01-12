//
//  TheridView.m
//  ui_自定义cell高度
//
//  Created by dllo on 15/12/30.
//  Copyright © 2015年 dllo. All rights reserved.
//

#import "TheridView.h"

@interface TheridView ()
@property (nonatomic, retain) UILabel *titleLabel;

@end

@implementation TheridView

- (void)dealloc {

    [_titleLabel release];
    [super dealloc];

}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self creatTitleLabel];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)creatTitleLabel {
    
    self.titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(20, 50, 320, 400)];
    self.titleLabel.numberOfLines = 0;
    self.titleLabel.layer.borderColor = [UIColor grayColor].CGColor;
    self.titleLabel.layer.borderWidth = 0.5;
    self.titleLabel.textAlignment = NSTextAlignmentLeft;
    [self.view addSubview:self.titleLabel];
    
    NSString *string = @"An NSAttributedString object manages character strings and associated sets of attributes (for example, font and kerning) that apply to individual characters or ranges of characters in the string. An association of characters and their attributes is called an attributed string. ";
    
    /* 这句话就是对这个类的一个最简明扼要的概括。NSAttributedString管理一个字符串，以及与该字符串中的单个字符或某些范围的字符串相关的属性。它有一个子类NSMutableAttributedString
     * 具体实现时，NSAttributedString维护了一个NSString，用来保存最原始的字符串，另有一个NSDictionary用来保存各个子串/字符的属性。
     */
    
    
#pragma mark - NSMutableAttributedString 创建
    /* 三种初始化方法,NSMutableAttributedString没有初始化方法,使用父类初始化方法, 使用initWithString:, initWithString:attributes:, 或者 initWithAttributedString: */
    NSAttributedString *attStri = [[NSAttributedString alloc] initWithString:string attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:30]}];
    
    NSMutableAttributedString *mAttStri = [[NSMutableAttributedString alloc] initWithString:string];
    
    
#pragma mark ** 1. NSFontAttributeName 设置字体属性
    /* 字体大小 及 字体类型 */
    NSRange font_range = [string rangeOfString:@"An"];
    [mAttStri addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:30] range:font_range];
    [mAttStri addAttribute:NSFontAttributeName value:[UIFont fontWithName:@"Courier-BoldOblique" size:17.0] range:NSMakeRange(10, 10)];
    
    
#pragma mark ** 2. NSParagraphStyleAttributeName 设置文本段落排版格式
    NSMutableParagraphStyle *style = [[NSMutableParagraphStyle alloc] init];
    style.firstLineHeadIndent = 20;
    style.lineSpacing = 10;
    
    [mAttStri addAttribute:NSParagraphStyleAttributeName value:style range:NSMakeRange(0, mAttStri.length / 2)];
    
#pragma mark ** 3. NSForegroundColorAttributeName 设置字体颜色
    /* 值为UIColor，字体颜色，默认为黑色. */
    [mAttStri addAttribute:NSForegroundColorAttributeName value:[UIColor redColor] range:NSMakeRange(0, mAttStri.length)];
    
    
#pragma mark ** 4. NSBackgroundColorAttributeName 设置字体所在区域背景颜色
    /* 值为UIColor，字体背景色，默认透明. */
    [mAttStri addAttribute:NSBackgroundColorAttributeName value:[UIColor grayColor] range:NSMakeRange(0, 20)];
    
    
#pragma mark ** 5. NSLigatureAttributeName 设置连体属性
    /* 取值为NSNumber 对象(整数). 0 表示没有连体字符, 1 表示使用默认的连体字符. 一般中文用不到，在英文中可能出现相邻字母连笔的情况 */
    [mAttStri addAttribute:NSLigatureAttributeName value:@0 range:NSMakeRange(0, mAttStri.length)];
    
    
    
#pragma mark ** 6. NSKernAttributeName 设置字符间距
    /* 值为浮点数NSNumber，字距属性，默认值为0。*/
    [mAttStri addAttribute:NSKernAttributeName value:@3 range:NSMakeRange(0, mAttStri.length)];
    
    
    
#pragma mark ** 7. NSStrikethroughStyleAttributeName 设置删除线
    /* 值为整型NSNumber，可取值为
     enum {
     
     NSUnderlineStyleNone = 0×00,
     
     NSUnderlineStyleSingle = 0×01,
     
     }; 设置删除线。
     */
    [mAttStri addAttribute:NSStrikethroughStyleAttributeName value:@3 range:NSMakeRange(3, 7)];
    
    
#pragma mark ** 8. NSStrikethroughColorAttributeName 设置删除线颜色
    /* 这个属性的值是一个UIColor对象. */
    [mAttStri addAttribute:NSStrikethroughColorAttributeName value:[UIColor blueColor] range:NSMakeRange(3, 3)];
    
    
#pragma mark ** 9. NSUnderlineStyleAttributeName 设置下划线
    /* 取值为 NSNumber 对象（整数），枚举常量 NSUnderlineStyle中的值，与删除线类似 */
    [mAttStri addAttribute:NSUnderlineStyleAttributeName value:@2 range:NSMakeRange(6, 5)];
    
    
#pragma mark ** 10. NSUnderlineColorAttributeName 设置下划线颜色
    /* 这个属性的值是一个UIColor对象.默认值为nil. */
    [mAttStri addAttribute:NSUnderlineColorAttributeName value:[UIColor blackColor] range:NSMakeRange(6, 5)];
    
    
    
#pragma mark ** 11. NSStrokeWidthAttributeName 设置笔画宽度(粗细)
    /* 值为浮点数NSNumber。设置笔画的粗细。负值填充效果，正值中空效果. */
    [mAttStri addAttribute:NSStrokeWidthAttributeName value:@10 range:NSMakeRange(50, 30)];
    
    
#pragma mark ** 12. NSStrokeColorAttributeName 填充部分颜色，
    /* 不是字体颜色，取值为 UIColor 对象 默认值为nil，设置的属性同ForegroundColor。*/
    [mAttStri addAttribute:NSStrokeColorAttributeName value:[UIColor orangeColor] range:NSMakeRange(50, 20)];
    
    
#pragma mark ** 13. NSShadowAttributeName 设置阴影属性
    
    /* 值为NSShadow，设置笔画的阴影，默认值为nil。*/
    NSShadow *shadow = [[NSShadow alloc]init];
    shadow.shadowOffset = CGSizeMake(10, 10);
    shadow.shadowColor = [UIColor greenColor];
    [mAttStri addAttribute:NSShadowAttributeName value:shadow range:NSMakeRange(20, 10)];
    
    
#pragma mark ** 14. NSTextEffectAttributeName 设置文本特殊效果
    /* 这个属性的值是一个NSString对象。使用此属性指定的文字效果，如NSTextEffectLetterpressStyle。此属性的默认值为nil，表示没有文本效应。*/
    [mAttStri addAttribute:NSTextEffectAttributeName value:NSTextEffectLetterpressStyle range:NSMakeRange(80, 10)];
    
    
    
#pragma mark ** 15. NSBaselineOffsetAttributeName 设置基线偏移值
    /* 此属性的值是包含一个浮点值的NSNumber对象,表示的字符从基线偏移的NSNumber对象，默认值是0。正值上偏，负值下偏 */
    [mAttStri addAttribute:NSBaselineOffsetAttributeName value:@5 range:NSMakeRange(112, 10)];
    
    
#pragma mark ** 16. NSObliquenessAttributeName 设置字形倾斜度取值为 NSNumber （float）,正值右倾，负值左倾
    /* 此属性的值是包含一个浮点值的NSNumber对象。默认值为0，表示没有倾斜, 正值右倾，负值左倾。 */
    [mAttStri addAttribute:NSObliquenessAttributeName value:@0.8 range:NSMakeRange(135, 15)];
    
    
#pragma mark ** 17. NSExpansionAttributeName 设置文本横向拉伸属性
    /* 取值为 NSNumber(float), 正值横向拉伸文本, 负值横向压缩文本 */
    NSRange range =  [string rangeOfString:@"An association of"];
    [mAttStri addAttribute:NSExpansionAttributeName value:@1.0 range:range];
    
    
    
#pragma mark ** 18. NSWritingDirectionAttributeName 设置文字书写方向
    /**
     * 取值为包含NSNumber对象的数组. 从左向右书写或者从右向左书写.
     *
     * The values of the NSNumber objects should be 0, 1, 2, or 3, for LRE, RLE, LRO, or RLO respectively, and combinations of NSWritingDirectionLeftToRight and NSWritingDirectionRightToLeft with NSTextWritingDirectionEmbedding or NSTextWritingDirectionOverride, as shown in Values of NSWritingDirectionAttributeName and equivalent markup.
     
     */
    NSRange rang2 = [string rangeOfString:@"characters and their"];
    [mAttStri addAttribute:NSWritingDirectionAttributeName value:@[@3] range:rang2];
    
    
    
#pragma mark ** 19. NSVerticalGlyphFormAttributeName 设置文字排版方向
    /**
     * 值为整型NSNumber，0为水平排版的字，1为垂直排版的字。注意,在iOS中, 总是以横向排版
     *
     * In iOS, horizontal text is always used and specifying a different value is undefined.
     */
    [mAttStri addAttribute:NSVerticalGlyphFormAttributeName value:@1 range:NSMakeRange(1, 10)];
    
    
    
#pragma mark ** 20. NSLinkAttributeName 设置链接属性
    /**
     * 此属性的值是NSURL对象（首选）或一个NSString对象。此属性的默认值为nil，表示没有链接。
     * UILabel无法使用该属性, 可以使用UITextView 控件.
     */
    UITextView *textView = [[UITextView alloc] initWithFrame:CGRectMake(20, 450, 320, 60)];
    [self.view addSubview:textView];
    textView.backgroundColor  = [UIColor lightGrayColor];
    
    
    NSString *strLink = @"百度链接";
    NSAttributedString *attStr  = [[NSAttributedString alloc] initWithString:strLink attributes:@{NSLinkAttributeName: [NSURL URLWithString:@"http://www.baidu.com"]}];
    
    textView.editable = NO;
    
    /* 签订协议, 指定代理人之后. 但点击链接时, 会回调协议方法 (- textView:shouldInteractWithURL:inRange:) */
    textView.delegate = self;
    
    textView.attributedText = attStr;
    
    
#pragma mark ** 21. NSAttachmentAttributeName 设置文本附件
    /* 这个属性的值是一个NSTextAttachment对象。此属性的默认值为nil，表示无附件。*/
    
    /**
     * 关于NSTextAttachment类的简单说明
     *
     * NSTextAttachment 类有一个指定的初始化方法(- initWithData:ofType:), 需要指定附件文档的数据和附件文件的类型. 如果附件文档数据指定nil, 那么系统将会默认指定为image对象作为值. 因此, 也可以通过这个特性实现图文混排.
     * 下面就以附件为image对象来说明NSAttachmentAttributeName的使用.
     *
     */
    
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(20, 550, 320, 60)];
    label.backgroundColor = [UIColor yellowColor];
    [self.view addSubview:label];
    
    
    /* 下面实现在百度两个汉字之间插入一个照片 */
    NSString *stiAtt = @"百度";
    
    NSTextAttachment *attach = [[NSTextAttachment alloc] initWithData:nil ofType:nil];
    attach.bounds = CGRectMake(0, 0, 50, 50);
    attach.image = [UIImage imageNamed:@"baidu.jpg"];
    
    NSAttributedString *strAtt = [NSAttributedString attributedStringWithAttachment:attach];
    
    NSMutableAttributedString *strMatt = [[NSMutableAttributedString alloc] initWithString:stiAtt];
    
    [strMatt insertAttributedString:strAtt atIndex:1];
    
    label.attributedText = strMatt;
    
    self.titleLabel.attributedText = mAttStri;
    [self.titleLabel sizeToFit];
    
}


#pragma mark - textView delegate 
- (BOOL)textView:(UITextView *)textView shouldInteractWithURL:(NSURL *)URL inRange:(NSRange)characterRange {
    
    NSLog(@"%s", __func__);
    NSLog(@"url: %@", URL);
    return YES;
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
