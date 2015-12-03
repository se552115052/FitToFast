
#import "ConnectDB.h"
#import "SQLClient.h"

@interface ConnectDB ()

@end

@implementation ConnectDB

- (void)viewDidLoad
{
    
    NSLog(@"receiveUsername %@",_receiveUsername);
 }

-(NSArray *)viewListProduct{

    SQLClient* client = [SQLClient sharedInstance];
    client.delegate = self;

    [client connect:@"168.1.83.153:780" username:@"SukinoSenze_Athena" password:@"AthenaRanking!" database:@"SukinoSenze_Athena" completion:^(BOOL success) {
      
        if (success)
        {
            
           [client execute:@"SELECT * FROM Inventories" completion:^(NSArray* results) {
               
               // array ทั้งหมด
                productInfo = results;
                NSLog(@" %@",productInfo);
 
//                
//                
//                // array ทั้งหมด
//                
//                viewUserModel = results;
//                
//                NSLog(@"userInfo %@",viewUserModel);
            
                           //แปลงเป็น text ชื่อ data
//                    NSMutableString* data = [[NSMutableString alloc] init];
//                
//                    for (NSArray* table in results)
//                        for (NSDictionary* row in table)
//                            for (NSString* column in row)
//                                [data appendFormat:@"\n%@=%@", column, row[column]];
//                
//                NSLog(@"data %@",data);

//-- ตัดเพื่อให้เหลือแต่ product name
//               NSArray *myWords = [data componentsSeparatedByString:@"\n"];
//               NSLog(@"myWords %@",myWords);
//
//                NSArray* result;
//                NSMutableIndexSet *idx1 = [NSMutableIndexSet indexSet];
//                NSMutableIndexSet *idx2 = [NSMutableIndexSet indexSet];
//
//                for (NSUInteger index=0; index <[myWords count]; index++)
//                {
//                    
//                        if(index==3||index==16||index==29||index==42||index==55){
//                        [idx1 addIndex:index];
//                        }
//                }
//                NSArray *nameProduct=[myWords objectsAtIndexes:idx1];
//                NSLog(@"nameProduct %@",nameProduct);
//                
//                
//--
           
                [client disconnect];

            }];
            
        }
        
    }];
    
    return productInfo;
 //   return t;
}


-(NSString *)viewUserForWeb:(NSString *)username password:(NSString *)password{

    NSLog(@"test receive uesrForWeb");
    NSLog(@"username %@",username);
    NSLog(@"password %@",password);

    
    SQLClient* client = [SQLClient sharedInstance];
    client.delegate = self;

    [client connect:@"168.1.83.153:780" username:@"SukinoSenze_Athena" password:@"AthenaRanking!" database:@"SukinoSenze_Athena" completion:^(BOOL success) {
        
        if (success)
        {
            //where ไม่ได้
            NSString *account = [NSString stringWithFormat:@"SELECT * FROM AspNetUsers WHERE UserName = '%@'",username];
            
           [client execute:account completion:^(NSArray* results) {
            
               NSString *status;
               
                // array ทั้งหมด

               if([[results objectAtIndex:0] count]>0){
                   status =@"correct";
        //       status = [self viewUserForMobile:username password:password];
                   
               }else{
                 //  status =@"incorrect";
                   status = [self viewUserForMobile:username password:password];
                   

               }
               
               
                    userInfoForWeb = status;
               
                [client disconnect];
                
            }];
            
        }else{
            
            userInfoForWeb =[self viewUserForMobile:username password:password];

        }

     }];
 //
    return userInfoForWeb;

}

-(NSString *)viewUserForMobile:(NSString *)username password:(NSString *)password{

    NSLog(@"test receive userForMobile");
    NSLog(@"username %@",username);
    NSLog(@"password %@",password);

    
    SQLClient* client = [SQLClient sharedInstance];
    client.delegate = self;
    
    [client connect:@"168.1.83.153:780" username:@"SukinoSenze_Athena" password:@"AthenaRanking!" database:@"SukinoSenze_Athena" completion:^(BOOL success) {
  
        if (success)
        
    {
        NSString *account = [NSString stringWithFormat:@"SELECT * FROM UsersForMobiles WHERE username = '%@'",username];

        NSLog(@" account %@",account);
        
        [client execute:account completion:^(NSArray* results) {
            
            NSString *status;
            // array ทั้งหมด
            
            if([[results objectAtIndex:0] count]>0){
                status = @"correct";
            }else{
                status = @"incorrect";
            }
            
            userInfoForMobile = status;
            
            NSLog(@"userInfo %@",userInfoForMobile);
            
            [client disconnect];

        }];
        
    }else{
        
        userInfoForMobile = @"incorrect";
        
    }    [NSThread sleepForTimeInterval: 3];

    
}];
    return userInfoForMobile;
}

