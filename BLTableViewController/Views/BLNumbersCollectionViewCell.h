@interface BLNumbersCollectionViewCell : UICollectionViewCell
@property (strong, nonatomic) IBOutletCollection(UILabel) NSArray *labels;

- (void)bindCellData:(id)cellData;
@end
