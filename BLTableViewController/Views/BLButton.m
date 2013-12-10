#import <QuartzCore/QuartzCore.h>
#import "UIImage+BL.h"
#import "BLButton.h"

@implementation BLButton

- (UIImage *)darkenBackgroundImage {
    static UIImage *_darkenBackgroundImage;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _darkenBackgroundImage = [UIImage onePxImageWithColor:[UIColor colorWithWhite:0.2 alpha:0.3]];
    });
    return _darkenBackgroundImage;
}

- (CGFloat)mainScreenScale {
    static CGFloat _mainScreenScale;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _mainScreenScale = [UIScreen mainScreen].scale;
    });
    return _mainScreenScale;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    self.layer.cornerRadius = 2;
    self.layer.shouldRasterize = YES;
    self.layer.rasterizationScale = [self mainScreenScale];

    [self setBackgroundImage:[self darkenBackgroundImage] forState:UIControlStateHighlighted];
}

@end
