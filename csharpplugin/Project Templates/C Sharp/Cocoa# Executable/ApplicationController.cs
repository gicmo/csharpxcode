//
//  
//  �PROJECTNAME�
//
//  Created by �FULLUSERNAME� on �DATE�.
//  Copyright �YEAR� �ORGANIZATIONNAME�. All rights reserved.
//
//

using System;
using System.Collections.Generic;
using System.Text;
using Cocoa;

namespace �PROJECTNAME�
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