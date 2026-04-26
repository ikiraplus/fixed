#import <AVFoundation/AVFoundation.h>
#import <UIKit/UIKit.h>

__attribute__((constructor))
static void cinemanaAudioFix() {
    // Set audio session
    AVAudioSession *session = [AVAudioSession sharedInstance];
    NSError *error = nil;
    [session setCategory:AVAudioSessionCategoryPlayback
             withOptions:0
                   error:&error];
    [session setActive:YES error:&error];

    // Re-activate audio session when app goes to background
    [[NSNotificationCenter defaultCenter]
        addObserverForName:UIApplicationDidEnterBackgroundNotification
        object:nil
        queue:[NSOperationQueue mainQueue]
        usingBlock:^(NSNotification *note) {
            NSError *err = nil;
            AVAudioSession *s = [AVAudioSession sharedInstance];
            [s setCategory:AVAudioSessionCategoryPlayback error:&err];
            [s setActive:YES error:&err];
        }];

    // Also on resign active
    [[NSNotificationCenter defaultCenter]
        addObserverForName:UIApplicationWillResignActiveNotification
        object:nil
        queue:[NSOperationQueue mainQueue]
        usingBlock:^(NSNotification *note) {
            NSError *err = nil;
            AVAudioSession *s = [AVAudioSession sharedInstance];
            [s setCategory:AVAudioSessionCategoryPlayback error:&err];
            [s setActive:YES error:&err];
        }];
}
