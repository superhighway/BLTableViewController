@interface BLSymbolTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UICollectionView *numbersCollectionView;
@property (strong, nonatomic) NSArray *rowOption;
@property (strong, nonatomic) NSArray *rowData;
@property (weak, nonatomic) IBOutlet UIView *plIndicatorView;
@property (weak, nonatomic) IBOutlet UILabel *symbolFixedLabel;
@property (weak, nonatomic) IBOutlet UILabel *companyNameFixedLabel;
@property (copy, nonatomic) void(^didScroll)(BLSymbolTableViewCell *);
@end
