Feature: css3-fonts
 Scenario: font 009
   When launch "css3-fonts-app"
     And I go to "fonts/csswg/font-009-manual.htm"
     And I save the page to "font-009"
     And I save the screenshot md5 as "font-009"
    Then file "font-009" of baseline and result should be the same
