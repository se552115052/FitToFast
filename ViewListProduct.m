//
//  ViewListProduct.m
//  FitToFast
//
//  Created by Pimpaporn Chaichompoo on 11/16/15.
//  Copyright © 2015 Pimpaporn Chaichompoo. All rights reserved.
//

#import "ViewListProduct.h"
#import "ProductController.h"
#import "ViewController.h"
@interface ViewListProduct ()

@end

@implementation ViewListProduct    

@synthesize tableView;
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"showRecipeDetail"]) {
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        ProductController *destViewController = segue.destinationViewController;
        destViewController.productDetail = [myObject objectAtIndex:indexPath.row];
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
    typeId = @"typeId";
    Name = @"Name";
    Details = @"Details";
    Price = @"Price";
    Image = @"Image";
    Texture = @"Texture";
    XS = @"XS";
    S = @"S";
    M = @"M";
    L  = @"L";
    XL = @"XL";
    myObject=[[NSMutableArray alloc]init];
    NSData *jsonSource =[NSData dataWithContentsOfURL:[NSURL URLWithString:@"http://fittofast.mrrkh.com/viewProduct.php"]];
    
    id jsonObjects = [NSJSONSerialization JSONObjectWithData:jsonSource options:NSJSONReadingMutableContainers error:nil];
    
    for(NSDictionary *dataDict in jsonObjects){
        
        NSString *type_data = [dataDict objectForKey:@"typeId"];
        NSString *name_data = [dataDict objectForKey:@"Name"];
        NSString *detail_data = [dataDict objectForKey:@"Details"];
        NSString *price_data = [dataDict objectForKey:@"Price"];
        NSString *img_data = [dataDict objectForKey:@"Image"];
        NSString *tex_data = [dataDict objectForKey:@"Texture"];
        NSString *xs_data = [dataDict objectForKey:@"XS"];
        NSString *s_data = [dataDict objectForKey:@"S"];
        NSString *m_data = [dataDict objectForKey:@"M"];
        NSString *l_data = [dataDict objectForKey:@"L"];
        NSString *xl_data = [dataDict objectForKey:@"XL"];
        
        
        NSLog(@"TypeId: %@",type_data);
        NSLog(@"Name: %@",name_data);
        NSLog(@"Detail: %@",detail_data);
        NSLog(@"Price: %@",price_data);
        NSLog(@"Image: %@",img_data);
        NSLog(@"Texture: %@",tex_data);
        NSLog(@"XS: %@",xs_data);
        NSLog(@"S: %@",s_data);
        NSLog(@"M: %@",m_data);
        NSLog(@"L: %@",l_data);
        NSLog(@"XL: %@",xl_data);
        
        dictionary = [NSDictionary dictionaryWithObjectsAndKeys:type_data,typeId,name_data,Name,detail_data,Details,price_data,Price,img_data,Image,xs_data,XS,s_data,S,m_data,M,l_data,L,xl_data,XL, nil];
        
        [myObject addObject:dictionary];
    }
    UIBarButtonItem *btn = [[UIBarButtonItem alloc] initWithTitle:@"Back" style:UIBarButtonItemStyleBordered target:self action:@selector(backPressed:)];
    self.navigationItem.leftBarButtonItem = btn;
}
-(void)backPressed: (id)sender
{
    NSString *gotomain = @"mainView";
    ViewController *m   = (ViewController *)[self.storyboard instantiateViewControllerWithIdentifier:gotomain];
    [self presentViewController:m animated:NO completion:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [myObject count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *simpleTableIdentifier = @"RecipeCell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:simpleTableIdentifier];
    }
    
    NSDictionary *tmpDict = [myObject objectAtIndex:indexPath.row];
    
    NSMutableString *type;
    type = [NSMutableString stringWithFormat:@"%@",
            [tmpDict objectForKeyedSubscript:typeId]];
    
    NSMutableString *name;
    name = [NSMutableString stringWithFormat:@"%@",
            [tmpDict objectForKeyedSubscript:Name]];
    
    NSMutableString *detail;
    detail = [NSMutableString stringWithFormat:@"Details: %@ ",
              [tmpDict objectForKey:Details]];
    
    NSMutableString *price;
    price = [NSMutableString stringWithFormat:@"Price: %@ ",
             [tmpDict objectForKey:Price]];
    
    NSMutableString *images;
    images = [NSMutableString stringWithFormat:@"%@ ",
              [tmpDict objectForKey:Image]];
    
    NSMutableString *xs;
    xs = [NSMutableString stringWithFormat:@"XS: %@ ",
          [tmpDict objectForKey:XS]];
    NSMutableString *s;
    s = [NSMutableString stringWithFormat:@"S: %@ ",
         [tmpDict objectForKey:S]];
    NSMutableString *m;
    m = [NSMutableString stringWithFormat:@"M: %@ ",
         [tmpDict objectForKey:M]];
    NSMutableString *l;
    l = [NSMutableString stringWithFormat:@"L: %@ ",
         [tmpDict objectForKey:L]];
    NSMutableString *xl;
    xl = [NSMutableString stringWithFormat:@"XL: %@ ",
          [tmpDict objectForKey:XL]];
    
    NSURL *url = [NSURL URLWithString:[tmpDict objectForKey:Image]];
    NSData *data = [NSData dataWithContentsOfURL:url];
    UIImage *img = [[UIImage alloc]initWithData:data];
    
    
    cell.textLabel.text = name;
    cell.detailTextLabel.text= detail;
    cell.imageView.frame = CGRectMake(0, 0, 70, 60);
    cell.imageView.image =img;
    
    return cell;
}


@end
