#import "UIView+LoadFromNib.h"

@implementation UIView (LoadFromNib)

+ (id)loadInstanceFromNib {
    return [self loadInstanceFromNibNamed:NSStringFromClass([self class])];
}

+ (id)loadInstanceFromNibNamed:(NSString*)nibName {
    UIView *result = nil;
    NSArray *elements = [[NSBundle mainBundle] loadNibNamed:nibName owner:nil options:nil];
    for (id anObject in elements) {
        if ([anObject isKindOfClass:[self class]]) {
            result = anObject;
            break;
        }
    }
    return result;
}

@end
