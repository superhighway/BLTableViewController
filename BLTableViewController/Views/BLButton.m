#import <QuartzCore/QuartzCore.h>
#import "BLButton.h"

@implementation BLButton

- (void)awakeFromNib
{
    [super awakeFromNib];
    self.layer.cornerRadius = 2;
}

@end
