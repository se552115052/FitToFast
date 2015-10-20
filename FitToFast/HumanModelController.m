

#import "HumanModelController.h"
#import "ModelGenderController.h"
#import "ClothModelController.h"
#import "GenerateQrCodeController.h"
#import "LoginController.h"


NSString *modelText = @"";
NSString *qrData;

@interface HumanModelController ()
@end


@implementation HumanModelController
@synthesize resultQr;
@synthesize intShoulder;
@synthesize intBust;
@synthesize intHip;
@synthesize shoulderSize;
@synthesize hipSize;
@synthesize bustSize;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSLog(@"GENDER HUMAN  %@",gender);
    if(!qrData){
    if([gender isEqualToString:@"Male"]){
        NSString *gendertext = @"Model Male";
        [self genderModel:gendertext];
    }else if([gender isEqualToString:@"Female"]){
        NSString *gendertext = @"Model Female";
        [self genderModel:gendertext];
    }
    }else{
        
    //ลองดูไม่เห็นได้ใช้
    qrData = [self.resultQr description];
    NSLog(@"qrData %@",qrData);
    [self createModelFromQR:qrData];
    }
}

- (IBAction)fitBtn:(id)sender {
    
    if(([strShoulderSize length]<=0)||([strBustSize length]<=0)||([strHipSize length]<=0)){
        [self alertMessage:@"Please fill the number in the blank." :@"Error" :0];
          }
    else{
        NSString *gofit= @"clohtesScene";
        ClothModelController *cs   = (ClothModelController *)[self.storyboard instantiateViewControllerWithIdentifier:gofit];
        [self presentViewController:cs animated:NO completion:nil];
    }
    
    
}

