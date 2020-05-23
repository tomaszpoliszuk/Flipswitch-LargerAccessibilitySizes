#import <Flipswitch/FSSwitchDataSource.h>
#import <Flipswitch/FSSwitchPanel.h>

@interface LargerAccessibilitySizesSwitch : NSObject <FSSwitchDataSource>
@end

extern "C" BOOL _AXSLargeTextUsesExtendedRange();
extern "C" void _AXSSetLargeTextUsesExtendedRange(BOOL);

@implementation LargerAccessibilitySizesSwitch

- (FSSwitchState)stateForSwitchIdentifier:(NSString *)switchIdentifier
{
	return _AXSLargeTextUsesExtendedRange() ? FSSwitchStateOn : FSSwitchStateOff;
}

- (void)applyState:(FSSwitchState)newState forSwitchIdentifier:(NSString *)switchIdentifier
{
	if (newState == FSSwitchStateIndeterminate)
		return;
	_AXSSetLargeTextUsesExtendedRange(newState == FSSwitchStateOn);
}

@end
