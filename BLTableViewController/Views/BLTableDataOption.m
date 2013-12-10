#import "BLTableDataOption.h"

NSString *const BLTableDataOptionTypeCustomCellIdentifier = @"customCellIdentifier";

@implementation BLTableDataOption

- (id)init {
    self = [super init];
    if (self) {
        self.sortable = YES;
    }
    return self;
}

- (id)initWithCellIdentifier:(NSString *)cellIdentifier sortable:(BOOL)sortable {
    self = [self init];
    if (self) {
        self.cellIdentifier = cellIdentifier;
        self.sortable = sortable;
    }
    return self;
}

@end
