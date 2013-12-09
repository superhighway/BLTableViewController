@interface BLSymbolSectionHeaderView : UIView
@property (weak, nonatomic) IBOutlet UICollectionView *numbersCollectionView;
@property (weak, nonatomic) IBOutlet UILabel *leftFixedLabel;
@property (strong, nonatomic) NSArray *rowData;
@property (copy, nonatomic) void(^didScroll)(BLSymbolSectionHeaderView *);
@end