-(NSString *)insertUserForMobile:(NSString *)username password:(NSString *)password firstname:(NSString *)firstname lassname:(NSString *)lassname{

    
    NSLog(@"receive from registration");
    NSLog(@"username %@",username);
    NSLog(@"password %@",password);
    NSLog(@"firstname %@",firstname);
    NSLog(@"lassname %@",lassname);

    
    SQLClient* client = [SQLClient sharedInstance];
    client.delegate = self;
    
    
    NSString *account = [NSString stringWithFormat:@"INSERT into UsersForMobiles (username,password,fname,lname) value ('%@','%@','%@','%@') ",username,password,firstname,lassname];
    
    NSLog(@" account %@",account);
        
    
    [client connect:@"168.1.83.153:780" username:@"SukinoSenze_Athena" password:@"AthenaRanking!" database:@"SukinoSenze_Athena" completion:^(BOOL success) {
        
        if (success)
        {
            //////// เปลี่ยน เป็นรับมาจากตัวแปร
            [client execute:account completion:^(NSArray* results) {
            
                // array ทั้งหมด
                insertUserInfoForMobile = @"success";
                NSLog(@"userInfo %@",insertUserInfoForMobile);
                
                [client disconnect];
                
            }];
            
        }
        
    }];

    
    return insertUserInfoForMobile;
}
-(NSArray *)viewModel:(NSString *)username{
    
    SQLClient* client = [SQLClient sharedInstance];
    client.delegate = self;
    
    [client connect:@"168.1.83.153:780" username:@"SukinoSenze_Athena" password:@"AthenaRanking!" database:@"SukinoSenze_Athena" completion:^(BOOL success) {
        if (success)
        {
                //where ไม่ได้
            
                [client execute:@"SELECT * FROM models WHERE =" completion:^(NSArray* results) {
                    
                    // array ทั้งหมด
                    
                    viewUserModel = results;
                    
                    NSLog(@"userInfo %@",viewUserModel);
                    
                
                [client disconnect];
                
            }];
            
        }
        
    }];
    
    return viewUserModel;
}


-(NSString *)insertModel:(NSString *)username gender:(NSString *)gender shoulderSize:(NSInteger *)shoulderSize bustSize:(NSInteger *)bustSize hipSize:(NSInteger *)hipSize{
    

    SQLClient* client = [SQLClient sharedInstance];
    client.delegate = self;
    
    [client connect:@"168.1.83.153:780" username:@"SukinoSenze_Athena" password:@"AthenaRanking!" database:@"SukinoSenze_Athena" completion:^(BOOL success) {
        
        if (success)
        {
            //where ไม่ได้
            
            [client execute:@"insert into models (username,gender,shoulderSize,bustSize,hipSize) values ('testt','Male', '14', '36','36')" completion:^(NSArray* results) {
                
                // array ทั้งหมด
                insertUserModel = @"success";

                NSLog(@"userInfo %@",insertUserModel);

                [client disconnect];
                
            }];
        }
    }];

    return insertUserModel;
}

-(NSString *)updateModel:(NSString *)username gender:(NSString *)gender shoulderSize:(NSInteger *)shoulderSize bustSize:(NSInteger *)bustSize hipSize:(NSInteger *)hipSize{
    
    SQLClient* client = [SQLClient sharedInstance];
    client.delegate = self;
    
    [client connect:@"168.1.83.153:780" username:@"SukinoSenze_Athena" password:@"AthenaRanking!" database:@"SukinoSenze_Athena" completion:^(BOOL success) {
        
        if (success)
        {
            //where ไม่ได้ SET ไม่ได้
            
            [client execute:@"update models SET (username,gender,shoulderSize,bustSize,hipSize) values ('testt','Famale', '14', '36','36') WHERE = " completion:^(NSArray* results) {
                
                // array ทั้งหมด
                insertUserModel = @"success";
                
                NSLog(@"userInfo %@",insertUserModel);
                
                [client disconnect];
                
            }];
        }
    }];
    
    return updateUserModel;
}



#pragma mark - SQLClientDelegate

//Required
- (void)error:(NSString*)error code:(int)code severity:(int)severity
{
    NSLog(@"Error #%d: %@ (Severity %d)", code, error, severity);
    [[[UIAlertView alloc] initWithTitle:@"Error" message:error delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil] show];
}

//Optional
- (void)message:(NSString*)message
{
    NSLog(@"Message: %@", message);
}

@end
