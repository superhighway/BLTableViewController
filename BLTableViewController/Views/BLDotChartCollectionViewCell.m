#import <QuartzCore/QuartzCore.h>
#import "BLDotChartCollectionViewCell.h"

@implementation BLDotChartCollectionViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    self.dotView.layer.cornerRadius = self.dotView.frame.size.width/2;
}

- (void)bindCellData:(id)cellData {
}

@end
