

#import "HumanController.h"
#import "ClothModelController.h"
#import "HumanModelController.h"
#import "ModelGenderController.h"
#import "LoginController.h"

@interface HumanController ()

@end

@implementation HumanController


- (void)viewDidLoad {
    [super viewDidLoad];

    NSString *qrDataHuman = [self.resultQr description];
    
   // ถ้า qrDataHuman == null
    if(!qrDataHuman){
        
/* วิธี นำ session_username ของคนที่loginตอนนี้
        ไปใส่ WS แล้ว SELECT *FROM model WHERE == ของคนที่ session_username นี้ ออกมา  */
        
        userId = @"userId";
        username = @"username";
        gender = @"gender";
        shoulderSize = @"shoulderSize";
        bustSize = @"bustSize";
        hipSize = @"hipSize";
   
        NSLog(@" username testtt %@ ",session_username);
        
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
            
            dictionary = [NSDictionary dictionaryWithObjectsAndKeys:userid_data,userId,username_data,username,gender_data,gender,shoulderSize_data,shoulderSize,bustSize_data,bustSize,hipSize_data,hipSize,nil];
            
            [myObject addObject:dictionary];
            
        }
        
            NSLog(@"userId: %@",userid_data);
            NSLog(@"username: %@",username_data);
            NSLog(@"gender: %@",gender_data);
            NSLog(@"shoulder: %@",shoulderSize_data);
            NSLog(@"bust: %@",bustSize_data);
            NSLog(@"hip: %@",hipSize_data);
        
// แปลงค่าที่ get มา  ที่เป็น string ให้เป็น int แล้ว ส่งไปใช้ต่อ
        
        intShoulder = [shoulderSize_data intValue];
        intHip = [hipSize_data intValue];
        [self createModelFromServer:gender_data intShoulder:intShoulder intHip:intHip];
    }
    
    else{
    NSLog(@"qrDataHuman %@",qrDataHuman);
    //กลับมานี่
    [self createModelFromQR:qrDataHuman];
        
        
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)createModelFromServer:(NSString *)modelGen intShoulder:(NSInteger *)intShoulder intHip:(NSInteger *)intHip{
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
    
// create model
    
    NSArray* modelSplit = [modelText componentsSeparatedByString: @"Hip"];
    NSString* result = [modelSplit objectAtIndex: 1];
    
    NSLog(@"modelSplitfromSERVER =%@",result);
    
    sceneHuman.scene = [SCNScene sceneNamed:result];
    sceneHuman.allowsCameraControl = YES;
    sceneHuman.autoenablesDefaultLighting = YES;
    sceneHuman.backgroundColor = [UIColor groupTableViewBackgroundColor];

    
    NSMutableArray *array = [NSMutableArray array];
    NSString *ch = [result substringWithRange:NSMakeRange(0, 1)];
    [array addObject:ch];
    
    if([ch isEqualToString:@"M"]){
        gender = @"Male";
    }else{
        gender = @"Female";
    }
    
    NSLog(@"genderFromServer %@",gender);

}



-(void)createModelFromQR:(NSString *)modeldata{
    
    modelText = modeldata;
    
    NSLog(@"modelTextจาก model %@ ",modelText);
    
    NSArray* modelSplit = [modeldata componentsSeparatedByString: @"Hip"];
    NSString* result = [modelSplit objectAtIndex: 1];
    
    NSLog(@"modelSplit =%@",result);
    
    model = [NSString stringWithFormat:@"%@.dae",result];
    

    NSMutableArray *array = [NSMutableArray array];
        NSString *ch = [result substringWithRange:NSMakeRange(0, 1)];
        [array addObject:ch];
        NSLog(@"genderFromQR %@",ch);
    
    if([ch isEqualToString:@"M"]){
        gender = @"Male";
    }else{
        gender = @"Female";
    }

    sceneHuman.scene = [SCNScene sceneNamed:model];
    sceneHuman.allowsCameraControl = YES;
    sceneHuman.autoenablesDefaultLighting = YES;
    sceneHuman.backgroundColor = [UIColor groupTableViewBackgroundColor];
    
    NSLog(@"model จาก Qrhuman = %@",model);
    
}


@end
