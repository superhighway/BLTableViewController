#import "UIView+LoadFromNib.h"
#import "BLSymbolSectionHeaderView.h"
#import "BLTableViewController.h"
#import "BLSymbolTableViewCell.h"
#import "BLTableHeaderView.h"
#import "BLTableFooterView.h"
#import "BLOptionsSectionHeaderView.h"
#import "BLTableDataOption.h"


@interface BLTableViewController () <
    UITableViewDataSource,
    UITableViewDelegate
>
@property (weak, nonatomic) IBOutlet UITableView *symbolsTableView;
@property (weak, nonatomic) IBOutlet UICollectionView *numbersCollectionView;

@property (strong, nonatomic) BLSymbolSectionHeaderView *sectionHeaderView;
@property (strong, nonatomic) BLOptionsSectionHeaderView *optionsSectionHeaderView;
@end

@implementation BLTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.sectionHeaderView = [BLSymbolSectionHeaderView loadInstanceFromNib];
    self.optionsSectionHeaderView = [BLOptionsSectionHeaderView loadInstanceFromNib];

    self.tableDataHeaderTexts = @[
                                  @"Symbol",
                                  @"Last",
                                  @"Chg",
                                  @"Volume",
                                  @"52 wk",
                                  @"Day Gain",
                                  @[@"P&L", @"SGD"],
                                  @[@"Value", @"SGD"],
                                  @[@"Cost", @"SGD"],
                                  @"Position"
                                 ];

    self.tableDataOptions = @[
                              [[BLTableDataOption alloc] init],
                              [[BLTableDataOption alloc] init],
                              [[BLTableDataOption alloc] init],
                              [[BLTableDataOption alloc] init],
                              [[BLTableDataOption alloc] initWithCellIdentifier:@"BLDotChartCollectionViewCell" sortable:NO],
                              [[BLTableDataOption alloc] init],
                              [[BLTableDataOption alloc] init],
                              [[BLTableDataOption alloc] init],
                              [[BLTableDataOption alloc] init],
                              [[BLTableDataOption alloc] init]
                             ];
    self.tableData = @[
  @[@[@1, @"AAPL:US", @"Apple Inc"], @[@"519.80 USD", @"09:10"], @[@"-0.26%", @"-1.34"], @"7.990M", @80, @[@"-0.26%", @"-25.05"], @[@"+13.50%", @"+1,159.38"], @"9,746.25", @"8,586.88", @[@"15", @"2 lots"]],
  @[@[@(-1), @"VOD:LN", @"Vodafone Group PLC"], @[@"519.80 USD", @"09:10"], @[@"-0.26%", @"-1.34"], @"7.990M", @80, @[@"-0.26%", @"-25.05"], @[@"+13.50%", @"+1,159.38"], @"9,746.25", @"8,586.88", @[@"15", @"2 lots"]],
  @[@[@0, @"AAPL:US", @"Apple Inc"], @[@"519.80 USD", @"09:10"], @[@"-0.26%", @"-1.34"], @"7.990M", @80, @[@"-0.26%", @"-25.05"], @[@"+13.50%", @"+1,159.38"], @"9,746.25", @"8,586.88", @[@"15", @"2 lots"]],
  @[@[@0.8, @"AAPL:US", @"Apple Inc"], @[@"519.80 USD", @"09:10"], @[@"-0.26%", @"-1.34"], @"7.990M", @80, @[@"-0.26%", @"-25.05"], @[@"+13.50%", @"+1,159.38"], @"9,746.25", @"8,586.88", @[@"15", @"2 lots"]]
                  ];

    [self.symbolsTableView registerNib:[UINib nibWithNibName:@"BLSymbolTableViewCell" bundle:nil] forCellReuseIdentifier:@"BLSymbolTableViewCell"];
    self.symbolsTableView.tableHeaderView = [BLTableHeaderView loadInstanceFromNib];
    self.symbolsTableView.tableFooterView = [BLTableFooterView loadInstanceFromNib];
    self.sectionHeaderView.rowData = self.tableDataHeaderTexts;
    [self.symbolsTableView reloadData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark - UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    switch (section) {
        case 0:
            return self.tableData.count;
        default:
            return 0;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    BLSymbolTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"BLSymbolTableViewCell" forIndexPath:indexPath];
    cell.rowOption = self.tableDataOptions;
    cell.rowData = self.tableData[indexPath.row];
    __weak typeof(self) weakSelf = self;
    __weak BLSymbolTableViewCell *weakCell = cell;
    cell.didScroll = ^(BLSymbolTableViewCell *c) {
        NSArray *visibleCells = weakSelf.symbolsTableView.visibleCells;
        CGPoint contentOffset = weakCell.numbersCollectionView.contentOffset;
        for (BLSymbolTableViewCell *vCell in visibleCells) {
            if (vCell != weakCell) {
                vCell.numbersCollectionView.contentOffset = contentOffset;
            }
        }
        weakSelf.sectionHeaderView.numbersCollectionView.contentOffset = contentOffset;
    };
    return cell;
}

#pragma mark - UITableViewDelegate

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    if (section == 1) {
        return self.optionsSectionHeaderView;
    }

    __weak BLSymbolSectionHeaderView *view = self.sectionHeaderView;
    __weak typeof(self) weakSelf = self;
    view.didScroll = ^(BLSymbolSectionHeaderView *v) {
        NSArray *visibleCells = weakSelf.symbolsTableView.visibleCells;
        CGPoint contentOffset = view.numbersCollectionView.contentOffset;
        for (BLSymbolTableViewCell *vCell in visibleCells) {
            vCell.numbersCollectionView.contentOffset = contentOffset;
        }
    };
    return view;
}

@end
