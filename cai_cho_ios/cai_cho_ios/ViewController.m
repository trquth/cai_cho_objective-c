//
//  ViewController.m
//  cai_cho_ios
//
//  Created by mac on 7/26/17.
//  Copyright © 2017 cai_cho. All rights reserved.
//

#import "ViewController.h"
#import "PrintStart.h"
#import "Person.h"

@interface ViewController ()

@end

@implementation ViewController
@synthesize x,name;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //    x = 10; y = 5; name = @"Thien dev";
    //    NSLog(@"%@ call SubNumber method : %d - %d = %d", [self name], x, y, [self subNumber:x :y]);
    //    [self setX:10]; y = 10; [self setName:@"Ti"];
    //    NSLog(@"%@ call AddNumber method : %d + %d = %d", [self name] ,x , y , [self addNumber: x withY: y ]);
    //    PrintStart* printer = [PrintStart new];
    //    [printer PrintCharacter:10 withChar:@"*"];
    [self definePersons];
    [self showPersons:@"Tran" withMonth:3];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(int) subNumber: (int) x : (int) y{
    return x-y;
}

-(int) addNumber: (int) x withY: (int) y{
    return  x + y;
}

-(void) definePersons{
    listPerson = [NSMutableArray new];
    
    Person* person = [Person new];
    [person setUserId:1];
    [person setUserName:@"Thien"];
    [person setDOBFromString:@"11/1/1993"];
    [listPerson addObject:person];
    
    person = [Person new];
    [person setUserId:2];
    [person setUserName:@"Quan"];
    [person setDOBFromString:@"12/2/1993"];
    [listPerson addObject:person];
    
    person = [Person new];
    [person setUserId:3];
    [person setUserName:@"Tran"];
    [person setDOBFromString:@"13/3/1993"];
    [listPerson addObject:person];
    
}

-(void) showPersons: (NSString*) searchUser withMonth: (int) month{
    for (Person* person in listPerson) {
        if ([person containUser:searchUser] && [person getMonthOfDBO] == month) {
            NSLog(@"User= id:%d, name:%@, day of birth:%@", person.userId, person.userName, person.dayOfBirth);

        }
    }
}
@end
