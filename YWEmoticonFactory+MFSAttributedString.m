//
//  YWEmoticonFactory+MFSAttributedString.m
//  TCTIM
//
//  Created by maxfong on 16/5/12.
//  Copyright © 2016年 imfong. All rights reserved.
//

#import "YWEmoticonFactory+MFSAttributedString.h"

NSUInteger const MFSEmoticonDefaultSize = 20;

@implementation YWEmoticonFactory (MFSAttributedString)

+ (void)matchEmoticons:(NSString *)aString attributedString:(NSMutableAttributedString *)attributedString; {
    if (!aString.length) return;
//    NSString *aString = @"/:^_^/:^$^/:Q/:815/:809/:^O^/:081/:087/:^W^/:814/:^x^/:b/:806/:012/:H/:086/:080/:066/:807/:805/:071/:072/:065/:804/:813/:818/:015/:084/:801/:811/:?/:026/:028/:079/:068/:!/:817/:083/:077/:007/:816/:'""/:802/:027/:(Zz...)/:*&*/:810/:>_</:018/:>O</:020/:044/:819/:085/:067/:O/:069/:076/:>@</:>M</:812/:043/:P/:808/:>W</:073/:008/:803/:074/:O=O/:036/:039/:045/:046/:048/:047/:-F/:lip/:)-(/:8*8/:(OK)/:052/:man/:girl/:-W/:Y/:qp/:$/:%/:(&)/:@/:~B/:U*U/:clock/:R/:C/:plane/:075";
    NSMutableAttributedString *mAttributedString = [[NSMutableAttributedString alloc] initWithString:aString];
    
    NSMutableDictionary *matchEmoticons = [NSMutableDictionary dictionary];
    [YWEmoticonFactory matchEmoticons:aString result:matchEmoticons];
    if (matchEmoticons.count > 0) {
        NSArray *emoticonsInfo = [[YWEmoticonFactory sharedInstance] shareEmoticonsInfoWithType:YWEmoticonTypeStaticImage];
        NSMutableDictionary *emoticonImagesDictionary = [[YWEmoticonFactory sharedInstance] shareEmoticonImagesWithType:YWEmoticonTypeStaticImage];
        
        [matchEmoticons enumerateKeysAndObjectsUsingBlock:^(NSString *key, NSString *obj, BOOL * _Nonnull stop) {
            [emoticonsInfo enumerateObjectsUsingBlock:^(YWEmoticon *emoticon, NSUInteger idx, BOOL * _Nonnull stop) {
                if ([emoticon.emoticon isEqualToString:obj]) {
                    NSMutableDictionary *tmpDict = [NSMutableDictionary dictionary];
                    NSString *rString = [mAttributedString string];
                    [YWEmoticonFactory matchEmoticons:rString result:tmpDict];
                    NSString *aKey = [tmpDict allKeysForObject:obj].firstObject;
                    NSTextAttachment *textAttachment = [[NSTextAttachment alloc] init];
                    
                    UIImage *image = emoticonImagesDictionary[emoticon.fileName];
                    CGSize size = CGSizeMake(MFSEmoticonDefaultSize, MFSEmoticonDefaultSize);
                    UIGraphicsBeginImageContextWithOptions(size, NO, [UIScreen mainScreen].scale);
                    [image drawInRect:CGRectMake(0, 0, size.width, size.height)];
                    UIImage *scaledImage = UIGraphicsGetImageFromCurrentImageContext();
                    UIGraphicsEndImageContext();
                    
                    textAttachment.image = scaledImage;
                    NSAttributedString *replaceString = [NSAttributedString attributedStringWithAttachment:textAttachment];
                    NSRange range = {aKey.intValue, obj.length};
                    [mAttributedString replaceCharactersInRange:range withAttributedString:replaceString];
                    *stop = YES;
                }
            }];
        }];
    }
    [attributedString appendAttributedString:mAttributedString];
}

@end
