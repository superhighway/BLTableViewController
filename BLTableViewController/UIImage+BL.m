#import "UIImage+BL.h"

@implementation UIImage (BL)

+ (UIImage *)onePxImageWithColor:(UIColor *)color {
    return [self imageWithColor:color size:(CGSize){1, 1}];
}

+ (UIImage *)imageWithColor:(UIColor *)color size:(CGSize)size {
    UIImage *img = nil;

    CGRect rect = CGRectMake(0, 0, size.width, size.height);
    UIGraphicsBeginImageContextWithOptions(rect.size, NO, 0);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context,
                                   color.CGColor);
    CGContextFillRect(context, rect);

    img = UIGraphicsGetImageFromCurrentImageContext();

    UIGraphicsEndImageContext();

    return img;
}

@end
