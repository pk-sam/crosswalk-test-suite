Feature: css3-text
 Scenario: CSS3TextEffects text transform none
   When launch "css3-text-app"
     And I go to "text/csswg/text-transform-004.html"
     And I save the page to "text-transform-004"
     And I save the screenshot md5 as "text-transform-004"
    Then file "text-transform-004" of baseline and result should be the same