- (IBAction)backgroundTap:(id)sender {
    [self.view endEditing:YES];
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField{
    [textField resignFirstResponder];
    return YES;
}

- (IBAction)shoulderSize:(id)sender {
    [self checkShoulderTextfield];
}
- (IBAction)bustSize:(id)sender {
    [self checkBustTextfield];
}
- (IBAction)hipSize:(id)sender {
    [self checkHipTextfield];
}

-(int *)checkShoulderTextfield{
    
    NSInteger *resultSh;
    strShoulderSize = shoulderSize.text;
    intShoulder = [strShoulderSize intValue];

    if ((intShoulder<14)||(intShoulder>17)) {
        
        [self alertMessage:@"The shoulder size must be between 14 and 17" :@"Shoulder Size Error" :0];
    }
    
    NSLog(@"Allow the shoulder size in range 14-17: %d", intShoulder);
    return resultSh;
    
}
-(int *)checkBustTextfield{
    
    NSInteger *resultBust;
    strBustSize = bustSize.text;
    intBust = [strBustSize intValue];
    
    if ((intBust<32)||(intBust>40)) {
        
        [self alertMessage:@"The bust size must be between 32 and 40" :@"Bust Size Error" :0];
        
    }
    NSLog(@"Allow the bust size in range 32-40: %d", intBust);
    return resultBust;
}
-(int *)checkHipTextfield{

    NSInteger *resultHip;
    strHipSize = hipSize.text;
    intHip = [strHipSize intValue];
    
    if ((intHip<34)||(intHip>42)) {
        
        [self alertMessage:@"The hip size must be between 34 and 42" :@"Hip Size Error" :0];

    }
    NSLog(@"Allow the hip size in range 34-42: %d", intHip);
    return resultHip;
}
-(void)checkQrBtn{
    
    if(([strShoulderSize length]<=0)||([strBustSize length]<=0)||([strHipSize length]<=0)){
       
        [self alertMessage:@"Please fill the number in the blank." :@"Error" :0];

    }
    else{
        NSString *goQRscene = @"qrScene";
        GenerateQrCodeController *qs   = (GenerateQrCodeController *)[self.storyboard instantiateViewControllerWithIdentifier:goQRscene];
        [self presentViewController:qs animated:NO completion:nil];
    }
    
}

-(NSString *)genderModel:(NSString *)genderText{

    NSString *resultGender;
    
    modelLabel.text = genderText;
    if([genderText isEqualToString:@"Model Male"]){
    sceneModel.scene = [SCNScene sceneNamed:@"MXS1.dae"];
    sceneModel.allowsCameraControl = YES;
    sceneModel.autoenablesDefaultLighting = YES;
    sceneModel.backgroundColor = [UIColor groupTableViewBackgroundColor];
    
    resultGender = genderText;

    }else if([genderText isEqualToString:@"Model Female"]){
        
    modelLabel.text = genderText;
    sceneModel.scene = [SCNScene sceneNamed:@"FXS1.dae"];
    sceneModel.allowsCameraControl = YES;
    sceneModel.autoenablesDefaultLighting = YES;
    sceneModel.backgroundColor = [UIColor groupTableViewBackgroundColor];
    
    resultGender = genderText;
    }
    
    NSLog(@"modelLabel = %@",resultGender);
    return resultGender;
}

- (IBAction)generateBtn:(id)sender {
    NSLog(@"generateBtn");
    [self generateHumanModel];
}
- (IBAction)qrBtn:(id)sender {
    [self checkQrBtn];
}

-(NSString *)generateHumanModel{
    
    NSString *model;
    NSLog(@"generateHumanModel");

    strShoulderSize = shoulderSize.text;
    intShoulder = [strShoulderSize intValue];
    strBustSize = bustSize.text;
    intBust = [strBustSize intValue];
    strHipSize = hipSize.text;
    intHip = [strHipSize intValue];
    
    if(([strShoulderSize length]<=0)||([strBustSize length]<=0)||([strHipSize length]<=0)){
        
        [self alertMessage:@"Please fill the number in the blank." :@"Error" :0];
        
    }else if ((intShoulder<14)||(intShoulder>17)) {
        
        [self alertMessage:@"The shoulder size must be between 14 and 17" :@"Shoulder Size Error" :0];
    
    }else if ((intBust<32)||(intBust>40)) {
        
        [self alertMessage:@"The bust size must be between 32 and 40" :@"Bust Size Error" :0];
        
    }else if ((intHip<34)||(intHip>42)) {
        
        [self alertMessage:@"The hip size must be between 34 and 42" :@"Hip Size Error" :0];

    }
    
    else{
        
        [self model:gender intS:&(intShoulder) intH:&(intHip)];
    }
        return model;
    
}

-(void)createModelFromQR:(NSString *)modeldata{

    NSLog(@"result จาก createModelFromQR %@",modeldata);
    
    
    NSArray* modelSplit = [modeldata componentsSeparatedByString: @"Hip"];
    NSString *result = [modelSplit objectAtIndex: 1];
    
    NSLog(@"modelSplit =%@",result);
    
    NSString *showModel = [NSString stringWithFormat:@"%@.dae",result];
    
    sceneModel.scene = [SCNScene sceneNamed:showModel];
    sceneModel.allowsCameraControl = YES;
    sceneModel.autoenablesDefaultLighting = YES;
    sceneModel.backgroundColor = [UIColor whiteColor];
    
    
    NSMutableArray *array = [NSMutableArray array];
    NSString *ch = [result substringWithRange:NSMakeRange(1, 2)];
    [array addObject:ch];
    NSLog(@"ch  %@",ch);
    
    if([gender isEqualToString:@"Male"]){
        if([ch isEqualToString:@"XL"]){
            sizeClothes = @"XLM";
        }else{
            sizeClothes = @"SMM";
        }
    }else{
        if([ch isEqualToString:@"M"]||[ch isEqualToString:@"X"]){
            sizeClothes = @"XLF";
        }else{
            sizeClothes = @"SMF";
        }
    }

    

}

-(void)model:(NSString *)modelGen intS:(NSInteger *)intSh intH:(NSInteger *)intH{
    
    NSString *model;
    
    NSLog(@"session username %@",session_username);
    
    NSLog(@"int shoulder  %d",intShoulder);
    NSLog(@"int hip  %d",intHip);
    NSLog(@"modelGen  %@", modelGen);
    
    
    //Male
    
    if([modelGen isEqual: @"Male"]){
        if(14<=intShoulder&&intShoulder<=15){
            
            if(34<=intHip&&intHip<=35){
                modelText = @"Shoulder14-15 HipMXS1";
            }
            else if (36<=intHip&&intHip<=37){
                modelText = @"Shoulder14-15 HipMXS2";
            }
            else if (38<=intHip&&intHip<=39){
                modelText = @"Shoulder14-15 HipMXS3";
            }
            else if (40<=intHip&&intHip<=41){
                modelText = @"Shoulder14-15 HipMXS4";
            }
            else if (intHip==42){
                modelText = @"Shoulder14-15 HipMXS5";
            }
            
        }
        
        if(15<=intShoulder&&intShoulder<=16){
            
            if(34<=intHip&&intHip<=35){
                modelText = @"Shoulder15-16 HipMM1";
            }
            else if (36<=intHip&&intHip<=37){
                modelText = @"Shoulder15-16 HipMM2";
            }
            
            else if (38<=intHip&&intHip<=39){
                modelText = @"Shoulder15-16 HipMM3";
            }
            else if (40<=intHip&&intHip<=41){
                modelText = @"Shoulder15-16 HipMM4";
            }
            else if (intHip==42){
                modelText = @"Shoulder15-16 HipMM5";
            }
            
        }
        
        if(16<=intShoulder&&intShoulder<=17){
            
            if(34<=intHip&&intHip<=35){
                modelText = @"Shoulder16-17 HipMXL1";
            }
            else if (36<=intHip&&intHip<=37){
                modelText = @"Shoulder16-17 HipMXL2";
            }
            
            else if (38<=intHip&&intHip<=39){
                modelText = @"Shoulder16-17 HipMXL3";
            }
            else if (40<=intHip&&intHip<=41){
                modelText = @"Shoulder16-17 HipMXL4";
            }
            else if (intHip==42){
                modelText = @"Shoulder16-17 HipMXL5";
            }
            
        }
    }
    //Female
    else if([modelGen isEqual:@"Female"]){
        
        if(14<=intShoulder&&intShoulder<=15){
            
            if(34<=intHip&&intHip<=35){
                modelText = @"Shoulder14-15 HipFXS1";
            }
            else if (36<=intHip&&intHip<=37){
                modelText = @"Shoulder14-15 HipFXSF2";
            }
            else if (38<=intHip&&intHip<=39){
                modelText = @"Shoulder14-15 HipFXS3";
            }
            else if (40<=intHip&&intHip<=41){
                modelText = @"Shoulder14-15 HipFXS4";
            }
            else if (intHip==42){
                modelText = @"Shoulder14-15 HipFXS5";
            }
            
        }
        
        if(15<=intShoulder&&intShoulder<=16){
            
            if(34<=intHip&&intHip<=35){
                modelText = @"Shoulder15-16 HipFM1";
            }
            else if (36<=intHip&&intHip<=37){
                modelText = @"Shoulder15-16 HipFM2";
            }
            
            else if (38<=intHip&&intHip<=39){
                modelText = @"Shoulder15-16 HipFM3";
            }
            else if (40<=intHip&&intHip<=41){
                modelText = @"Shoulder15-16 HipFM4";
            }
            else if (intHip==42){
                modelText = @"Shoulder15-16 HipFM5";
            }
            
        }
        
        if(16<=intShoulder&&intShoulder<=17){
            
            if(34<=intHip&&intHip<=35){
                modelText = @"Shoulder16-17 HipFXL1";
            }
            else if (36<=intHip&&intHip<=37){
                modelText = @"Shoulder16-17 HipFXL2";
            }
            else if (38<=intHip&&intHip<=39){
                modelText = @"Shoulder16-17 HipFXL3";
            }
            else if (40<=intHip&&intHip<=41){
                modelText = @"Shoulder16-17 HipFXL4";
            }
            else if (intHip==42){
                modelText = @"Shoulder16-17 HipFXL5";
            }
            
        }
    }
    NSArray* modelSplit = [modelText componentsSeparatedByString: @"Hip"];
    NSString* result = [modelSplit objectAtIndex: 1];
    
    sceneModel.scene = [SCNScene sceneNamed:result];
    NSLog(@" test %@",result);
    
    //check คน
  
    userId = @"userId";
    username = @"username";
    genderModel = @"gender";
    shoulderSizecheck = @"shoulderSize";
    bustSizecheck = @"bustSize";
    hipSizecheck = @"hipSize";
    
    NSLog(@" username testtt before sent %@ ",session_username);
    
    myObject=[[NSMutableArray alloc]init];
    NSString *urlUser = [NSString stringWithFormat:@"http://fittofast.mrrkh.com/viewUserModel.php?uu=%@",session_username];
    
    NSData *jsonSource =[NSData dataWithContentsOfURL:[NSURL URLWithString:urlUser]];
    
    
    id jsonObjects = [NSJSONSerialization JSONObjectWithData:jsonSource options:NSJSONReadingMutableContainers error:nil];
    
    for(NSDictionary *dataDict in jsonObjects){
        
        userid_data = [dataDict objectForKey:@"userId"];
        username_data = [dataDict objectForKey:@"username"];
        gender_data = [dataDict objectForKey:@"gender"];
        shoulderSize_data = [dataDict objectForKey:@"shoulderSize"];
        bustSize_data = [dataDict objectForKey:@"bustSize"];
        hipSize_data = [dataDict objectForKey:@"hipSize"];
        NSLog([dataDict objectForKey:@"lnx"]);
        
        dictionary = [NSDictionary dictionaryWithObjectsAndKeys:userid_data,userId,username_data,username,gender_data,genderModel,shoulderSize_data,shoulderSizecheck,bustSize_data,bustSizecheck,hipSize_data,hipSizecheck,nil];
        
        [myObject addObject:dictionary];
        
    }
    
    NSLog(@"userId: %@",userid_data);
    NSLog(@"username: %@",username_data);
    NSLog(@"gender: %@",gender_data);
    NSLog(@"shoulder: %@",shoulderSize_data);
    NSLog(@"bust: %@",bustSize_data);
    NSLog(@"hip: %@",hipSize_data);
    
    
//ถ้าค่า ว่าง
    if(!gender_data){
        NSLog(@"inserttt");
    NSLog(@"session username %@",session_username);
    NSLog(@"gender %@",gender);
    NSLog(@"txtShoulder %d",intShoulder);
    NSLog(@"txtBust %d",intBust);
    NSLog(@"txtHip %d",intHip);

        NSString *post =[[NSString alloc] initWithFormat:@"username=%@&gender=%@&shoulderSize=%d&bustSize=%d&hipSize=%d",session_username,gender,intShoulder,intBust,intHip];
    
        NSLog(@"PostData: %@",post);
        
        NSURL *url=[NSURL URLWithString:@"http://fittofast.mrrkh.com/insertUserModel.php"];
        
        NSData *postData = [post dataUsingEncoding:NSASCIIStringEncoding allowLossyConversion:YES];
        
        NSString *postLength = [NSString stringWithFormat:@"%lu", (unsigned long)[postData length]];
        
        NSMutableURLRequest *request = [[NSMutableURLRequest alloc] init];
        [request setURL:url];
        [request setHTTPMethod:@"POST"];
        [request setValue:postLength forHTTPHeaderField:@"Content-Length"];
        [request setValue:@"application/json" forHTTPHeaderField:@"Accept"];
        [request setValue:@"application/x-www-form-urlencoded" forHTTPHeaderField:@"Content-Type"];
        [request setHTTPBody:postData];
                
        NSError *error = [[NSError alloc] init];
        NSHTTPURLResponse *response = nil;
        NSData *urlData=[NSURLConnection sendSynchronousRequest:request returningResponse:&response error:&error];
        
        NSLog(@"Response code: %ld", (long)[response statusCode]);
    
    
        if ([response statusCode] >= 200 && [response statusCode] < 300)
        {
            NSString *responseData = [[NSString alloc]initWithData:urlData encoding:NSUTF8StringEncoding];
            NSLog(@"Response ==> %@", responseData);
     
            
        }
    }
 
    //update ถ้าช่องไซส์ไม่ว่าง   WS ผิด
    
    else{
    
        NSLog(@"update ถ้าช่องไซส์ไม่ว่าง   WS ผิด");
        
        NSString *post =[[NSString alloc] initWithFormat:@"username=%@&gender=%@&shoulderSize=%d&bustSize=%d&hipSize=%d",session_username,gender,intShoulder,intBust,intHip];
  
    NSLog(@"PostData: %@",post);
        
        NSString *urlUser = [NSString stringWithFormat:@"http://fittofast.mrrkh.com/updateUserModel.php?uu=%@",session_username];
    
 //   NSURL *url=[NSURL URLWithString:@"http://fittofast.mrrkh.com/updateUserModel.php"];
    
        NSURL *url=[NSURL URLWithString:urlUser];
        
    NSData *postData = [post dataUsingEncoding:NSASCIIStringEncoding allowLossyConversion:YES];
    
    NSString *postLength = [NSString stringWithFormat:@"%lu", (unsigned long)[postData length]];
    
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] init];
    [request setURL:url];
    [request setHTTPMethod:@"POST"];
    [request setValue:postLength forHTTPHeaderField:@"Content-Length"];
    [request setValue:@"application/json" forHTTPHeaderField:@"Accept"];
    [request setValue:@"application/x-www-form-urlencoded" forHTTPHeaderField:@"Content-Type"];
    [request setHTTPBody:postData];
    
    NSError *error = [[NSError alloc] init];
    NSHTTPURLResponse *response = nil;
    NSData *urlData=[NSURLConnection sendSynchronousRequest:request returningResponse:&response error:&error];
    
    NSLog(@"Response code: %ld", (long)[response statusCode]);
    
    
    if ([response statusCode] >= 200 && [response statusCode] < 300)
    {
        NSString *responseData = [[NSString alloc]initWithData:urlData encoding:NSUTF8StringEncoding];
        NSLog(@"Response ==> %@", responseData);
        //
        //            NSArray* foo = [responseData componentsSeparatedByString: @"&&"];
        //            NSString* result = [foo objectAtIndex: 1];
        
        
    }
  
    

    
NSLog(@"modelText = %@",modelText);

}
    
}

- (void) alertMessage:(NSString *)msg :(NSString *)title :(int) tag
{
    alert = [[UIAlertView alloc] initWithTitle:title
                                                        message:msg
                                                       delegate:self
                                              cancelButtonTitle:@"Ok"
                                              otherButtonTitles:nil, nil];
    alert.tag = tag;
    [alert show];
}

@end
