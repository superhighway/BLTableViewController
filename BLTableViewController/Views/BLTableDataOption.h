extern NSString *const BLTableDataOptionTypeCustomCellIdentifier;

@interface BLTableDataOption : NSObject
@property (strong, nonatomic) NSString *cellIdentifier;
@property (nonatomic) BOOL sortable;

- (id)initWithCellIdentifier:(NSString *)cellIdentifier sortable:(BOOL)sortable;
@end

