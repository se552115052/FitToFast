

#import "ProductController.h"
NSString *productID = @"";

@interface ProductController ()

@end

@implementation ProductController

@synthesize dataName;
@synthesize dataDetail;
@synthesize dataPrice;
@synthesize dataImage;
@synthesize dataXs;
@synthesize dataS;
@synthesize dataM;
@synthesize dataL;
@synthesize dataXl;

- (void)viewDidLoad {
    [super viewDidLoad];
    [self receiveData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(NSString *)receiveData{
    
    NSString *re;
    productID = [self.productDetail objectForKey:@"typeId"];
    
    self.dataName.text = [self.productDetail objectForKey:@"Name"];
    self.dataDetail.text = [self.productDetail objectForKey:@"Details"];
    self.dataPrice.text = [self.productDetail objectForKey:@"Price"];
    NSURL *url = [NSURL URLWithString:[self.productDetail objectForKey:@"Image"]];
    NSData *data = [NSData dataWithContentsOfURL:url];
    UIImage *img = [[UIImage alloc]initWithData:data];
    
    dataImage.image = img;
    
    
        self.dataXs.text = [self.productDetail objectForKey:@"XS"];
        self.dataS.text = [self.productDetail objectForKey:@"S"];
        self.dataM.text = [self.productDetail objectForKey:@"M"];
        self.dataL.text = [self.productDetail objectForKey:@"L"];
        self.dataXl.text = [self.productDetail objectForKey:@"XL"];
    
    return re;
    
}


@end
