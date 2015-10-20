

#import "ClothModelController.h"
#import "HumanModelController.h"
#import "ModelGenderController.h"
#import "ViewListProduct.h"
#import "HumanController.h"

@interface ClothModelController ()
@end

HumanModelController *model;
UIButton *button;
id jsonObjects;
NSString *sizeClothes = @"";


NSString *type_data;
NSString *tex_data;
NSString *shirt1;
NSString *shirt2;
NSString *shirt3;

@implementation ClothModelController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self showHumanModel];
   
    typeId = @"typeId";
    Image = @"Image";
    Texture = @"Texture";
    
    nNumShirt = 0;
    
    myData=[[NSMutableArray alloc]init];
    NSData *jsonSource =[NSData dataWithContentsOfURL:[NSURL URLWithString:@"http://fittofast.mrrkh.com/viewProduct.php"]];
    
    jsonObjects = [NSJSONSerialization JSONObjectWithData:jsonSource options:NSJSONReadingMutableContainers error:nil];
    
    CGRect buttonFrame = CGRectMake(20, 20,scrollView.frame.size.height-10.0f, 30);
    buttonFrame.size = CGSizeMake(90, 90);

    for(NSDictionary *dataDict in jsonObjects){
        
        type_data = [dataDict objectForKey:@"typeId"];
        NSString *img_data = [dataDict objectForKey:@"Image"];
        tex_data = [dataDict objectForKey:@"Texture"];
   
        
        dic = [NSDictionary dictionaryWithObjectsAndKeys:type_data,typeId,img_data,Image,nil];
        
        [myData addObject:dic];
        
        UIButton *button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        [button setFrame:buttonFrame];
        
       button.tag = [type_data intValue];
   
        
        NSDictionary *tmpDict;
        
        NSMutableString *images;
        images = [NSMutableString stringWithFormat:@"%@ ",
                  [tmpDict objectForKey:Image]];

        NSURL *url = [NSURL URLWithString:[dic objectForKey:@"Image"]];
        NSData *data = [NSData dataWithContentsOfURL:url];
        [button setBackgroundImage:[UIImage imageWithData:data] forState:UIControlStateNormal];
        [button addTarget:self action:@selector(buttonPressed:) forControlEvents:UIControlEventTouchUpInside];
        
        NSString *title = [NSString stringWithFormat:@""];
        [button setTitle:title forState:UIControlStateNormal];
        [scrollView addSubview:button];
        buttonFrame.origin.x+=buttonFrame.size.width+5.0f;

        
    }
    CGSize contentSize = scrollView.frame.size;
    contentSize.width = buttonFrame.origin.x;
    [scrollView setContentSize:contentSize];
    
 /////// gender from server
    NSMutableArray *array = [NSMutableArray array];
    NSString *ch = [result substringWithRange:NSMakeRange(0, 1)];
    [array addObject:ch];
    
    if([ch isEqualToString:@"M"]){
        gender = @"Male";
    }else{
        gender = @"Female";
    }
    
    NSLog(@"genderFromServerololololo %@",gender);
    
  }

- (void)buttonPressed:(UIButton *)button
{

        if (button.tag == 1) {
                if([gender isEqualToString:@"Male"]){
                    typeClothes =@"shortshirtMale";
                }else if([gender isEqualToString:@"Female"]){
                    typeClothes =@"shortshirtFemale";
                }
            NSLog(@"typeclothes  %@",typeClothes);
            }
    
    else if (button.tag == 2) {
        if([gender isEqualToString:@"Male"]){
                    typeClothes =@"tshirtMale";
                }else if([gender isEqualToString:@"Female"]){
                    typeClothes =@"tshirtFemale";
                }
        
        NSLog(@"typeclothes  %@",typeClothes);

            }

    else if (button.tag == 3) {

        if([gender isEqualToString:@"Male"]){
                    typeClothes =@"dressshirtMale";
                }else if([gender isEqualToString:@"Female"]){
                    typeClothes =@"dressshirtFemale";
                }
        
        NSLog(@"typeclothes  %@",typeClothes);

            }
    
}

-(NSString *)showHumanModel{
    NSString *humanModel;
 //Code that receive text and then seperate the text to get the model
    NSArray* modelSplit = [modelText componentsSeparatedByString: @"Hip"];
     result = [modelSplit objectAtIndex: 1];
    
    NSLog(@"modelSplit =%@",result);

    showModel = [NSString stringWithFormat:@"%@.dae",result];
    
    sceneTemp = [SCNScene sceneNamed:showModel];
    sceneModelClothes.allowsCameraControl = YES;
    sceneModelClothes.autoenablesDefaultLighting = YES;
    sceneModelClothes.backgroundColor = [UIColor whiteColor];
    
    sceneModelClothes.scene = sceneTemp;
   
    NSMutableArray *array = [NSMutableArray array];
    NSString *genderModel = [result substringWithRange:NSMakeRange(0, 1)];
    [array addObject:genderModel];

    NSLog(@"genderModel %@",genderModel);

    if([genderModel isEqualToString:@"M"]){
        gender = @"Male";
    }else{
        gender = @"Female";
    }
    
    NSMutableArray *array2 = [NSMutableArray array];
    NSString *ch = [result substringWithRange:NSMakeRange(1, 2)];
    [array2 addObject:ch];
    
    NSLog(@"ch %@",ch);
    if([gender isEqualToString:@"Male"]){
    if([ch isEqualToString:@"XL"]){
        sizeClothes = @"XLM";
    }else{
        sizeClothes = @"SMM";
    }
    }else{
//        if([ch isEqualToString:@"M"]||[ch isEqualToString:@"X"]){
//            sizeClothes = @"XLF";
//        }else{
//            sizeClothes = @"SMF";
//        }
        
        if([ch isEqualToString:@"XL"]){
            sizeClothes = @"XLF";
        }else{
            sizeClothes = @"SMF";
        }
        NSLog(@"ch %@",ch);
        NSLog(@"sizeClothes %@",sizeClothes);


    }
    
    return humanModel;
}

