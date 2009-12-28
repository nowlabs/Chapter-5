#import <Foundation/Foundation.h>

@interface Tire : NSObject
@end //Tire Interface

@implementation Tire

- (NSString *) description 
{
	return @"I am a tire, I last a while";
} //description

@end //Tire

@interface Engine : NSObject
@end //Engine Interface

@implementation Engine

- (NSString *) description
{
	return @"I am an engine, vrroom";
}

@end //Engine

@interface Car : NSObject
{
	Engine *engine;
	Tire *tires[4];
}

- (void) print;

@end //Car Interface

@implementation Car

- (id) init
{
	if (self = [super init]) {
		engine = [Engine new];
		for	(int i = 0; i < 4; i++) {
			tires[i] = [Tire new];
		}
	}
	return self;
} //init

- (void) print
{
	NSLog(@"%@", engine);
	for	(int i = 0; i < 4; i++) {
		NSLog(@"%@", tires[i]);
	}
} //print

@end


int main (int argc, const char * argv[]) {
    Car *car;
	car = [Car new];
	[car print];
    return 0;
}
