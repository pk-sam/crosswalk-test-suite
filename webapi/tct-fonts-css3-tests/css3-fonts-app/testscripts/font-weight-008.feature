Feature: css3-fonts
 Scenario: font weight 008
   When launch "css3-fonts-app"
     And I go to "fonts/csswg/font-weight-008-manual.htm"
     And I save the page to "font-weight-008"
     And I save the screenshot md5 as "font-weight-008"
    Then file "font-weight-008" of baseline and result should be the same
