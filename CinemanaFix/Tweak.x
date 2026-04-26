#import <AVFoundation/AVFoundation.h>
#import <UIKit/UIKit.h>

// Hook 1: Force AVAudioSession to Playback (background audio)
%hook AVAudioSession

- (BOOL)setCategory:(NSString *)category error:(NSError **)outError {
    return %orig(AVAudioSessionCategoryPlayback, outError);
}

- (BOOL)setCategory:(NSString *)category withOptions:(AVAudioSessionCategoryOptions)options error:(NSError **)outError {
    return %orig(AVAudioSessionCategoryPlayback, options, outError);
}

- (BOOL)setCategory:(NSString *)category mode:(NSString *)mode options:(AVAudioSessionCategoryOptions)options error:(NSError **)outError {
    return %orig(AVAudioSessionCategoryPlayback, mode, 0, outError);
}

%end

// Hook 2: Prevent player from pausing when app goes to background
%hook UIApplication

- (void)applicationWillResignActive:(UIApplication *)application {
    // intentionally empty - don't pause
}

%end

// Constructor: activate audio session at launch
%ctor {
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        AVAudioSession *session = [AVAudioSession sharedInstance];
        NSError *error = nil;
        [session setCategory:AVAudioSessionCategoryPlayback error:&error];
        [session setActive:YES error:&error];
    });
}
