

#import "QrProductController.h"
#import "ReadQRCodeController.h"
#import "LoginController.h"
#import "ReadQRCodeController.h"

@interface QrProductController ()

@end

@implementation QrProductController

- (void)viewDidLoad {
    [super viewDidLoad];

    pId = @"pId";
    typeId = @"typeId";
    Name = @"Name";
    Details = @"Details";
    Price = @"Price";
    Image = @"Image";
    Texture = @"Texture";
    XS = @"XS";
    S= @"S";
    M = @"M";
    L = @"L";
    XL = @"XL";
    
    
    NSLog(@" productQr  %@ ",productQr);

    myObject=[[NSMutableArray alloc]init];
    NSString *urlUser = [NSString stringWithFormat:@"http://fittofast.mrrkh.com/viewEachProduct.php?uu=%@",productQr];
    
    NSData *jsonSource =[NSData dataWithContentsOfURL:[NSURL URLWithString:urlUser]];
    
    
    id jsonObjects = [NSJSONSerialization JSONObjectWithData:jsonSource options:NSJSONReadingMutableContainers error:nil];
    
    for(NSDictionary *dataDict in jsonObjects){
        
        pId_data = [dataDict objectForKey:@"pId"];
        type_data = [dataDict objectForKey:@"typeId"];
        name_data = [dataDict objectForKey:@"Name"];
        detail_data = [dataDict objectForKey:@"Details"];
        price_data = [dataDict objectForKey:@"Price"];
        img_data = [dataDict objectForKey:@"Image"];
        tex_data = [dataDict objectForKey:@"Texture"];
        xs_data = [dataDict objectForKey:@"XS"];
        s_data = [dataDict objectForKey:@"S"];
        m_data = [dataDict objectForKey:@"M"];
        l_data = [dataDict objectForKey:@"L"];
        xl_data = [dataDict objectForKey:@"XL"];
        
        dictionary = [NSDictionary dictionaryWithObjectsAndKeys:pId_data,pId,type_data,typeId,name_data,Name,detail_data,Details,price_data,Price,img_data,Image,xs_data,XS,s_data,S,m_data,M,l_data,L,xl_data,XL, nil];
        
        [myObject addObject:dictionary];
        
    }
    
    NSLog(@"type_data: %@",type_data);
    NSLog(@"name_data: %@",name_data);
    NSLog(@"detail_data: %@",detail_data);
    NSLog(@"price_data: %@",price_data);
    NSLog(@"img_data: %@",img_data);
    NSLog(@"tex_data: %@",tex_data);
    NSLog(@"xs_data: %@",xs_data);
    NSLog(@"s_data: %@",s_data);
    NSLog(@"m_data: %@",m_data);
    NSLog(@"l_data: %@",l_data);
    NSLog(@"xl_data: %@",xl_data);
    
    
    
    productName.text = name_data;
    productDetail.text = detail_data;
    productPrice.text = price_data;
    
    NSURL *url = [NSURL URLWithString:img_data];
    NSData *data = [NSData dataWithContentsOfURL:url];
    UIImage *img = [[UIImage alloc]initWithData:data];
    
    productImg.image = img;
    
    xs.text = xs_data;
    s.text = s_data;
    m.text = m_data;
    l.text = l_data;
    xl.text = xl_data;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
