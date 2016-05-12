//
//  YWEmoticonFactory+MFSAttributedString.h
//  TCTIM
//
//  Created by maxfong on 16/5/12.
//  Copyright © 2016年 imfong. All rights reserved.
//

#import <WXOUIModule/YWEmoticonFactory.h>

@interface YWEmoticonFactory (MFSAttributedString)

/**
 *  表情字符串转换表情AttributedString，表情默认大小20px，Label高度可设为22px
 *
 *  @param content          需要转换的字符串
 *  @param attributedString 转换后带表情的attributedString
 */
+ (void)matchEmoticons:(NSString *)content attributedString:(NSMutableAttributedString *)attributedString;

@end
