//
//  
//  ÇPROJECTNAMEÈ
//
//  Created by ÇFULLUSERNAMEÈ on ÇDATEÈ.
//  Copyright ÇYEARÈ ÇORGANIZATIONNAMEÈ. All rights reserved.
//
//

using System;
using System.Collections.Generic;
using System.Text;
using Cocoa;

namespace ÇPROJECTNAMEÈ
{
    [Register("ApplicationController")]
	class ApplicationController : Cocoa.Object 
    {
        [Connect]
        public Cocoa.Window mainWindow;
        
		public ApplicationController(System.IntPtr a)
            : base(a)
        {
        }
        
        [Export("applicationWillFinishLaunching:")]
        public void FinishLoading(Cocoa.Notification notification)
        {
            Console.WriteLine("Form Loaded");
        }
	}
}