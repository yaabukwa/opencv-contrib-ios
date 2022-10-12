Pod::Spec.new do |s|
    s.name             = 'opencv-contrib'
    s.version          = '4.6.0'
    s.summary          = 'OpenCV (Computer Vision) for iOS.'
    s.homepage         = 'http://opencv.org'
    s.description      = <<-DESC
                          ## OpenCV: Open Source Computer Vision Library
                          ### Resources
                          * Homepage: <https://opencv.org>
                          * Docs: <https://docs.opencv.org/master/>
                          * Q&A forum: <http://answers.opencv.org>
                          * Issue tracking: <https://github.com/opencv/opencv/issues>
                          ### Contributing
                          Please read the [contribution guidelines](https://github.com/opencv/opencv/wiki/How_to_contribute) before starting work on a pull request.
                          #### Summary of the guidelines:
                          * One pull request per issue;
                          * Choose the right base branch;
                          * Include tests and documentation;
                          * Clean up "oops" commits before submitting;
                          * Follow the [coding style guide](https://github.com/opencv/opencv/wiki/Coding_Style_Guide).
                         DESC
    s.license          = { :type => '3-clause BSD', :text => <<-LICENSE
                         By downloading, copying, installing or using the software you agree to this license.
                         If you do not agree to this license, do not download, install,
                         copy or use the software.
                                                   License Agreement
                                       For Open Source Computer Vision Library
                                               (3-clause BSD License)
                         Copyright (C) 2000-2020, Intel Corporation, all rights reserved.
                         Copyright (C) 2009-2011, Willow Garage Inc., all rights reserved.
                         Copyright (C) 2009-2016, NVIDIA Corporation, all rights reserved.
                         Copyright (C) 2010-2013, Advanced Micro Devices, Inc., all rights reserved.
                         Copyright (C) 2015-2016, OpenCV Foundation, all rights reserved.
                         Copyright (C) 2015-2016, Itseez Inc., all rights reserved.
                         Copyright (C) 2019-2020, Xperience AI, all rights reserved.
                         Third party copyrights are property of their respective owners.
                         Redistribution and use in source and binary forms, with or without modification,
                         are permitted provided that the following conditions are met:
                           * Redistributions of source code must retain the above copyright notice,
                             this list of conditions and the following disclaimer.
                           * Redistributions in binary form must reproduce the above copyright notice,
                             this list of conditions and the following disclaimer in the documentation
                             and/or other materials provided with the distribution.
                           * Neither the names of the copyright holders nor the names of the contributors
                             may be used to endorse or promote products derived from this software
                             without specific prior written permission.
                         This software is provided by the copyright holders and contributors "as is" and
                         any express or implied warranties, including, but not limited to, the implied
                         warranties of merchantability and fitness for a particular purpose are disclaimed.
                         In no event shall copyright holders or contributors be liable for any direct,
                         indirect, incidental, special, exemplary, or consequential damages
                         (including, but not limited to, procurement of substitute goods or services;
                         loss of use, data, or profits; or business interruption) however caused
                         and on any theory of liability, whether in contract, strict liability,
                         or tort (including negligence or otherwise) arising in any way out of
                         the use of this software, even if advised of the possibility of such damage.
                      LICENSE
                   }
    s.authors          = 'https://github.com/opencv/opencv/graphs/contributors'
    s.documentation_url = 'https://docs.opencv.org/master/'
    s.source           = { :http => "https://github.com/IntelAICV/opencv-contrib-ios/releases/download/0.0.1/opencv_contrib-#{s.version.to_s}-ios.zip",
                           :sha256 => 'e8fd75d02b205372b8afcbee303600bce5fea9188025ec75d6970223ed3826c4' }
    s.frameworks       = 'Accelerate', 'AssetsLibrary', 'AVFoundation', 'CoreGraphics', 'CoreImage', 'CoreMedia', 'CoreVideo', 'Foundation', 'QuartzCore', 'UIKit'
    s.swift_version = '5.3'

    s.pod_target_xcconfig = { 'EXCLUDED_ARCHS[sdk=iphonesimulator*]' => 'arm64' }
    s.user_target_xcconfig = { 'EXCLUDED_ARCHS[sdk=iphonesimulator*]' => 'arm64' }
    
    # CocoaPods not to remove framework
    s.preserve_paths = 'opencv2.xcframework'
    # link opencv2 framework
    s.xcconfig = { 'OTHER_LDFLAGS' => '-framework opencv2' }

    s.source_files = 'opencv2.framework/Versions/A/Headers/**/*{.h,.hpp}'
    s.public_header_files = 'opencv2.framework/Versions/A/Headers/**/*{.h,.hpp}'
    s.requires_arc = true
    s.static_framework = true
    #s.header_dir       = 'opencv2'
    #s.header_mappings_dir = 'opencv2.framework/Versions/A/Headers/'
    s.libraries        = 'stdc++'

    # Supported deployment targets
    s.ios.deployment_target  = "9.0"

    # Published binaries
    s.vendored_frameworks = "opencv2.xcframework"

  end
