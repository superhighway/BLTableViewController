#import "BLTableDataOption.h"
#import "BLNumbersCollectionViewCell.h"
#import "BLSymbolTableViewCell.h"

@interface BLSymbolTableViewCell () <
    UICollectionViewDataSource,
    UICollectionViewDelegate,
    UICollectionViewDelegateFlowLayout
>
@property (nonatomic, strong) NSString *defaultNumbersCellIdentifier;
@end

@implementation BLSymbolTableViewCell

- (void)setRowOption:(NSArray *)rowOption {
    _rowOption = rowOption;

    for (BLTableDataOption *opt in rowOption) {
        if (opt.cellIdentifier) {
            [self.numbersCollectionView registerNib:[UINib nibWithNibName:opt.cellIdentifier bundle:nil]
                         forCellWithReuseIdentifier:opt.cellIdentifier];
        }
    }
}

- (void)setRowData:(NSArray *)rowData {
    _rowData = rowData;
    NSArray *leftFixedLabelData = rowData[0];
//    self.plIndicatorView.backgroundColor = [UIColor greenColor];
    self.symbolFixedLabel.text = leftFixedLabelData[1];
    self.companyNameFixedLabel.text = leftFixedLabelData[2];
}

- (void)awakeFromNib {
    [super awakeFromNib];
    self.defaultNumbersCellIdentifier = @"BLNumbersCollectionViewCell";
    [self.numbersCollectionView registerNib:[UINib nibWithNibName:self.defaultNumbersCellIdentifier bundle:nil]
                 forCellWithReuseIdentifier:self.defaultNumbersCellIdentifier];
}

#pragma mark - UICollectionViewDataSource

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    NSInteger nCols = self.rowData.count-1;
    return nCols;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    NSString *cellIdentifier = [self.rowOption[indexPath.row] cellIdentifier];
    if (!cellIdentifier) cellIdentifier = self.defaultNumbersCellIdentifier;

    BLNumbersCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:cellIdentifier forIndexPath:indexPath];
    [cell bindCellData:self.rowData[indexPath.row+1]];
    return cell;
}

#pragma mark - UIScrollViewDelegate

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    if (scrollView == self.numbersCollectionView) {
        if (self.didScroll) {
            self.didScroll(self);
        }
    }
}

@end
