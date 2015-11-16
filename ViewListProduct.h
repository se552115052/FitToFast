//
//  ViewListProduct.h
//  FitToFast
//
//  Created by Pimpaporn Chaichompoo on 11/16/15.
//  Copyright © 2015 Pimpaporn Chaichompoo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewListProduct : UIViewController<UITableViewDelegate, UITableViewDataSource>
{
    
    NSMutableArray *myObject;
    NSDictionary *dictionary;
    NSString *typeId;
    NSString *Name;
    NSString *Details;
    NSString *Price;
    NSString *Image;
    NSString *Texture;
    NSString *XS;
    NSString *S;
    NSString *M;
    NSString *L;
    NSString *XL;

    
}
@property (nonatomic, strong) IBOutlet UITableView *tableView;

@end
