//
//  AppDelegate.h
//  Arfan Rehab

#import <UIKit/UIKit.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (nonatomic, retain, readonly) NSManagedObjectModel *managedObjectModel;
@property (nonatomic, retain, readonly) NSManagedObjectContext *managedObjectContext;
@property (nonatomic, retain, readonly) NSPersistentStoreCoordinator *persistentStoreCoordinator ;

//GLOBAL ARRAY
@property (strong, nonatomic)NSMutableArray *exerciseList;
@property (strong,nonatomic)NSMutableArray *eventArray;
-(NSArray*)getHistory;
@end
