#import "BLNumbersCollectionViewCell.h"

@implementation BLNumbersCollectionViewCell

- (void)prepareForReuse {
    [super prepareForReuse];
    NSInteger labelsCount = self.labels.count;
    for (int i = 0; i < labelsCount; ++i) {
        ((UILabel *)self.labels[i]).text = nil;
    }
}

- (void)bindCellData:(id)cellData {
    if ([cellData isKindOfClass:[NSArray class]]) {
        NSInteger labelsCount = self.labels.count;
        for (int i = 0; i < labelsCount; ++i) {
            ((UILabel *)self.labels[i]).text = cellData[i];
        }
    } else if ([cellData isKindOfClass:[NSString class]]) {
        ((UILabel *)self.labels[0]).text = cellData;
    }
}

@end
