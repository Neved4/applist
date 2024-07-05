// clang -framework Cocoa -o listapps-objc listapps.mm

#import <Cocoa/Cocoa.h>

@interface AppDelegate : NSObject <NSApplicationDelegate>

@property(nonatomic, strong) NSMetadataQuery *query;

@end

@implementation AppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)notification {
  self.query = [[NSMetadataQuery alloc] init];
  self.query.predicate =
      [NSPredicate predicateWithFormat:
                       @"kMDItemContentType == 'com.apple.application-bundle'"];

  self.query.searchScopes = @[
    NSMetadataQueryUserHomeScope, @"/Applications", @"/Library", @"/System",
    @"/Network", @"/usr"
  ];

  [[NSNotificationCenter defaultCenter]
      addObserver:self
         selector:@selector(queryDidFinishGathering:)
             name:NSMetadataQueryDidFinishGatheringNotification
           object:self.query];

  [self.query startQuery];
}

- (void)queryDidFinishGathering:(NSNotification *)notification {
  [self.query stopQuery];

  NSArray *results = [self.query results];
  for (NSMetadataItem *item in results) {
    NSString *path = [item valueForAttribute:(NSString *)kMDItemPath];
    if (path) {
      printf("%s\n", [path UTF8String]);
    }
  }

  [[NSApplication sharedApplication] terminate:self];
}

@end

int main(int argc, const char *argv[]) {
  NSApplication *application = [NSApplication sharedApplication];
  AppDelegate *delegate = [[AppDelegate alloc] init];
  application.delegate = delegate;
  [application run];
  return 0;
}
