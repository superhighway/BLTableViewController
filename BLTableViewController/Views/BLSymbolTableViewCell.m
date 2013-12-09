#import "BLNumbersCollectionViewCell.h"
#import "BLSymbolTableViewCell.h"

@interface BLSymbolTableViewCell () <
    UICollectionViewDataSource,
    UICollectionViewDelegate,
    UICollectionViewDelegateFlowLayout
>

@end

@implementation BLSymbolTableViewCell

- (void)setRowData:(NSArray *)rowData {
    _rowData = rowData;
    NSArray *leftFixedLabelData = rowData[0];
//    self.plIndicatorView.backgroundColor = [UIColor greenColor];
    self.symbolFixedLabel.text = leftFixedLabelData[1];
    self.companyNameFixedLabel.text = leftFixedLabelData[2];
}

- (void)awakeFromNib {
    [super awakeFromNib];
    [self.numbersCollectionView registerNib:[UINib nibWithNibName:@"BLNumbersCollectionViewCell" bundle:nil] forCellWithReuseIdentifier:@"BLNumbersCollectionViewCell"];
}

#pragma mark - UICollectionViewDataSource

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    NSInteger nCols = self.rowData.count-1;
    return nCols;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    BLNumbersCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"BLNumbersCollectionViewCell" forIndexPath:indexPath];
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