- (IBAction)xsbtn:(id)sender {
    if([typeClothes length]<=0){
        if([gender isEqualToString:@"Male"]){
            typeClothes = @"shortshirtMale";
        }else if([gender isEqualToString:@"Female"]){
            typeClothes = @"shortshirtFemale";
        }
        NSString *size = @"xs";
        [self fitCloth:size];
    }else{
        NSString *size = @"xs";
        [self fitCloth:size];
    }
    
}
- (IBAction)sbtn:(id)sender {
    if([typeClothes length]<=0){
        if([gender isEqualToString:@"Male"]){
            typeClothes = @"shortshirtMale";
        }else if([gender isEqualToString:@"Female"]){
            typeClothes = @"shortshirtFemale";
        }
        NSString *size = @"s";
        [self fitCloth:size];
    }else{
        NSString *size = @"s";
        [self fitCloth:size];
   }
}
- (IBAction)mbtn:(id)sender {
    if([typeClothes length]<=0){
        if([gender isEqualToString:@"Male"]){
            typeClothes = @"shortshirtMale";
        }else if([gender isEqualToString:@"Female"]){
            typeClothes = @"shortshirtFemale";
        }
        NSString *size = @"m";
        [self fitCloth:size];

    }else{
        NSString *size = @"m";
        [self fitCloth:size];
    }
}
- (IBAction)lbtn:(id)sender {
    if([typeClothes length]<=0){
        if([gender isEqualToString:@"Male"]){
            typeClothes = @"shortshirtMale";
            
        }else if([gender isEqualToString:@"Female"]){
            typeClothes = @"shortshirtFemale";
        }
        NSString *size = @"l";
        [self fitCloth:size];

    }else{
        NSString *size = @"l";
        [self fitCloth:size];
   }
}
- (IBAction)xlbtn:(id)sender {
    if([typeClothes length]<=0){
        if([gender isEqualToString:@"Male"]){
            typeClothes = @"shortshirtMale";
  //          NSString *size = @"xlm";
  //          [self fitCloth:size];
        }else if([gender isEqualToString:@"Female"]){
            typeClothes = @"shortshirtFemale";
   //         NSString *size = @"xlf";
   //         [self fitCloth:size];
        }
        NSString *size = @"xl";
        [self fitCloth:size];
    }else{
        NSString *size = @"xl";
        [self fitCloth:size];
    }
}

-(NSString *)fitCloth:(NSString *)clothSize{
    //testใหม่เอาๆๆๆ
    NSLog(@"resultจากfitCloth %@",result);
    
    shirt_type = @[ @"S",@"T",@"L"];
    
    int ct = 0;
    if([typeClothes isEqual:@"tshirtMale"] || [typeClothes isEqual:@"tshirtFemale"]){
        ct=1;
    }
    if([typeClothes isEqual:@"dressshirtMale"] || [typeClothes isEqual:@"dressshirtFemale"]){
        ct=2;
    }
    NSString *sSize = [clothSize uppercaseString];
    strShirtNameSelected = [NSString stringWithFormat:@"%@%@_%@.dae",shirt_type[ct],sSize,sizeClothes];
  
    NSLog(@"รวมstrShirtNameSelected %@",strShirtNameSelected);
    NSLog(@"shirt_type[ct] %@",shirt_type[ct]);
    NSLog(@"sSize %@",sSize);
    NSLog(@"sizeClothes %@",sizeClothes);
    
    clothesText = strShirtNameSelected;
    clothModel= clothesText;
    
    sceneTshirt = [SCNScene sceneNamed:clothesText];
    
/* texture
    textureClothes = [SCNMaterial material];
    textureClothes.diffuse.contents = [UIImage imageNamed:shirt2];
    NSLog(@"Texture %@", shirt2);
    textureClothes.specular.contents = [UIColor whiteColor];
*/
    
    if(nNumShirt!=0)
    [myShirtNode removeFromParentNode];
    myShirtNode = sceneTshirt.rootNode;
    
    [sceneTemp.rootNode addChildNode:myShirtNode];
    nNumShirt = 1;

    return clothModel;
}

- (IBAction)backBtn:(id)sender {
    
    
}

@end
