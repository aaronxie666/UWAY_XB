//
//  Public.h
//  UWAY_XB
//
//  Created by Chang on 2019/8/12.
//  Copyright © 2019 Chang. All rights reserved.
//

#ifndef Public_h
#define Public_h
FOUNDATION_EXPORT NSString * strValueForPublish;

//define screen size
#define screen_width [UIScreen mainScreen].bounds.size.width
#define screen_height [UIScreen mainScreen].bounds.size.height

//define color
#define RGBA(r, g, b, a)                    [UIColor colorWithRed:r/255.0f green:g/255.0f blue:b/255.0f alpha:a]

#define RGB(r, g, b)                        RGBA(r, g, b, 1.0f)

#define navigationBarColor RGB(255, 255, 255)
#define separaterColor RGB(200, 199, 204)
#define cancelColor RGB(16, 16, 16)






#endif /* Public_h */
