# YWEmoticonFactory-MFSAttributedString
阿里云旺表情解析并显示

###使用方法  

```
NSMutableAttributedString *mAttributedString = [[NSMutableAttributedString alloc] init];
[YWEmoticonFactory matchEmoticons:aString attributedString:mAttributedString];
aLabel.attributedText = mAttributedString;
```

###效果  
原展示:  
![Mou icon](image/image1.png)  


修改后：  
![Mou icon](image/image2.png)  